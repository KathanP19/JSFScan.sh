#!/bin/bash

#MAKE DIRECTORIES
mkdir -p tools

#INSTALL INTERLACE
echo -e "\n-----------------------INSTALLING INTERLACE------------------------"
cd ./tools
git clone https://github.com/codingo/Interlace.git
cd -
sudo pip3 install -r ./tools/Interlace/requirements.txt
cd ./tools/Interlace/
sudo python3 setup.py install
cd -
echo -e "\n-----------------------FINISHED INSTALLING INTERLACE------------------------"

#INSTALL SECRETFINDER
echo -e "\n-----------------------INSTALLING SECRETFINDER------------------------"
cd ./tools
git clone https://github.com/m4ll0k/SecretFinder.git
cd -
sudo pip3 install -r ./tools/SecretFinder/requirements.txt
echo -e "\n-----------------------FINISHED INSTALLING SECRETFINDER------------------------"

#INSTALL GAU
echo -e "\n-----------------------INSTALLING GAU------------------------"
go get github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
echo -e "\n-----------------------FINISHED INSTALLING GAU------------------------"

#INSTALL SUBJS
echo -e "\n-----------------------INSTALLING SUBJS------------------------"
GO111MODULE=on go get -u -v github.com/lc/subjs
echo -e "\n-----------------------FINISHED INSTALLING SUBJS------------------------"

#INSTALL HAKCHECKURL
echo -e "\n-----------------------INSTALLING HTTPX------------------------"
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
echo -e "\n-----------------------FINISHED INSTALLING HTTPX------------------------"

#INSTALL MEG
echo -e "\n-----------------------INSTALLING MEG------------------------"
go get -u github.com/tomnomnom/meg
echo -e "\n-----------------------FINISHED INSTALLING MEG------------------------"

#INSTALL MEG
echo -e "\n-----------------------INSTALLING HAKRAWLER------------------------"
go get github.com/hakluke/hakrawler
echo -e "\n-----------------------FINISHED INSTALLING HAKRAWLER------------------------"

#INSTALL LINKFINDER
echo -e "\n-----------------------INSTALLING LINKFINDER------------------------"
cd ./tools
git clone https://github.com/dark-warlord14/LinkFinder
cd -
sudo pip3 install -r ./tools/LinkFinder/requirements.txt
cd ./tools/LinkFinder/
sudo python3 setup.py install
cd -
echo -e "\n-----------------------FINISHED INSTALLING LINKFINDER------------------------"

#INSTALL GETJSWORDS.py
echo -e "\n-----------------------INSTALLING GETJSWORDS.PY------------------------"
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/getjswords.py
mv getjswords.py ./tools/
echo -e "\n-----------------------FINISHED INSTALLING GETJSWORDS.PY------------------------"
