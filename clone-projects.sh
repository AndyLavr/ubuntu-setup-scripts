#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
#   You may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

#############################################
###                                       ###
### This is made specifically for my uses ###
###                                       ###
#############################################

# Make all the needed directories
mkdir ~/xenon;
mkdir ~/llvm;
mkdir ~/linaro;
cd ~/;

# Begin cloning and syncing
git clone https://github.com/TGM-Hybrid/green_machine_bacon -b newer tgm;
git clone https://github.com/zen-kernel/zen-kernel -b 4.0/master zen;
cd llvm && repo init -u https://github.com/frap129/llvm-manifest.git -b master && repo sync -j24;
cd ../linaro && repo init https://github.com/hyper-toolchains/linaro_manifest.git -b master && repo sync -j24;
cd ../xenon && repo init -u https://github.com/TeamHorizon/platform_manifest.git -b lp-mr1 && repo sync -j24;
