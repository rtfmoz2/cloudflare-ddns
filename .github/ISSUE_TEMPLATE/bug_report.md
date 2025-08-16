---
name: Bug report
about: Open the preview pane to read the bug template
title: "[BUG]"
labels: new
assignees: rtfmoz2

---

> [!WARNING]
> _please do not post any private information in a bug report. No API keys or passwords_

# Bug Report

## Issue Details

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

## Diagnostic Information

Release Version:  
Synology DSM version <sup>**3**</sup>

#### Cloudflare DNS record

Type:  
Name:  
Content:  
Proxy Status:  
TTL:  

#### Synology Task Configuration

Edit the configuration for the DDNS task you created <sup>**4**</sup>

> [!NOTE]
> Select a box using [x] to mark it as ticked. See preview before submitting.

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

## References

1. Control Panel -> Task Scheduler -> Select Task -> Action -> View Result  
2. Control Panel -> Task Scheduler -> Select Task -> Run  
3.  Control Panel -> Info Center under General Section  
4. Control Panel -> Task Scheduler -> Select Task -> Edit
