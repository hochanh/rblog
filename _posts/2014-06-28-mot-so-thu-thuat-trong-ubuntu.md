---
layout: post
title: "Một số thủ thuật trong Ubuntu"
description: "Xóa thông báo lỗi, tự động mount ổ đĩa, sử dụng 3G"
tags: [ubuntu]
comments: true
share: true
---


Tôi mới cài đặt Ubuntu 14.04 LTS để thay thế cho bản Windows 8.1 có bản quyền đàng hoàng của mình :alien:

<figure><img src="/images/ubuntu14.04.png" />
<figcaption>Ubuntu 14.04</figcaption>
</figure>

Sau đây là một số thủ thuật khá hữu ích mà tôi mày mò được trong thời gian qua.

### Xóa thông báo lỗi trong Ubuntu, sử dụng câu lệnh:

{% highlight text %}
sudo rm /var/crash/*
{% endhighlight %}


### Tự động mout ổ đĩa khi khởi động:

{% highlight text %}
sudo gedit /etc/fstab
{% endhighlight %}

Thêm vào dòng sau

{% highlight text %}
UUID=0B2C31DE2DB09F26 /data			          ntfs    errors=remount-ro 0       1
{% endhighlight %}

Trong đó `/data` là nơi mount ổ đĩa, `0B2C31DE2DB09F26` là mã UUID của ổ đĩa, `ntfs` là định dạng ổ đĩa.

### Thay đổi DNS cho mạng trong Ubuntu

{% highlight text %}
sudo gedit /etc/resolv.conf
{% endhighlight %}

Rồi thêm dòng sau vào:
{% highlight text %}
nameserver 8.8.8.8
nameserver 8.8.4.4
{% endhighlight %}

Nameserver ở trên là của Google.

### Sử dụng USB 3G trong Ubuntu

Cài đặt ModemManager và ModemManger GUI:
{% highlight text %}
sudo apt-get install modemmanager
sudo apt-get install modem-manager-gui
{% endhighlight %}

Phương pháp này sử dụng được với D-com 3G loại E1750 và MF190S của Viettel.

Dùng Modem Manager GUI cho phép thực hiện gửi tin nhắn và chạy USSD, tôi chưa tìm ra cách để sử dụng được tính năng gọi điện khi lắp sim bình thường vào D-com như trên Windows.

### Xóa tự khởi động một số tiến trình

#### cups

```bash
sudo geany /etc/init/cups.conf
sudo geany /etc/init/cups-browsed.conf
```

#### bluetooth

```bash
sudo geany /etc/init/bluetooth.conf
```

#### apache2

```bash
update-rc.d -f apache2 remove
```

#### mysql

```bash
echo manual | sudo tee /etc/init/mysql.override
```
