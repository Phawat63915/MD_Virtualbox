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
+ ดูว่าชื่อ Interface ที่เราใช้งานอยู่ ส่วนมากจะพบว่าเป็น ETH0 และ ETH1 แต่ถ้าเป็น VM อาจจะเป็น enp0s3 และ enp0s8 หรือ enp0s9 ก็ได้ และดูว่า เราได้รับ IP อะไร จาก DHCP มา

```bash
ip a
```
3.1.2 แก้ไขไฟล์ `/etc/netplan/01-netcfg.yaml` และให้เขียนเพิ่มประมาณนี้
+ enp0s3 และ enp0s8 หรือ enp0s9 คือชื่อ Interface ที่เราได้จากข้อ 3.1.1
+ dhcp4: หากเป็น true จะได้ IP จาก DHCP หากเป็น false จะได้ IP จาก addresses ที่เรากำหนด
+ addresses: กำหนด IP และ Subnet ที่เราต้องการให้เครื่องนี้ใช้งาน
+ optional: หากเป็น true จะไม่เกิด error หากเครื่องนี้ไม่มี Interface นี้ หากเป็น false จะเกิด error หากเครื่องนี้ไม่มี Interface นี้ (**หากต้องกาารให้เครื่องเปิดเร็ว ปรับเป็น true**)
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

#### 3.2 Enable SSH Root Login
+ ตั้งค่าเพื่อให้สามารถเข้าใช้งานผ่าน SSH ด้วย Root ได้

แก้ไขไฟล์ `/etc/ssh/sshd_config` และให้เขียนเพิ่ม `PermitRootLogin yes` ในบรรทัดสุดท้ายหรือใหม่
```bash
sudo nano /etc/ssh/sshd_config
```
เพิ่มบรรทัดนี้
```/etc/ssh/sshd_config
PermitRootLogin yes
```
