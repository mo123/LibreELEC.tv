# RK3399

This is a SoC device for RK3399

**Build**

* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=hugsun-x99 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=khadas-edge make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=nanopc-t4 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=nanopi-m4 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=orangepi make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rock960 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rock-pi-4 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rock-pi-n10 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rockpro64 make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=roc-pc make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=roc-pc-plus make image`
* `PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=sapphire make image`

If you need to build roc-pc-plus image,must also change LibreELEC.tv/distributions/LibreELEC/options
otherwise RTL8723DU wifi and driver isn't build
ADDITIONAL_DRIVERS="RTL8192CU RTL8192DU RTL8192EU RTL8188EU RTL8812AU RTL8723DU"
