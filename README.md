# cloudflare-ddns
Direct Dynamic DNS for Cloudflare from Synology

### Purpose
This script is designed to run under the task scheduler that comes with Synology NAS DDNS. It uses API calls to update a DNS record directly on Cloudflare. It has been tested on DS918 running DSM 7.2.

### Features
* Configured via management
* No external scripts
* No third party sites
* No command line changes
* No other dependancies

### Sources
Cloudflare provide instructions on how to implement DDNS directly with API calls [here](https://developers.cloudflare.com/api/resources/dns/subresources/records/methods/update/). This is script implements that interface.

### Contributing
Fork the respository and raise an issue. Then commit your changes and refer to the PR in the issue.

### Requirements
* Currently active DNS domain hosted on Cloudflare
* Zone API Key (instructions below)
* Zone ID (instructions below)
* DDNS record (instructions below)

### Details
This updates a Cloudflare DNS record with the current public IP address if it has changed. It does this by storing the last IP update in /tmp/nasip.txt and checking it each time it runs.

It exits with an error status on any API/Task error OR the IP address has changed. This should trigger an email to the admin with the details of the error OR notifying them the IP address has changed. No IP changes means their are no notifications.

### Pre-Installation
Read the [pre-installation steps](docs/pre-install.md) to prepare for task installation. These steps are mandatory

### Installation
Read the [installation guide](docs/install.md) to deploy the DDNS on your Sydnology NAS.

### Post Installation
Please follow the [testing steps](docs/testing.md) after the install to ensure it is working as expected.

### Troubleshooting
If you cannot resolve the problem raise an issue in Github or in the discussion thread on Synology website.

