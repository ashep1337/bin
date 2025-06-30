#!/bin/bash

# Get the status of NordVPN
vpn_status=$(nordvpn status)

# Check if the VPN is connected
if [[ "$vpn_status" == *"Status: Connected"* ]]; then
    # If connected, start qbittorrent-nox with the specified web UI port
    echo "VPN is connected. Starting qbittorrent-nox..."
    sudo qbittorrent-nox --webui-port=8765
else
    # If not connected, connect to Netherlands and then start qbittorrent-nox
    echo "VPN is not connected. Connecting to Netherlands..."
    nordvpn c netherlands
    sudo qbittorrent-nox --webui-port=8765
fi

