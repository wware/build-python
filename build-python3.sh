#!/bin/bash -xe

BLDDIR=$(realpath ./Python-3.9.7)
echo $BLDDIR
wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz
tar xvf Python-3.9.7.tgz
(
cd $BLDDIR
./configure --enable-optimizations --with-readline=editline
make -j 8
)

sudo mkdir -p /venv3
sudo chown -R wware:wware /venv3
./Python-3.9.7/python -m venv /venv3

deactivate || true
source /venv3/bin/activate
pip install -r requirements.txt
