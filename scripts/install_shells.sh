#!/usr/bin/env bash

echo Installing zsh
sudo apt update && \
    sudo apt install zsh -y && \
    zsh --version

echo Installing pwsh
# reference: https://learn.microsoft.com/ko-kr/powershell/scripting/install/install-ubuntu?view=powershell-7.4
sudo apt-get update && \
    sudo apt-get install -y wget apt-transport-https software-properties-common && \
    source /etc/os-release && \
    wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    sudo apt-get update && \
    sudo apt-get install -y powershell && \
    pwsh --version
