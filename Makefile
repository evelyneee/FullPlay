TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Music

DEBUG = 0
FINALPACKAGE = 1
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

before-stage::
	find . -name ".DS\_Store" -delete

after-install::
	install.exec "sbreload"

TWEAK_NAME = FullPlay

FullPlay_FILES = Tweak.xm
FullPlay_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
