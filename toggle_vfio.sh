#!/bin/sh

# echo -n "0000:01:00.2" > /sys/bus/pci/drivers/xhci_hcd/unbind
# echo -n "0000:01:00.2" > /sys/bus/pci/drivers/vfio-pci/bind
#
# echo -n "0000:01:00.1" > /sys/bus/pci/drivers/snd_hda_intel/unbind
# echo -n "0000:01:00.1" > /sys/bus/pci/drivers/vfio-pci/bind
#
# echo -n "0000:01:00.3" > /sys/bus/pci/drivers/nvidia-gpu/unbind
# echo -n "0000:01:00.3" > /sys/bus/pci/drivers/vfio-pci/bind
#
# echo -n "0000:01:00.0" > /sys/bus/pci/drivers/nvidia/unbind
# echo -n "0000:01:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
#
# echo -n "0000:00:01.0" > /sys/bus/pci/drivers/pcieport/unbind
# echo -n "0000:00:01.0" > /sys/bus/pci/drivers/vfio-pci/bind
virsh nodedev-detach --device pci_0000_01_00_0
virsh nodedev-detach --device pci_0000_01_00_1
virsh nodedev-detach --device pci_0000_01_00_2
virsh nodedev-detach --device pci_0000_01_00_3
virsh nodedev-detach --device pci_0000_01_00_0
virsh nodedev-detach --device pci_0000_00_01_0

# # Unbind VTconsoles
# echo 0 > /sys/class/vtconsole/vtcon0/bind
# echo 0 > /sys/class/vtconsole/vtcon1/bind
# # Unbind EFI-Framebuffer
# echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind
# # Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
# # sleep 2

# # Unload all Nvidia drivers
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r nvidia_uvm
modprobe -r nvidia

# ## Load vfio
# modprobe vfio
# modprobe vfio_iommu_type1
# modprobe vfio_pci
