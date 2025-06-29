echo "Starting CIS Benchmark controls automation...\n"

#Control 1: Disable root SSH login
#!/bin/bash

echo "[*] Disabling root SSH login..."
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl reload sshd
echo "[✓] Root SSH login disabled"





#Control 2: Enforce password complexity (via PAM)
#We’ll modify /etc/security/pwquality.conf to enforce rules like:
#    Minimum length: 12 characters
#    Require uppercase, digits, etc.

echo "[*] Enforcing password complexity..."
# Backup first
cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bak

# Set parameters (replace or add lines)
grep -q '^minlen' /etc/security/pwquality.conf && sed -i 's/^minlen.*/minlen = 12/' /etc/security/pwquality.conf || echo 'minlen = 12' >> /etc/security/pwquality.conf
grep -q '^dcredit' /etc/security/pwquality.conf && sed -i 's/^dcredit.*/dcredit = -1/' /etc/security/pwquality.conf || echo 'dcredit = -1' >> /etc/security/pwquality.conf
grep -q '^ucredit' /etc/security/pwquality.conf && sed -i 's/^ucredit.*/ucredit = -1/' /etc/security/pwquality.conf || echo 'ucredit = -1' >> /etc/security/pwquality.conf

echo "[✓] Password complexity enforced"





#Control 3: Enable firewall (firewalld)
echo "[*] Enabling and starting UFW firewall..."
ufw --force enable
ufw allow ssh
echo "[✓] UFW Firewall enabled and SSH allowed"



#Control 4: Disable unused filesystems
echo "[*] Disabling unused filesystems..."
for fs in cramfs freevxfs jffs2 squashfs udf; do
    echo "install $fs /bin/true" > /etc/modprobe.d/${fs}.conf
done
echo "[✓] Unused filesystems disabled"






#Control 5: Disable Ctrl-Alt-Del reboot
echo "[*] Disabling Ctrl-Alt-Del reboot..."
systemctl mask ctrl-alt-del.target
echo "[✓] Ctrl-Alt-Del reboot disabled"






#Control 6: Set strict permissions on /etc/passwd
echo "[*] Setting permissions on /etc/passwd..."
chmod 644 /etc/passwd
echo "[✓] Permissions set on /etc/passwd"
