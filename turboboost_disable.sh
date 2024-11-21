#!/bin/bash

# Check if the script is run as root (sudo)
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Auto-detect CPU type (Intel or AMD)
cpu_vendor=$(lscpu | grep "Vendor ID" | awk '{print $3}')
echo "Detected CPU Vendor: $cpu_vendor"

if [ "$cpu_vendor" == "GenuineIntel" ]; then
    echo "Intel CPU detected, disabling Turbo Boost."

    # Disable Turbo Boost for Intel CPUs
    echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

    # Verify the change
    if [ "$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)" -eq 1 ]; then
        echo "Turbo Boost has been disabled for Intel CPU."
    else
        echo "Failed to disable Turbo Boost for Intel CPU."
    fi

elif [ "$cpu_vendor" == "AuthenticAMD" ]; then
    echo "AMD CPU detected, disabling Precision Boost."

    # Check if amd-pstate is being used
    if [ -d /sys/devices/system/cpu/cpufreq/amd_pstate ]; then
        echo "1" > /sys/devices/system/cpu/cpufreq/amd_pstate/no_turbo
        echo "Precision Boost (Turbo Boost) has been disabled for AMD CPU."
    else
        echo "amd-pstate driver not found. Precision Boost might need to be controlled via BIOS or Ryzen Master."
    fi
else
    echo "Unknown CPU Vendor. Turbo Boost disabling might not be supported."
fi
