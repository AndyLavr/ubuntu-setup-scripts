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

# Install required programs/tools
sudo apt-get install libcap-dev texinfo automake autoconf libgmp-dev libexpat-dev python-dev build-essential gcc-multilib g++-multilib libncurses5-dev flex bison;

# Install SaberMod Prebuilts
cd ~/Downloads;
wget https://gitlab.com/SaberMod/sabermod-prebuilts/repository/archive.zip
unzip sabermod-prebuilts-*.zip;
sudo cp -R sm-prebuilts-master/cloog/lib/* -f /usr/lib/x86_64-linux-gnu;

# Symlink Multilib headers
sudo ln -s /usr/include/asm-generic /usr/include/asm;

# Create Source Folder
mkdir -p ~/sm-tc && cd ~/sm-tc;
repo init -u https://gitlab.com/SaberMod/sabermod-manifest.git -b master;
repo sync;
