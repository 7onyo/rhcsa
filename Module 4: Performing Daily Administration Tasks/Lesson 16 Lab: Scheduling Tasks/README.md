### Task: Lesson 16 Lab - Scheduling Tasks

**Goal:** Verify the systemd tmp-cleanup timer is active, schedule a one-off `poweroff` with `at`, and set up a cron job for user `linda` that creates `/tmp/cronfile` every hour at 5 minutes past.

**Solution:**

1. Find the systemd timer responsible for cleaning up tmp files:
```bash
systemctl list-unit-files | grep tmp
```
<p align="center">
  <img src="media/findTimer.png" alt="Find the systemd-tmpfiles-clean timer">
</p>

2. Check the status of the timer to confirm it is active and enabled:
```bash
systemctl status systemd-tmpfiles-clean.timer
```
<p align="center">
  <img src="media/statusTimer.png" alt="Check status of systemd-tmpfiles-clean.timer">
</p>

3. Open linda's crontab to add a scheduled job:
```bash
sudo crontab -e -u linda
```
<p align="center">
  <img src="media/openCrontab.png" alt="Open linda's crontab with sudo crontab -e">
</p>

4. Add the following cron job to run `touch /tmp/cronfile` at 5 minutes past every hour:
```text
5 * * * * touch /tmp/cronfile
```
<p align="center">
  <img src="media/addCronJob.png" alt="Add cron job to touch /tmp/cronfile at minute 5 every hour">
</p>

5. Use `at` to schedule a one-off system poweroff at a specific time, then verify the job is queued with `atq`:
```bash
at 11:43 PM
```
At the `at` prompt, type:
```text
systemctl poweroff
```
Then confirm the job is queued:
```bash
atq
```
<p align="center">
  <img src="media/at.png" alt="Schedule a one-off poweroff with at and verify with atq">
</p>
