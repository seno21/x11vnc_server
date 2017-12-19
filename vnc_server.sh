#!/bin/bash
apt remove --purge vino -y
apt install x11vnc -y
mkdir /etc/x11vnc
cp -r x11vnc.service /lib/systemd/system/
cp -r /lib/systemd/system/x11vnc.service /etc/systemd/system/
mv /lib/systemd/system/graphical.target /lib/systemd/system/graphical.target.old
cp -r graphical.target /lib/systemd/system/
systemctl daemon-reload
systemctl enable graphical.target
systemctl start x11vnc.service
x11vnc --storepasswd /etc/x11vnc/vncpwd

