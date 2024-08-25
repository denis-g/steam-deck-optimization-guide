#!/bin/bash
export LC_ALL=en_US.UTF-8

# Switching over to the “performance” CPU governor at start-up
###############################################################################

cat << EOF | sudo tee /etc/systemd/system/cpu_performance.service
[Unit]
Description=CPU performance governor
[Service]
Type=oneshot
ExecStart=/usr/bin/cpupower frequency-set -g performance
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable cpu_performance.service

# Activate MGLRU (Multi-Gen. Least Recently Used)
###############################################################################

cat << EOF | sudo tee /etc/tmpfiles.d/mglru.conf
w /sys/kernel/mm/lru_gen/enabled - - - - 7
w /sys/kernel/mm/lru_gen/min_ttl_ms - - - - 0
EOF

# Unlocking the memory lock
###############################################################################

cat << EOF | sudo tee /etc/security/limits.d/memlock.conf
* hard memlock 2147484
* soft memlock 2147484
EOF

# Changing the I/O (Input/Output) Scheduler
###############################################################################

cat << EOF | sudo tee /etc/udev/rules.d/64-ioschedulers.rules
ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="kyber"
ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="kyber"
EOF

# Preventing the superfluous book-keeping of File Access Times
###############################################################################

sudo sed -i -e '/home/s/\bdefaults\b/&,noatime/' /etc/fstab

# Disabling CPU security flaw mitigations
###############################################################################

sudo sed -i 's/\bGRUB_CMDLINE_LINUX_DEFAULT="\b/&mitigations=off nowatchdog nmi_watchdog=0 /' /etc/default/grub
sudo grub-mkconfig -o /boot/efi/EFI/steamos/grub.cfg
