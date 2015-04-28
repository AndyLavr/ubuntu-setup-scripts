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

# Remove programs that may cause conflicts
echo "Removing programs that may cause conflicts...";
sudo apt-get remove openjdk-* icedtea-* icedtea6-*;

# Install Android requirements
echo "Installing Android requirements...";
sudo apt-get install openjdk-7-jdk openjdk-7-jre git gnupg ccache lzop flex bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 libc6-dev lib32ncurses5-dev x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 lib32z1-dev libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib tofrodos python-markdown libxml2-utils xsltproc libreadline6-dev lib32readline-gplv2-dev libncurses5-dev bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngquant schedtool dpkg-dev;

# Create Symbolic link necessary for libGL.so
echo "Symlinking libGL.so...";
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so;

# Make sure we're ready for installing repo
cd ~/ && rm -rf ~/bin;

# Install repo 
echo "Installing repo...";
mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo;

# Export PATH to include local user bin
echo "Fixing PATH...";
sudo echo "export PATH=~/bin:$PATH" >> ~/.bashrc;

echo "Done! Hopefully everything works."


