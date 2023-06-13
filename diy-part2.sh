#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.68.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/360T7/g' package/base-files/files/bin/config_generate

# 固件版本名称自定义
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='ImmortalWrt build on $(date +"%Y%m%d") '/g" package/base-files/files/etc/openwrt_release

# 替换默认主题为 luci-theme-design
sed -i 's/luci-theme-bootstrap/luci-theme-design/' feeds/luci/collections/luci/Makefile
