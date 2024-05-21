#!/usr/bin/env bash

# See this for current versions: https://www.nvidia.com/object/unix.html
BETA_VERSIONS="555.42.02 550.40.07 545.23.06 535.43.02 530.30.02 525.53 515.43.04 510.39.01 495.29.05 470.42.01 465.19.01 460.27.04 455.23.04 450.51 440.26 435.17 430.09 418.30 415.13 410.57 396.18"
VULKAN_VERSIONS="550.40.61 550.40.59 550.40.55 550.40.53 535.43.28 535.43.25 535.43.24 535.43.23 535.43.22 535.43.20 535.43.19 535.43.16 535.43.15 535.43.13 535.43.11 535.43.10 535.43.09 535.43.08 525.47.35 525.47.34 525.47.31 525.47.27 525.47.26 525.47.24 525.47.22 525.47.18 525.47.15 525.47.14 525.47.13 525.47.11 525.47.07 525.47.06 525.47.04 515.49.25 515.49.24 515.49.19 515.49.18 515.49.15 515.49.14 515.49.10 515.49.06 515.49.05 470.62.30 470.62.29 470.62.28 470.62.26 470.62.22 470.62.20 470.62.16 470.62.13 470.62.12 470.62.07 470.62.05 470.62.02 470.56.05 455.50.19 455.50.14 455.50.12 455.50.10 455.50.07 455.50.04 455.50.03 455.50.02 455.46.04 455.46.02 455.46.01 455.34.01 455.26.02 455.26.01 455.22.04 450.56.11 450.56.06 450.56.02 450.56.01 440.66.17 440.66.15 440.66.14 440.66.12 440.66.11 440.66.09 440.66.08 440.66.07 440.66.04 440.66.03 440.66.02 440.58.02 440.58.01 440.48.02 440.43.02 440.43.01 435.27.08 435.27.07 435.27.06 435.27.03 435.27.02 435.27.01 435.27.00 435.24.02 435.19.03 435.19.02 418.52.20 418.52.18 418.52.17 418.52.16 418.52.14 418.52.10 418.52.07 418.52.05 418.52.03 418.49.04 418.42.02 418.31.03 415.22.05 415.22.01 415.18.04 415.18.02"
NEW_FEATURE_VERSIONS="545.29.06 545.29.02 530.41.03 520.56.06 495.46 495.44 465.31 465.27 465.24.02 455.45.01 455.38 455.28 435.21 415.27 415.25 415.23 415.22 415.18 396.54 396.51 396.45 396.24"
PRODUCTION_VERSIONS="550.78 550.76 550.67 550.54.14 535.179 535.171.04 535.161.07 535.154.05 535.146.02 535.129.03 535.113.01 535.104.05 535.98 535.86.05 535.54.03 525.147.05 525.125.06 525.116.04 525.116.03 525.105.17 525.89.02 525.85.05 525.78.01 525.60.11 515.86.01 515.76 515.65.01 515.57 515.48.07 510.108.03 510.85.02 510.73.05 510.68.02 510.60.02 510.54 510.47.03 470.239.06 470.223.02 470.199.02 470.182.03 470.161.03 470.141.03 470.129.06 470.103.01 470.94 470.86 470.82.00 470.74 470.63.01 470.57.02 460.91.03 460.84 460.80 460.73.01 460.67 460.56 460.39 460.32.03 450.119.03 450.102.04 450.80.02 450.66 450.57 440.100 440.82 440.64 440.59 440.44 440.36 440.31 430.64 430.50 430.40 430.34 430.26 430.14 418.113 418.88 418.74 418.56 418.43 410.104 410.93 410.78 410.73 410.66 410.57"
LEGACY_VERSIONS="340.108 340.107 340.106 340.104 340.102 340.101 304.137 304.135 304.134"

# See this for current tesla versions: https://docs.nvidia.com/datacenter/tesla/index.html
# If a version already exists on any other list, please don't include it here
TESLA_VERSIONS="550.54.15 535.161.08 535.104.12 535.86.10 525.85.12 525.60.13 520.61.05 515.105.01 515.65.07 510.73.08 470.141.10 470.82.01 460.106.00 450.248.02 450.236.01 450.216.04 450.203.08 450.203.03 450.191.01 450.172.01 450.156.00 450.142.00 450.119.04 450.51.06 450.51.05 440.118.02 440.95.01 440.64.00 440.33.01 418.226.00 418.211.00 418.197.02 418.181.07 418.165.02 418.152.00 418.126.02 418.116.00 418.87.01 418.87.00 418.67 418.40.04 410.129 410.79 410.72"

# NVIDIA sometimes publishes separate drivers just for CUDA that aren't available anywhere else
# You need to manually create an entry in `data/` for this version, since these drivers exist
# only at https://developer.nvidia.com/cuda-toolkit-archive for a specific CUDA version
CUDA_VERSIONS="545.23.08"

# TODO: When do we drop these?
# Probably never: https://ahayzen.com/direct/flathub_downloads_only_nvidia_runtimes.txt
UNSUPPORTED_VERSIONS="390.157 390.154 390.151 390.147 390.144 390.143 390.141 390.138 390.132 390.129 390.116 390.87 390.77 390.67 390.59 390.48 390.42 390.25 390.12 387.34 387.22 387.12 384.130 384.111 384.98 384.90 384.69 384.59 384.47 381.22 381.09 378.13 375.82 375.66 375.39 375.26 370.28 367.57"

DRIVER_VERSIONS="$BETA_VERSIONS $VULKAN_VERSIONS $NEW_FEATURE_VERSIONS $PRODUCTION_VERSIONS $LEGACY_VERSIONS $TESLA_VERSIONS $CUDA_VERSIONS $UNSUPPORTED_VERSIONS"
