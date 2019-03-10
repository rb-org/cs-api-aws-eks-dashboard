#!/bin/sh

# Install AWS CLI
apk add python3 py-pip
pip3 install --upgrade pip
pip3 install awscli --upgrade
export PATH=~/.local/bin:$PATH
echo 'export PATH=/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
