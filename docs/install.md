# Implementation
How to implement as a scheduled task

## Prepare the DNS
Follow the preparation steps listed in the [pre-install documentation](pre-install.md)

## Prepare the script
1. Download the script from this repositry
2. Open the script in your favourite editor
3. Update the four values from the preparation steps.

## Create a new scheduled task
1. Login to your Synology NAS
2. Under Control Panel open the Task Scheduler in the Services section.
3. Create Scheduled Tasks -> User Defined Script
4. Configure each of the panels "General", "Schedule" and "Task Settings" as shown below.

### General
1. Suggested task name is DDNS Cloudflare
2. User should be an administation user
3. Set it as enabled

### Scheduling
1. Select run Daily
2. Leave start time as 00:00
3. Enable "Continue running in the same day"
4. Repeat will appear as every hour. Click on it and scroll _upwards_ to find every minute.
5. Select end time and _scroll down_ to reach 23:59

### Task Settings
1. Enable "Send run details by email"
2. Enter your email address
3. Enable "Send run details only when script terminates abnormally"
4. Click inside the large empty box and paste the prepared script into the box.
5. Click the OK button to complete the configuration.

A new Task should appear in the list using the name you gave it above.

Now proceed with the testing to make sure everything is working as expected. See the [testing documenation](testing.md)