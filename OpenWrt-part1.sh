#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: OpenWrt-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 自定义函数
addFeeds(){
  if [ $# == 2 ];then
    echo src-git $1 $2 >> feeds.conf.default
  fi
}

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加 feed 源
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git custom https://github.com/kiddin9/openwrt-packages.git;master' feeds.conf.default
# addFeeds custom https://github.com/kiddin9/openwrt-packages.git
# addFeeds custom https://github.com/kenzok8/openwrt-packages.git
addFeeds custom https://github.com/kenzok8/small-package.git
addFeeds accesscontrol https://github.com/CrazyPegasus/luci-app-accesscontrol-plus.git

# natmapt
git clone --depth 1 --branch master --single-branch --no-checkout https://github.com/muink/openwrt-stuntman.git package/stuntman
pushd package/stuntman
umask 022
git checkout
popd

git clone --depth 1 --branch master --single-branch --no-checkout https://github.com/muink/luci-app-natmapt.git package/luci-app-natmapt
pushd package/luci-app-natmapt
umask 022
git checkout
popd

git clone --depth 1 --branch master --single-branch --no-checkout https://github.com/muink/openwrt-natmapt.git package/natmapt
pushd package/natmapt
umask 022
git checkout
popd


# 添加软件包源
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon  #新的argon主题 (custom已附带)
# git clone --depth=1 https://github.com/llccd/openwrt-fullconenat.git package/openwrt-fullconenat #全锥形NAT (custom已附带)
# git clone --depth=1 https://github.com/peter-tank/luci-app-fullconenat package/luci-app-fullconenat #全锥形NAT LUCI界面 (custom已附带)


./scripts/feeds update -a

# remove 
ls -lh feeds/small/
rm -rf feeds/small/{luci-app-bypass,luci-app-ssr-plus}

ls -lh feeds/custom/
rm -rf feeds/custom/{luci-app-store} 

