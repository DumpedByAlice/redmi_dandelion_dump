#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b1cb7ffad9497aa4ac1833826863fdd70a80b69e; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:d011ed3dfcf918ed7277be47db47f98fd723671a \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b1cb7ffad9497aa4ac1833826863fdd70a80b69e && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
