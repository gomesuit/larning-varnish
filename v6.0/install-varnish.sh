#!/bin/bash -ex

# for build vaninsh
yum install -y \
    make \
    autoconf \
    automake \
    jemalloc-devel \
    libedit-devel \
    libtool \
    ncurses-devel \
    pcre-devel \
    pkgconfig \
    python-docutils \
    python-sphinx

cd /tmp
wget https://github.com/varnishcache/varnish-cache/archive/varnish-6.0.1.tar.gz
tar zxfv varnish-6.0.1.tar.gz
cd varnish-cache-varnish-6.0.1/

sh autogen.sh
sh configure
make
make install


groupadd -g 992 varnish
# -Mオプション(--no-create-homeオプション)：ホームディレクトリを作成しない
useradd -c 'Varnish Cache' -g 992 -u 995 -M -s /sbin/nologin -d /var/lib/varnish varnish

cp /vagrant/settings/varnish_reload_vcl /usr/local/sbin/
cp /vagrant/settings/varnish.service /usr/lib/systemd/system/varnish.service
cp /vagrant/settings/varnish.params /etc/varnish/
cp /vagrant/settings/secret /etc/varnish/
cp /vagrant/settings/default.vcl /etc/varnish/
