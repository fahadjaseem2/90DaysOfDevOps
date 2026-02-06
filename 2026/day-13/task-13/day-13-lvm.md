# Day 13 – Linux Volume Management (LVM)
## Commands Used
- `sudo su` / `sudo -i`
- `lsblk` (list all blocks)

*After Attaching volumes(ESB)*

<img width="567" height="56" alt="Screenshot 2026-02-06 at 3 58 19 PM" src="https://github.com/user-attachments/assets/df3bd8d3-c9de-42f9-91ee-9f6a500a98d8" />

---

- `pvcreate` / `pvs`

*After creating pysical volume*

<img width="562" height="160" alt="Screenshot 2026-02-06 at 4 45 01 AM" src="https://github.com/user-attachments/assets/26143916-56cd-4f51-b139-dcd8c7c01c73" />

---

- `vgcreate` / `vgs`

*Creating volume group using two physical volume nvme1n1 and nvme2n1*

<img width="567" height="102" alt="Screenshot 2026-02-06 at 4 48 48 AM" src="https://github.com/user-attachments/assets/9fda7d29-1b0d-4bee-8d26-f9487ddb9b2b" />

---

- `lvcreate` / `lvs`

*Creating Logical volume ussing volume group*

<img width="566" height="107" alt="Screenshot 2026-02-06 at 4 52 10 AM" src="https://github.com/user-attachments/assets/a572ac3a-4f10-412b-b2a8-9d45ba67d54b" />

---

- `mkfs.ext4 <source>`
- `mount <source> <destination>`

*After mounting logical volume*

<img width="577" height="70" alt="Screenshot 2026-02-06 at 4 59 28 AM" src="https://github.com/user-attachments/assets/423b79f0-5b02-4fd3-b7a1-24283f52288a" />

---

- `lvextend -L +300M /dev/aws_vg/aws_lv` **OR** `lvresize -L +300M /dev/aws_vg/aws_lv`

*extend 300 M.B. size on logical volume*

<img width="566" height="58" alt="Screenshot 2026-02-06 at 5 07 27 AM" src="https://github.com/user-attachments/assets/3f48a0cf-11d8-45de-894d-6c593d16a2a2" />

**Logical Volume is 800MB But Filesystem size is still 500MB(You must resize the filesystem manually).**

<img width="569" height="34" alt="Screenshot 2026-02-06 at 4 03 59 PM" src="https://github.com/user-attachments/assets/f6b1ea8d-86e3-43e6-b64e-f75521a2e572" />

---

- `resize2fs /dev/aws_vg/aws_lv` 

<img width="573" height="91" alt="Screenshot 2026-02-06 at 4 15 36 PM" src="https://github.com/user-attachments/assets/cafe9a70-96aa-492f-9be7-1a3af55f79bd" />


*verify*

<img width="573" height="18" alt="Screenshot 2026-02-06 at 4 16 58 PM" src="https://github.com/user-attachments/assets/55c7b09b-91fd-427c-ac99-b37ef1c13a9a" />

---

- `lvresize -r -L +300M /dev/aws_vg/aws_lv`

r = resize the filesystem

<img width="573" height="162" alt="Screenshot 2026-02-06 at 4 12 47 PM" src="https://github.com/user-attachments/assets/10354949-a234-42d3-b7ad-9fb44e374a73" />


*verify*

<img width="564" height="37" alt="Screenshot 2026-02-06 at 4 13 06 PM" src="https://github.com/user-attachments/assets/6109cdc8-2b42-4e7b-adcf-83cec035fd9e" />

---

# What I Learned
LVM Architecture Hierarchy
- Physical Volumes (PV)
- Volume Groups (VG)
- Logical Volumes (LV)
