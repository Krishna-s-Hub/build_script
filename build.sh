#!/bin/bash

git clone https://github.com/Krishna-s-Hub/device_xiaomi_sweet device/xiaomi/sweet

#custom repos
rm -rf prebuilts/clang/host/linux-x86/clang-r498229b
git clone --depth=1 https://gitlab.com/itsshashanksp/android_prebuilts_clang_host_linux-x86_clang-r498229b.git -b 13.0 prebuilts/clang/host/linux-x86/clang-r498229b

git clone https://github.com/pure-soul-kk/hardware_xiaomi 

#build
. build/envsetup.sh
lunch awaken_sweet-ap1a-user
make installclean
m target-files-package otatools

#sign build
rm -rf sign.sh && wget https://raw.githubusercontent.com/pure-soul-kk/build_scripts/pos/sign.sh && bash sign.sh
