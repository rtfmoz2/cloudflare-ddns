# Pre Installation
This will guide you through the process of gathering the information required to setup your NAS with direct DDNS with Cloudflare.These need to be done before we can implement a scheduled task on your Synology.

## Pre-Implementation Steps
The scheduled task required a few things are in place before it can be run.
* Cloudflare API is ready to receive requests
* DNS record is established for DDNS updates
* Domain information is collected

The four values required for the scheduled tasks are as follows...
* ZONE_ID
* CLOUDFLARE_API_KEY
* DNS_HOST_NAME
* DNS_DOMAIN_NAME

Provided below are step by step instruction on how to gather this information. Please complete them in the order listed.

### Cloudflare DNS API Keys
Create an API key so you can access and update records on your domain.

1. Login to Cloudflare
2. Select your DNS Zone to see the overview page
3. Scroll to the bottom of the page and copy the Zone ID. This will be the ZONE_ID in your script.
4. Select Get your API token
5. Select Create Token
6. Select Use Template for Edit zone DNS
7. Under Zone Resources select your DNS domain on the right if not already shown.
8. Select Continue to summary
9. Select Create Token

This is the _only time_ the API key will ever be displayed. On the right hand side of the API Key box use the copy button to get the key. This will be the CLOUDFLARE_API_KEY in your script.

### Cloudflare DDNS Record
Create a DNS record to be updated when your IP address changes (skip if you already have an A record for this)

1. Login to Cloudflare
2. Select your DNS Zone to see the overview page
3. On the right Select DNS Records
4. Select Add Record
5. Type should be set to A
6. Name is the hostname you use for this. No spaces allowed only a dash if you need one. This will be the DNS_HOST_NAME in the script.
7. IP should be set to 1.1.1.1
8. Proxy should be off and it should say DNS only. This is important.
9. Leave TTL at Auto

#### -- Domain Name --
Since you must already have a domain hosted on Cloudflare specify it's name as the DNS_DOMAIN_NAME in the script.

