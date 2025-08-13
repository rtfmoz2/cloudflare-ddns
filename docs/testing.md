# Testing
This describes post installation tests that can be used to ensure everything is working as expected.

## Post Installation Testing
Now you have created the task and you want to see if it works. There was a very specific reason why the DNS record you created used an invalid IP address. This was so you could easily see when it changes.

The first thing you should do is have the Cloudflare DNS management page open with the DNS records of your domain listed. You should see the DNS record you created with the value 1.1.1.1. Open the Synology NAS management interface have the list of scheduled tasks showing.

### Test your DDNS as follows
1. Click on the new scheduled task you created. Not the tickbox, just the task item itself.
2. Near the top of the screen click "Run" and it will run the task immediately for you. There will be no feedback.
3. Near the top of the screen click "Action" then "View Result"
4. Examine the Standard output/error section
5. If it says SUCCESS then refresh the Cloudflare DNS management page and see if the DNS record updated.
6. If the record is updated hover your mouse over the DNS record and you should see a small blue comment icon. 
7. When you hover your mouse over the comment the popup should read "Updated by \<your nas name\> on \<date\> \<timezone\> \<year\>"
8. Check your email to see if you got something along the same lines.

Starting from midnight it will run every minute and check for a new IP address. It will only notify you via email if the script fails OR it updates your DNS record.

