for device in $(cat device.list); do
	DEVICE="$DEVICE --device /dev/$device:/dev/$device"
done

docker run --cap-add SYS_ADMIN \
		--cap-drop MKNOD \
		$DEVICE \
		--rm -it centos:7 bash

