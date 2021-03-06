# Generic cyanogenmod product
PRODUCT_NAME := cyanogen
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.startheapsize=4m \
    dalvik.vm.heapsize=32m \
    persist.sys.purgeable_assets=1 \
    persist.sys.use_dithering=0 \
    windowsmgr.max_events_per_sec=60 \
    debug.performance.tuning=1 \
    debug.sf.hw=1 \
    pm.sleep_mode=1 \
    video.accelerate.hw=1 \
    ro.mot.eri.losalert.delay=1000 \
    ro.wmt.blcr.enable=0 \
    ro.kernel.checkjni=0 \
    ro.config.nocheckin=1 \
    ro.compcache.default=18 \
    ro.HOME_APP_ADJ=1 \
    ro.min_pointer_dur=8 \
    ro.media.enc.jpeg.quality=100 \
    ro.media.enc.hprof.vid.bps=8000000 \
    net.webkit.cache.size=6291456 \
    net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    CMScreenshot \
    screenshot \
    AccountsAndSyncSettings

# Extra tools in CyanogenMod
PRODUCT_PACKAGES += \
    openvpn

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/common

# T-Mobile theme engine
include vendor/cyanogen/products/themes_common.mk

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    vendor/cyanogen/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/cyanogen/prebuilt/common/bin/zipalign:system/bin/zipalign \
    vendor/cyanogen/prebuilt/common/etc/CHANGELOG.txt:system/etc/CHANGELOG.txt \
    vendor/cyanogen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/cyanogen/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/cyanogen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cyanogen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/cyanogen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cyanogen/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/cyanogen/prebuilt/common/etc/init.d/00filesystem:system/etc/init.d/00filesystem \
    vendor/cyanogen/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/cyanogen/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/cyanogen/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/cyanogen/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/cyanogen/prebuilt/common/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    vendor/cyanogen/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \
    vendor/cyanogen/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/cyanogen/prebuilt/common/etc/init.d/21zipalign:system/etc/init.d/21zipalign \
    vendor/cyanogen/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/cyanogen/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cyanogen/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/cyanogen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/cyanogen/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/cyanogen/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/cyanogen/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/cyanogen/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh
#    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef CYANOGEN_WITH_GOOGLE

    # use all present proprietary apk
    PRODUCT_COPY_FILES += $(shell find vendor/cyanogen/proprietary -name '*.apk' \
	-printf '%p:system/app/%f ')

    # use all present proprietary lib
    PRODUCT_COPY_FILES += $(shell find vendor/cyanogen/proprietary -name '*.so' \
	-printf '%p:system/lib/%f ')

    # use all present proprietary jar
    PRODUCT_COPY_FILES += $(shell find vendor/cyanogen/proprietary -name '*.jar' \
	-printf '%p:system/framework/%f ')

    # use all present proprietary xml (permissions)
    PRODUCT_COPY_FILES += $(shell find vendor/cyanogen/proprietary -name '*.xml' \
	-printf '%p:system/etc/permissions/%f ')

else
    # Nothing...really, nothing
endif

# Required, keyboard
PRODUCT_PACKAGES += LatinIME
