#!/bin/bash -ev

     pushd haggle
     ./dependencies_ubuntu.sh
     popd
     sudo apt-get -y install gcc-4.9
     sudo apt-get -y install g++-4.9
     sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 49 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
     sudo update-alternatives --set gcc "/usr/bin/gcc-4.9"

    pushd charm
    ./build_ubuntu.sh
    popd
    pushd haggle
    ./build_ubuntu.sh
    popd
