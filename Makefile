ifneq ($(KERNELRELEASE),)
	xiaomifp-objs := xiaomi_fingerprint.o
	obj-$(CONFIG_FINGERPRINT_XIAOMI_FP) += xiaomifp.o
else
	KDIR = $(OUT)/obj/KERNEL_OBJ
	CROSS_COMPILE = $(ANDROID_TOOLCHAIN)/aarch64-linux-android-
	CLANG = $(ANDROID_BUILD_TOP)/prebuilts/clang/host/linux-x86/clang-r370808
	REAL_CC = $(CLANG)/bin/clang
	AR = $(CLANG)/bin/llvm-ar
	LLVM_NM = $(CLANG)/bin/llvm-nm
	LD = $(CLANG)/bin/ld.lld

.PHONY: clean

default::
	$(MAKE) ARCH=arm64 CROSS_COMPILE=$(CROSS_COMPILE) REAL_CC=$(REAL_CC) CLANG_TRIPLE=aarch64-linux-gnu- AR=$(AR) LLVM_NM=$(LLVM_NM) LD=$(LD) -C $(KDIR) M=$(PWD) modules
clean:
	@rm -rf *.o* *.order *.symvers *.mod* .*.o.cmd .*.mod.o.cmd .*.ko.cmd .tmp_versions *.ko

endif


#Makefile for Xiaomi touch driver

obj-$(CONFIG_TOUCHSCREEN_XIAOMI_TOUCHFEATURE) += xiaomi_touch.o
