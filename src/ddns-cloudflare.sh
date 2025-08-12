#!/bin/bash
# This script updates a Cloudflare DNS record with the current public IP address if it has changed.
# It stores any updated address in a file at /tmp/nasip.txt. It checks this file to determine if the 
# address has changed. If so it looks up the DNS record ID and uses this to update the record
# with the new IP address. 
# Exits with a 1 status code if the address has changed and the DNS record has been updated.
# Exits with a 0 status code if the address has not changed
set -e

# You must set the following environment variables below to run this script
export ZONE_ID=""
export CLOUDFLARE_API_KEY=""
export DNS_HOST_NAME=""
export DNS_DOMAIN_NAME=""

# you do not need to change anything below this line. If you want to contribute see Contributing in the README.md

# check if required environment variables are set
if [ -z "$ZONE_ID" ] || [ -z "$CLOUDFLARE_API_KEY" ] || [ -z "$DNS_HOST_NAME" ] || [ -z "$DNS_DOMAIN_NAME" ]; then
  echo "ERROR: Required environment variables are not set. Please set ZONE_ID, CLOUDFLARE_API_KEY, DNS_HOST_NAME, and DNS_DOMAIN_NAME."
  exit 1
fi

# get the IP address from the last update
# if the file does not exist, assume the last IP was 1.1.1.1
IP_FILE="/tmp/nasip.txt" # current address
LAST_IP=""
if [ -z "$IP_FILE" ]; then
  LAST_IP=$(cat "$IP_FILE")
else
  LAST_IP="1.1.1.1"
fi

# get the current IP address from Cloudflare
CURRENT_IP=$(curl -s http://cloudflare.com/cdn-cgi/trace | awk -F'=' '/ip=/ { print $2 }')

# check if the current IP is different from the last IP
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
  # update the file with the current IP
  echo "$CURRENT_IP" > "$IP_FILE"

  # get the DNS record list for the domain
  curl -s -o "/tmp/idresult" "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    --header 'Authorization: Bearer '"$CLOUDFLARE_API_KEY"
  RESULT=$(jq .success /tmp/idresult)
  if [ "$RESULT" = "true" ]; then
    # get the DNS record ID for the specified host name
	  DNS_RECORD_ID=$(jq -r '.result[] | select(.name == "'"$DNS_HOST_NAME.$DNS_DOMAIN_NAME"'" ).id' /tmp/idresult)
  else
    echo "ERROR: Failed to get DNS record ID from Cloudflare. Diagnostic information below..."
    cat /tmp/idresult
    exit 1
  fi
  RESULT=""

  # update the DNS record with the new IP address
  curl -s -o "/tmp/dnsrequest" "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID" --request PUT \
    --header 'Authorization: Bearer '"$CLOUDFLARE_API_KEY" \
    --data '{
          "name": "'"$DNS_HOST_NAME"'",
          "ttl": 3600,
          "type": "A",
          "comment": "'"Updated by $HOSTNAME on `date`"'",
          "content": "'"$CURRENT_IP"'",
          "proxied": false
        }'
  RESULT=$(jq .success /tmp/dnsrequest)
  if [ "$RESULT" = "true" ]; then
    echo "SUCCESS: IP address changed from $LAST_IP to $CURRENT_IP"
  else
    echo "ERROR: Failed to update DNS record from $LAST_IP to $CURRENT_IP. Diagnostic information below..."
    cat /tmp/dnsrequest
  fi
  exit 1

else
  exit 0
fi
