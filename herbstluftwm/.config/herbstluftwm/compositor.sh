#!/usr/bin/env bash

killall -q picom

picom &

echo "Compositor launched..."
