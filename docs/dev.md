# Development

## Goal

Python == 3.12.2  
Go >= 1.22.0  
shfmt == 3.8.0  
Bash >= 3  
Zsh >= 5  
Pwsh >= 5  

## Install on Ubuntu

### Python

1. Install python dependencies

    ```sh
    sudo apt-get update && \
        sudo apt-get install -y \
            libbz2-dev \
            libffi-dev \
            libreadline-dev \
            libssl-dev \
            libsqlite3-dev \
            tk-dev \
            liblzma-dev
    ```

2. Install pyenv

    see [official document](https://github.com/pyenv/pyenv).  

3. Set `pyenv` environment variable

    see [official document](https://github.com/pyenv/pyenv).  

3. Install python 3.12.2

    ```sh
    pyenv install 3.12.2 && \
        pyenv global 3.12.2
    ```

4. Activate virtual environment

    ```sh
    python -m venv .venv
    source .venv/bin/activate
    ```

### Go

1. Install

    ```sh
    wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz && \
        sudo rm -rf /usr/local/go && \
        sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz && \
        rm go1.22.0.linux-amd64.tar.gz
    ```

2. Set `go` environment variable.

    see [official document](https://go.dev/doc/install).  

### shfmt

1. Install

    ```sh
    go install mvdan.cc/sh/v3/cmd/shfmt@v3.8.0
    ```

2. Set `shfmt` environment variable

    ```sh
    export PATH=$HOME/go/bin:$PATH
    ```

### Zsh

Install

```sh
sudo apt-get update && \
    sudo apt install -y \
        zsh
```

### Pwsh

Install

see [official document](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4).
