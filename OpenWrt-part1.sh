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

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加 feed 源
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git custom https://github.com/kiddin9/openwrt-packages.git;master' feeds.conf.default
addFeeds accesscontrol https://github.com/CrazyPegasus/luci-app-accesscontrol-plus.git

# 支持 turboacc
# 不带 shortcut-fe
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
# 带  不带 shortcut-fe
# curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
# shortcut-fe
git_sparse_clone package https://github.com/chenmozhijin/turboacc shortcut-fe

# 关机
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# 应用过滤
git clone -b v6.1.3  https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# 钉钉推送
git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot

# 端口转发 A luci app of socat for nftables
git_sparse_clone main https://github.com/chenmozhijin/luci-app-socat luci-app-socat

# 定时重启
# git clone https://github.com/zxl78585/luci-app-autoreboot.git package/luci-app-autoreboot

# 磁盘管理
# git clone --depth=1 https://github.com/lisaac/luci-app-diskman package/luci-app-diskman

# 温度插件
git clone --depth=1 https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status

# 带宽监控+在线设备，相互依赖
# git_sparse_clone master https://github.com/haiibo/openwrt-packages luci-app-wrtbwmon wrtbwmon luci-app-onliner

# usb打印+网络唤醒Plus
git_sparse_clone main https://github.com/VIKINGYFY/packages luci-app-wolplus
# git clone --depth=1 https://github.com/Dboykey/luci-app-usb-printer package/luci-app-usb-printer

# kms
# git_sparse_clone master https://github.com/DokiDuck/luci-app-vlmcsd luci-app-vlmcsd vlmcsd


# theme
git clone --depth=1  https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora
git clone --depth=1  https://github.com/eamonxg/luci-app-aurora-config package/luci-app-aurora-config

git_sparse_clone openwrt-25.12  https://github.com/sbwml/luci-theme-argon luci-theme-argon luci-app-argon-config

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
