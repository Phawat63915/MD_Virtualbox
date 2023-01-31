## [(Back) Ubuntu Server 22.04.1 LTS](./Ubuntu%20Server%2022.04.1%20LTS.md)
#### 1.Create VM in Oracle vm virtualbox
1.1 กดปุ่ม New

![vm_setup1](./vm_setup1.png)

1.2 กำหนดชื่อ VM และประเภท OS ที่ต้องการ

![vm_setup2](./vm_setup2.png)

1.3 กำหนด RAM และ Hard Disk ที่ต้องการ

![vm_setup3](./vm_setup3.png)

1.4 กำหนด Hard Disk ที่ต้องการ

![vm_setup4](./vm_setup4.png)

1.5 กดปุ่ม Finish เพื่อสร้าง VM ใหม่

![vm_setup5](./vm_setup5.png)


#### 2.ตั้งค่า VM ใหม่ หรือ เครื่องที่สร้าง
2.1 กดเข้าตั้งค่า

![vm_setup6](./vm_setup6.png)

2.2 กดเข้าไปที่ menu system

![vm_setup7](./vm_setup7.png)

2.3 กดเข้าไปที่ menu processor

![vm_setup8](./vm_setup8.png)

2.4 ไปที่หัวข้อ Extended Features และเลือก Enable PAE/NX ติดถูก

![vm_setup9](./vm_setup9.png)

2.5 ไปที่ menu storage และไปที่หัวข้อ Strorage Devices Controller: SATA Ubuntu Server 22.04.1 LTS

![vm_setup10](./vm_setup10.png)

2.6 ไปที่หัวข้อ Attributes ไปที่ Hard Disk เลือกติดถูก Solid State Drive (หากเครื่องเราเป็น SSD หรือไม่ก็ได้)

![vm_setup11](./vm_setup11.png)

2.7 ไปที่ Menu Network และเลือก Adapter 1 และเลือก Bridged Adapter

![vm_setup12](./vm_setup12.png)

2.8 ไปที่ Adapter 2 

![vm_setup13](./vm_setup13.png)

2.9 ติด Enable Network Adapter และเลือก Host-only Adapter และกด OK

![vm_setup14](./vm_setup14.png)
### [(Back) Ubuntu Server 22.04.1 LTS](./Ubuntu%20Server%2022.04.1%20LTS.md)