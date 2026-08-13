### Task: Lesson 1 Lab - Getting Red Hat Enterprise Linux

**Goal:** Register for a Red Hat Developer account and download the RHEL installation ISO using an automated bash script.

**Solution:**
1. Open a web browser and navigate to [developers.redhat.com](https://developers.redhat.com/).
2. Create a free developer account or log in if you already have one.
3. Navigate to the RHEL downloads page, right-click on the appropriate Red Hat Enterprise Linux DVD ISO link, and copy the direct download URL.

4. Make the provided script executable:
```bash
chmod +x download.sh
```

5. Run the script and paste the requested information when prompted (the download URL and version number):
```bash
./download.sh
```

**Script File: `download.sh`**
```bash
#!/bin/bash

read -p "Red Hat ISO download link: " RHEL_LINK
read -p "Red Hat Version: " RHEL_VERSION

wget -c -O rhel-${RHEL_VERSION}-x86_64-dvd.iso "$RHEL_LINK"
```

