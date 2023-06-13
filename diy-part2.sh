#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================


# 替换默认主题为 luci-theme-design
sed -i 's/luci-theme-bootstrap/luci-theme-design/' feeds/luci/collections/luci/Makefile

# Modify default IP
sed -i 's/192.168.[0-9]\{1,3\}.1/192.168.68.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/ImmortalWrt/360T7/g' package/base-files/files/bin/config_generate

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# NTP
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# 
MTK_HNAT(){
  rm -rf target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  mv mtk_hnat target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
}

MT_WIFI(){
  rm -rf package/mtk/drivers/mt_wifi
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/package/mtk/drivers/mt_wifi
  mv mt_wifi package/mtk/drivers/mt_wifi
}

MTK_HNAT
echo '-------------------------------------------------------------------------------------------------'
MT_WIFI

# 固件版本名称自定义
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='ImmortalWrt build on $(date +"%Y%m%d") '/g" package/base-files/files/etc/openwrt_release

