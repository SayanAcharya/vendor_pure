# Telephony packages
PRODUCT_PACKAGES += \
    telephony-ext \
    ims-ext-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# World APN list
PRODUCT_COPY_FILES += \
    vendor/pure/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml
    
# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/pure/prebuilt/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml  
    
# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/pure/prebuilt/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml     
