## [Intall The Master OS Template](../../README.md)
Ubuntu Server 22.04.1 LTS
### [1.Create VM Ubuntu Server 22.04.1 LTS](./Create%20VM%20Ubuntu%20Server%2022.04.1%20LTS.md)
#### 3.Setting Ubuntu Server 22.04.1 LTS
#### 3.1 Package update
+ ก่อนอย่างน้อย 1 ครั้งเพื่อพอเครื่องที่ Cloen มาใช้งาน จะได้เป็นรุ่นล่าสุด ไม่ต้องพิมใหม่ทุกครั้ง

```bash
sudo apt update -y && sudo apt upgrade -y
```
#### 3.1 Setting Network
+ ตั้งค่า fixip เพื่อไม่ให้ DHCP แก้ไข IP ให้เราหรือสุ่มมั่วทุกคั้งที่เราเปิดเครื่อง

3.1.1 เช็กวง IP ก่อน
+ ดูว่าเราอยู่ใน Network ส่วนมากจะพบว่าเป็น ETH0 และ ETH1 แต่ถ้าเป็น VM อาจจะเป็น enp0s3 และ enp0s8 หรือ enp0s9 ก็ได้
```bash
ip a
```
```bash
nano /etc/netplan/01-netcfg.yaml
```
```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      dhcp4: true
      optional: true
    enp0s8:
      dhcp4: false
      optional: true
      addresses: [192.168.56.15/24]
    enp0s9:
      dhcp4: true
      optional: true
  version: 2

```