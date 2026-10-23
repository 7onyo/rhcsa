### Task: Lesson 9 Lab - Managing Users and Groups

**Goal:** Configure the system so new users get a 90-day max password validity, add a default `newfile` to the skeleton directory, create four users with appropriate passwords/locks, and organize them into `profs` and `students` groups.

**Solution:**

1. Set the maximum password validity to 90 days for all future users by editing `/etc/login.defs`:
```text
PASS_MAX_DAYS  90
```
<p align="center">
  <img src="media/setExpirationDate90.png" alt="Set max password expiry to 90 days in login.defs">
</p>

2. Verify the setting is picked up for newly created users by creating a test user and checking `/etc/shadow`:
```bash
sudo useradd test_expiration
sudo tail -5 /etc/shadow
```
<p align="center">
  <img src="media/testExpirationInShadow.png" alt="Verify expiration date in shadow file">
</p>

3. Add an empty `newfile` to the skeleton directory (`/etc/skel`) so every new user gets it automatically in their home folder:
```bash
sudo touch /etc/skel/newfile
ls -ls /etc/skel/
```
<p align="center">
  <img src="media/addNewFileToSkel.png" alt="Add newfile to /etc/skel">
</p>

4. Verify the skeleton is applied correctly by creating a test user and inspecting their home directory:
```bash
sudo useradd test_skel
sudo ls -la /home/test_skel/
```
<p align="center">
  <img src="media/testSkel.png" alt="Verify newfile appears in new user's home directory">
</p>

5. Create the four required users:
```bash
sudo useradd anna
sudo useradd anouk
sudo useradd linda
sudo useradd lisa
```
<p align="center">
  <img src="media/add4Users.png" alt="Create users anna, anouk, linda, and lisa">
</p>

6. Set passwords for `anna` and `anouk`:
```bash
sudo passwd anna
sudo passwd anouk
```
<p align="center">
  <img src="media/setPasswordsFor2Users.png" alt="Set passwords for anna and anouk">
</p>

7. Lock the accounts for `linda` and `lisa` (disabling their passwords), then verify in `/etc/shadow`:
```bash
sudo passwd -l linda
sudo passwd -l lisa

sudo tail -5 /etc/shadow
```
<p align="center">
  <img src="media/checkLockedUsers.png" alt="Lock linda and lisa accounts and verify in shadow">
</p>

8. Create the `profs` and `students` groups, then add the users to their respective groups:
```bash
sudo groupadd profs
sudo groupadd students
sudo usermod -aG profs anna
sudo usermod -aG profs anouk
sudo usermod -aG students linda
sudo usermod -aG students lisa
```
<p align="center">
  <img src="media/addUsersToGroups.png" alt="Create groups and assign users">
</p>

9. Verify the group memberships:
```bash
tail -5 /etc/group
```
<p align="center">
  <img src="media/checkGroups.png" alt="Verify group memberships in /etc/group">
</p>
