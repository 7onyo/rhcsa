### Task: Lesson 5 Lab - Using the Bash Shell

**Goal:** Configure persistent bash shell settings for the current user, including a custom environment variable, a command alias, and increasing the maximum history size.

**Solution:**
1. Open your user's `~/.bashrc` profile configuration file in a text editor like `nano` or `vim`. Configurations added here will persist across terminal sessions:
```bash
nano ~/.bashrc
```

2. Add the requested configurations to the bottom of the file. 
```text
# Custom settings for Lesson 5 Lab
export color=red
alias dir='ls -ltr'
HISTSIZE=2500
```
*Save the file and exit the editor.*

3. Reload the `~/.bashrc` file to apply the new settings immediately to your current terminal session:
```bash
source ~/.bashrc
```

**Verification:**
```bash
# Verify the 'color' variable is set correctly
echo $color

# Verify the 'dir' alias works
dir

# Verify the history size limit has been updated to 2500
echo $HISTSIZE

```
