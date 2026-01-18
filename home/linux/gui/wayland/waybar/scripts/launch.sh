#!/usr/bin/env bash

# Ensure GTK uses the Wayland backend; Waybar refuses to start on X11.
export GDK_BACKEND=wayland

pkill waybar

waybar &
