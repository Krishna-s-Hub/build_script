#!/bin/bash

rm -rf device/xiaomi
git clone https://github.com/Krishna-s-Hub/device_xiaomi_sweet device/xiaomi/sweet 

#build
. build/envsetup.sh
lunch awaken_sweet-ap1a-user
make installclean
m target-files-package otatools

#sign build
rm -rf sign.sh && wget https://raw.githubusercontent.com/pure-soul-kk/build_scripts/pos/sign.sh && bash sign.sh
