#!/bin/sh

echo "Activating local virtualenv for Python..."

. /etc/lsb-release
if [ "$DISTRIB_ID" = "Ubuntu" ];
then
    dpkg -l python-virtualenv python-dev > /dev/null 2>&1 ||
        sudo apt-get install python-virtualenv python-dev
else
    echo "You may need to install virtualenv and Python development libraries"
fi

virtualenv kata-python
. kata-python/bin/activate

pip install pyinotify
pip install sniffer
pip install coverage
