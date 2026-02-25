#!/usr/bin/env bash
set -e

# Remove broken yarn repo
sudo rm /etc/apt/sources.list.d/yarn.list 2>/dev/null || true

sudo apt-get update -y
sudo apt-get install -y xvfb x11vnc fluxbox websockify novnc

# Start virtual display
Xvfb :1 -screen 0 1024x768x24 &
sleep 1
fluxbox &
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 &
websockify --web=/usr/share/novnc 6080 localhost:5900 &

pip install pygame