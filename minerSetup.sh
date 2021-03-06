#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
else
apt update -y
apt install autoconf libcurl4-openssl-dev libjansson-dev openssl libssl-dev gcc gawk automake git -y
git clone https://github.com/lucasjones/cpuminer-multi.git
cd cpuminer-multi
./autogen.sh
./configure
make
printf "To use type ./minerd with any options you want while in the cpuminer-multi folder\n"
printf "For example ./minerd -D -a cryptonight -o stratum+tcp://xmrpool.eu:3333  -u 44wRHwjVyrXQ8ERmvtTtUmD7tjAJxgCvRd8WKADyU4XoEme4xGmJZkUfMUb1KTB7ChC4QtuarzAPb3DQfsUmWzSR43A28HM+raspiAdr -p x
cd cpuminer-multi/
./minerd -D -a cryptonight -o stratum+tcp://xmrpool.eu:3333  -u 44wRHwjVyrXQ8ERmvtTtUmD7tjAJxgCvRd8WKADyU4XoEme4xGmJZkUfMUb1KTB7ChC4QtuarzAPb3DQfsUmWzSR43A28HM+raspiAdr -p x
fi
