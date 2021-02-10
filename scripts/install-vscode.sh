#!/bin/sh

VSCODE_VERSION=${VSCODE_VERSION:="3.8.1"}

# code-server installation
wget https://github.com/cdr/code-server/releases/download/v${VSCODE_VERSION}/code-server_${VSCODE_VERSION}_amd64.deb
dpkg -i ./code-server*.deb
rm code-server_${VSCODE_VERSION}_amd64.deb
apt-get clean
code-server --install-extension ms-python.python
chown -R 1000:1000 /home/${NB_USER}/.local/share

# Jupyter support
pip install git+https://github.com/betatim/vscode-binder
jupyter serverextension enable --py jupyter_server_proxy && \
jupyter labextension install @jupyterlab/server-proxy
