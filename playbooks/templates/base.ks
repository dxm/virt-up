
install
lang en_US.UTF-8
keyboard us
network --bootproto=dhcp --hostname={{ item.name }}
rootpw password
authconfig --enableshadow
timezone America/Los_Angeles
bootloader --location=mbr

text
skipx
zerombr

clearpart --all --initlabel
part swap --asprimary --size=512
part / --fstype=ext3 --asprimary --size=1 --grow
user --name=admin --password=password --groups=wheel
reboot

%packages --nobase
@core
acpid
libselinux-python
man
man-pages
openssh-clients
pm-utils
qemu-guest-agent
%end

%post
chkconfig acpid on
%end
