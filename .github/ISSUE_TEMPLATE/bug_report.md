---
name: Bug report
about: Open the preview pane to read the bug template
title: "[BUG]"
labels: new
assignees: rtfmoz2

---

> [!WARNING]
> _please do not post any private information in a bug report. No API keys, usernames or passwords_

# Bug Report

<details>
<summary>Issue Details</summary>

**Describe the bug**  
What is not happening as expected

**Expected behavior**  
What are you expecting to happen

**Current Output**  
The output of the running task <sup>**1**</sup>  
If you want a fresh output do a manual run <sup>**2**</sup>. Good for testing.  
_Suggest a screenshot of this window_

**Additional context**  
Add any other context about the problem here.
</details>

<details>
<summary>Version information</summary>

Release Version:   
Synology DSM version <sup>**3**</sup>:

</details>
<details>
<summary>Cloudflare DNS record</summary>

Type:  
Name:  
Content:  
Proxy Status:  
TTL:  

</details>
<details>
<summary>Synology Task Configuration</summary>

Edit the configuration for the DDNS task you created <sup>**4**</sup>

> [!NOTE]
> Selection boxes function only after you submit the request
> (replaced with [x] however you can simply tick them after posting). 
> Fill in the other information and leave them for after bug submission

##### General

Task: name  
User:
- [ ] Is this user an administrator?

##### Schedule

Date

- [ ] Run on the following days?

  Repeat? (choose one)
  - [ ] Daily
  - [ ] Weekly
  - [ ] Monthly

Time  

Start Time: XX:XX

- [ ] Continue running within the same day?

  Repeat? (choose one)
  - [ ] Every minute
  - [ ] Every X minutes
  - [ ] Every hour
  - [ ] Every X hours

Last Run Time: XX:XX
</details>
<details>
<summary>References</summary>

1. Control Panel -> Task Scheduler -> Select Task -> Action -> View Result  
2. Control Panel -> Task Scheduler -> Select Task -> Run  
3.  Control Panel -> Info Center under General Section  
4. Control Panel -> Task Scheduler -> Select Task -> Edit
</details>
