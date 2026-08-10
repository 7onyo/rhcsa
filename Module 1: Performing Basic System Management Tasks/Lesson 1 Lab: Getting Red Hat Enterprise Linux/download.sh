read -p "Red Hat ISO download link: " RHEL_LINK

read -p "Red Hat Version: " RHEL_VERSION

wget -c -O rhel-${RHEL_VERSION}-x86_64-dvd.iso "$RHEL_LINK"
