Ubuntu Kernel version check
```shell
$ uname -a
$ cat /proc/version
```


## Ubuntu Bluetooth module
[https://ubuntu.pkgs.org/20.04/ubuntu-universe-arm64/bluetooth_5.53-0ubuntu3_all.deb.html](https://ubuntu.pkgs.org/20.04/ubuntu-universe-arm64/bluetooth_5.53-0ubuntu3_all.deb.html) => 깔아도 똑같이 dmseg에 뜨지 않는다
- [blueman 설치](https://linux.how2shout.com/how-to-install-blueman-on-linux-mint-or-ubuntu-20-04/)
```python
sudo apt install blueman
sudo apt install bluez bluez-obexd
```
