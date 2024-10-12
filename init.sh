#!/bin/bash

nohup virt-install \
    --name {{ item.name }} \
    --os-type={{ item.distro | default('centos7.0') }} \
    --hvm \
    --vcpus {{ item.vcpus | default('2') }} \
    --memory {{ item.memory | default('768') }} \
    --disk path=/var/lib/libvirt/images/{{ item.name }}.img,size={{ item.size | default('10') }} \
    --network network={{ item.network | default('test') }} \
    --vnc \
    --location /var/lib/libvirt/media/{{ item.iso | default('CentOS-7-x86_64-DVD-2009.iso') }} \
    --initrd-inject={{ tempdir.path }}/{{ item.name }}.ks \
    --extra-args="ks=file:/{{ item.name }}.ks" \
    --noautoconsole \
    --wait=-1 &> /dev/null &
