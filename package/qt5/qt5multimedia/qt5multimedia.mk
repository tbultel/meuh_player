################################################################################
#
# qt5multimedia
#
################################################################################

QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
QT5MULTIMEDIA_SITE = $(QT5_SITE)
QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
QT5MULTIMEDIA_DEPENDENCIES = qt5base
QT5MULTIMEDIA_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
else
QT5MULTIMEDIA_LICENSE = Commercial license
QT5MULTIMEDIA_REDISTRIBUTE = NO
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
endif

define QT5MULTIMEDIA_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QT5MULTIMEDIA_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_STATIC_LIBS),)
ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
endef
endif

define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
endef
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
endef
endif

define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
endef

$(eval $(generic-package))
