# cloudflare-ddns
Direct Dynamic DNS for Cloudflare from Synology

## Purpose
This script is designed to run under the task scheduler that comes with Synology NAS DDNS. 

## Features
- No external scripts
- No third party sites or script required
- No dependancies

It can entirely be configured through the management interface of a Synology NAS

Cloudflare provide instructions on how to implement DDNS directly with them through API calls [here](https://developers.cloudflare.com/api/resources/dns/subresources/records/methods/update/). This is script implements that interface.

## Requirements
- Currently active DNS domain hosted on Cloudflare
- Zone API Key (instructions below)
- Zone ID (instructions below)
- DDNS record (instructions below)

## Steps

Login to Cloudflare
Select your DNS Zone to see the overview page
Scroll to the bottom of the page and copy the Zone ID. This will be represented as <ZONEID>.
Select Get your API token
Select Create Token
Select Use Template for Edit zone DNS
Under Zone Resources select your DNS domain on the right if not already shown.
Select Continue to summary
Select Create Token

# Zone API Key

Create an API Key if you dont have one already for your DNS zone.


Click Copy next to the white box with the token in it. This is the only time it will be displayed so make sure you copy it somewhere and save it. This will be represented as <APIKEY>.

Create a DNS record to be updated when your IP address changes (skip if you already have a A record for this)

Login to Cloudflare
Select your DNS Zone to see the overview page
On the right Select DNS Records
Select Add Record
Type should be set to A
Name is the hostname youto use for this. Mine was nas but it can be whatever you like. No spaces allowed only a dash if you need one. This will be reprented as <HOSTNAME>.
IP should be set to 1.1.1.1
Proxy should be off and it should say DNS only. This is important.
Leave TTL at Auto

Create a script on the NAS to run on connection change

#!/bin/bash
set -e

export ZONE_ID="ed368670a6f4a62c694e30ae63bc766c"
export CLOUDFLARE_API_KEY="iNcGJyMnP2o0MqkvXYNbrctcIIGA99qMXed6ZuYn"
export DNS_HOST_NAME="nastest"
export DNS_DOMAIN_NAME="f5traffic.com"

