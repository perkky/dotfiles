#!/bin/bash
# Example script to start a headless desktop + VNC server
export WLR_BACKENDS=headless
export WLR_LIBINPUT_NO_DEVICES=1
#export WLR_RENDER_DRM_DEVICE=/dev/dri/renderD128 # Only needed for wayfire
labwc >& labwc.log &
sleep 5
export WAYLAND_DISPLAY=wayland-0 # change to wayland-1 for other than labwc
wayvnc 192.168.1.7 >& wayvnc.log &
