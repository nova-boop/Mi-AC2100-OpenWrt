# RedMi AND XIAOMI AC2100 OpenWrt

# Plug -in
```text
luci-app-attendedsysupgrade=y
luci-app-ddns=y
luci-app-fileassistant=y
luci-app-firewall=y
luci-app-https-dns-proxy=y
luci-app-natmapt=y
luci-app-onliner=y
luci-app-package-manager=y
luci-app-pushbot=y
luci-app-ramfree=y
luci-app-socat=y
luci-app-tcpdump=y
luci-app-ttyd=y
luci-app-uhttpd=y
luci-app-upnp=y
luci-app-vlmcsd=y
luci-app-wol=y
luci-app-wrtbwmon=y
luci-lib-httpprotoutils=y
luci-light=y
luci-proto-ipv6=y
luci-proto-ppp=y
luci-proto-relay=y
luci-proto-wireguard=y
luci-theme-argon=y
luci-theme-bootstrap=y
luci-theme-material=y
luci-theme-openwrt=y
```

# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/Qs315490/RedMi-AC2100-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/Qs315490/RedMi-AC2100-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/Qs315490/RedMi-AC2100-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

Build OpenWrt using GitHub Actions

[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## info

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Acknowledgments

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/Qs315490/RedMi-AC2100-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
