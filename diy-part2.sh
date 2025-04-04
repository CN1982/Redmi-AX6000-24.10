#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/Redmi_AX6000/g' package/base-files/files/bin/config_generate

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# iStore
git_sparse_clone main https://github.com/linkease/istore-ui app-store-ui
git_sparse_clone main https://github.com/linkease/istore luci

# 时区
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# 修改插件名字
sed -i 's/"Argon 主题设置"/"主题设置"/g' `egrep "Argon 主题设置" -rl ./`
sed -i 's/"Release Ram"/"内存释放"/g' `egrep "Release Ram" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"SSR Plus"/g' `egrep "ShadowSocksR Plus+" -rl ./`
sed -i 's/"UU游戏加速器"/"游戏加速"/g' `egrep "UU游戏加速器" -rl ./`
sed -i 's/"备份与升级"/"备份/升级"/g' `egrep "备份与升级" -rl ./`
sed -i 's/"AList"/"文件搜刮"/g' `egrep "AList" -rl ./`
sed -i 's/"AliDDNS"/"阿里DDNS"/g' `egrep "AliDDNS" -rl ./`
sed -i 's/"服务质量(QoS)"/"服务质量"/g' `egrep "服务质量(QoS)" -rl ./`
sed -i 's/"ADBYBY Plus +"/"广告拦截"/g' `egrep "ADBYBY Plus +" -rl ./`
sed -i 's/"MWAN3 Helper"/"分流助手"/g' `egrep "MWAN3 Helper" -rl ./`
sed -i 's/"udpxy"/"电视组播"/g' `egrep "udpxy" -rl ./`
sed -i 's/"UPnP"/"即插即用"/g' `egrep "UPnP" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速器"/g' `egrep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"frp 客户端"/"RFP客户端"/g' `egrep "frp 客户端" -rl ./`
 sed -i 's/"终端"/"TTYD终端"/g' `egrep "终端" -rl ./`


cat > package/base-files/files/etc/banner << EOF
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 %D %V, %C
 -----------------------------------------------------
