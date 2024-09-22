# README

```
systemctl stop systemd-resolved
systemctl disable systemd-resolved
[ -h /etc/resolv.conf ] && rm /etc/resolv.conf
echo -e '[main]\ndns=dnsmasq' > /etc/NetworkManager/conf.d/00-dnsmasq.conf
systemctl restart NetworkManager
echo -e 'server=/example.lan/192.168.122.1\n' /etc/NetworkManager/dnsmasq.d/00-lan.conf
# look at the network.xml for an example, edit existing default or create new
virsh  net-edit  default
```

- [Adding Virtualization Support :: Fedora Docs](https://docs.fedoraproject.org/en-US/fedora-server/virtualization/installation/)
