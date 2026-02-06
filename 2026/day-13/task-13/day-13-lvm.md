# Day 13 – Linux Volume Management (LVM)
## Commands Used
- `sudo su` / `sudo -i`
- `lsblk` (list all blocks)

*After Attaching volumes(ESB)*
![alt text](<Screenshot 2026-02-06 at 4.18.41 AM.png>)
- `pvcreate` / `pvs`

*After creating pysical volume*
![alt text](<Screenshot 2026-02-06 at 4.45.01 AM.png>)

- `vgcreate` / `vgs`

*Creating volume group using two physical volume nvme1n1 and nvme2n1*
![alt text](<Screenshot 2026-02-06 at 4.48.48 AM.png>)

- `lvcreate` / `lvs`

*Creating Logical volume ussing volume group*
![alt text](<Screenshot 2026-02-06 at 4.52.10 AM.png>)

- `mkfs.ext4 <source>`
- `mount <source> <destination>`

*After mounting logical volume*
![alt text](<Screenshot 2026-02-06 at 4.59.28 AM.png>)

- `lvextend -L +300M /dev/aws_vg/aws_lv` **OR** `lvresize -L +300M /dev/aws_vg/aws_lv`

*extend 300 M.B. size on logical volume*
![alt text](<Screenshot 2026-02-06 at 5.07.27 AM.png>)
**Logical Volume is 900MB But Filesystem size is still 500MB(You must resize the filesystem manually).**
![alt text](<Screenshot 2026-02-06 at 4.03.59 PM.png>)

- `resize2fs /dev/aws_vg/aws_lv` 

![alt text](<Screenshot 2026-02-06 at 4.15.36 PM.png>)

*verify*
![alt text](<Screenshot 2026-02-06 at 4.16.58 PM.png>)

- `lvresize -r -L +300M /dev/aws_vg/aws_lv`

r = resize the filesystem
![alt text](<Screenshot 2026-02-06 at 4.12.47 PM.png>)

*verify*
![alt text](<Screenshot 2026-02-06 at 4.13.06 PM.png>)


# What I Learned
LVM Architecture Hierarchy
- Physical Volumes (PV)
- Volume Groups (VG)
- Logical Volumes (LV)