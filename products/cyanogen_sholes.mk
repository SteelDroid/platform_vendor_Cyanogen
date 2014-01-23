# Inherit AOSP device configuration for passion.
$(call inherit-product, device/motorola/sholes/sholes.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_sholes
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := sholes
PRODUCT_MODEL := Droid
PRODUCT_MANUFACTURER := Motorola

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=FRG83G PRODUCT_NAME=voles TARGET_DEVICE=sholes BUILD_FINGERPRINT=verizon/voles/sholes/sholes:2.2.2/FRG83G/91102:user/release-keys PRODUCT_BRAND=verizon PRIVATE_BUILD_DESC="voles-user 2.2.2 FRG83G 91102 release-keys" BUILD_NUMBER=91102 BUILD_UTC_DATE=1294972140 TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys USER=android-build

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/bin/sysrw:system/bin/sysrw \
    vendor/cyanogen/prebuilt/common/bin/sysro:system/bin/sysro

# Steel Droid Gapps - /system/tempgapp/ - Will move to /data/app/ during install
PRODUCT_COPY_FILES += \
    vendor/motorola/sholes/gapps/Calculator.apk:/system/tempgapps/Calculator.apk \
    vendor/motorola/sholes/gapps/Calendar.apk:/system/tempgapps/Calendar.apk \
    vendor/motorola/sholes/gapps/Doggie.apk:/system/tempgapps/Doggie.apk \
    vendor/motorola/sholes/gapps/Email.apk:/system/tempgapps/Email.apk \
    vendor/motorola/sholes/gapps/LiveWallpapers.apk:/system/tempgapps/LiveWallpapers.apk \
    vendor/motorola/sholes/gapps/MagicSmokeWallpapers.apk:/system/tempgapps/MagicSmokeWallpapers.apk \
    vendor/motorola/sholes/gapps/Music.apk:/system/tempgapps/Music.apk \
    vendor/motorola/sholes/gapps/ThemeManager.apk:/system/tempgapps/ThemeManager.apk \
    vendor/motorola/sholes/gapps/VisualizationWallpapers.apk:/system/tempgapps/VisualizationWallpapers.apk \
    vendor/motorola/sholes/gapps/VoiceDialer.apk:/system/tempgapps/VoiceDialer.apk \
    vendor/motorola/sholes/gapps/WiredTether.apk:/system/tempgapps/WiredTether.apk \
    vendor/motorola/sholes/gapps/WirelessTether.apk:/system/tempgapps/WirelessTether.apk

# Steel Droid Gapps - /system/*
PRODUCT_COPY_FILES += \
    vendor/motorola/sholes/gapps/su:/system/xbin/su \
    vendor/motorola/sholes/gapps/Superuser.apk:/system/app/Superuser.apk \
    vendor/motorola/sholes/gapps/FOTAKill.apk:/system/app/FOTAKill.apk \
    vendor/motorola/sholes/gapps/GoogleBackupTransport.apk:/system/app/GoogleBackupTransport.apk \
    vendor/motorola/sholes/gapps/GoogleCalendarSyncAdapter.apk:/system/app/GoogleCalendarSyncAdapter.apk \
    vendor/motorola/sholes/gapps/GoogleContactsSyncAdapter.apk:/system/app/GoogleContactsSyncAdapter.apk \
    vendor/motorola/sholes/gapps/GooglePartnerSetup.apk:/system/app/GooglePartnerSetup.apk \
    vendor/motorola/sholes/gapps/GoogleServicesFramework.apk:/system/app/GoogleServicesFramework.apk \
    vendor/motorola/sholes/gapps/MarketUpdater.apk:/system/app/MarketUpdater.apk \
    vendor/motorola/sholes/gapps/MediaProvider.apk:/system/app/MediaProvider.apk \
    vendor/motorola/sholes/gapps/MediaUploader.apk:/system/app/MediaUploader.apk \
    vendor/motorola/sholes/gapps/NetworkLocation.apk:/system/app/NetworkLocation.apk \
    vendor/motorola/sholes/gapps/OneTimeInitializer.apk:/system/app/OneTimeInitializer.apk \
    vendor/motorola/sholes/gapps/SetupWizard.apk:/system/app/SetupWizard.apk \
    vendor/motorola/sholes/gapps/Talk.apk:/system/app/Talk.apk \
    vendor/motorola/sholes/gapps/Torch.apk:/system/app/Torch.apk \
    vendor/motorola/sholes/gapps/Vending.apk:/system/app/Vending.apk

# Steel Droid Gapps - non-apps
PRODUCT_COPY_FILES += \
    vendor/motorola/sholes/gapps/etc/permissions/com.google.android.maps.xml:/system/etc/permissions/com.google.android.maps.xml \
    vendor/motorola/sholes/gapps/etc/permissions/features.xml:/system/etc/features.xml \
    vendor/motorola/sholes/gapps/framework/com.google.android.maps.jar:/system/framework/com.google.android.maps.jar \
    vendor/motorola/sholes/gapps/lib/libvoicesearch.so:/system/lib/libvoicesearch.so

PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/sholes
