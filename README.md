~~~
- docker run

	docker run --device-cgroup-rule "b 7:* rmw" \
	--device /dev/loop-control:/dev/loop-control \
	--device=/dev/loop0:/dev/loop0 \
	--cap-add SYS_ADMIN --rm -it centos:7 bash

- To create 100MB file , enter:
	dd of=100M_img.ext4 bs=1024 count=0 seek=$[1024*100]
- To create 1GB, file:
	dd of=1G_img.ext4 bs=1 count=0 seek=1G

- with /dev/random, enter:
	dd if=/dev/random of=img.ext4 iflag=fullblock bs=1024 count=$[1024*100]

- Available capabilities
	capsh --print

- Appropriate privilege
       (Linux: the CAP_SYS_ADMIN capability) is
       required to mount filesystems.
REF: http://man7.org/linux/man-pages/man2/mount.2.html

- cgroup docker
	/sys/fs/cgroup/devices/docker

- format ext4:
	losetup -f		
	# 7 significa que apunta a la memoria de loop
	# 0 - x es el numero del loop
	# mknod /dev/loop0 b 7 0
	losetup /dev/loop0 1_img.ext4
	losetup -a
	mkfs.ext4 /dev/loop0

- mount img.ext4:
	mkdir dir_img
	mount /dev/loop0 dir_img	
	chown -R formatcom:formatcom dir_img

- test img.ext4:
	echo hello world > dir_img/hello.txt
	cat dir_img/hello.txt
	umount dir_img
	ls dir_img
	mount /dev/loop dir_img
	cat dir_img/hello.txt
	umount dir_img
	loseup -d /dev/loop
	
~~~
