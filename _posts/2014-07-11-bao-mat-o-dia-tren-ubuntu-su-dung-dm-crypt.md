---
layout: post
title: "Bảo mật phân vùng ổ đĩa trên Ubuntu sử dụng dm-crypt"
description: "Bảo mật phân vùng ổ đĩa trên Ubuntu sử dụng dm-crypt"
tags: [ubuntu]
comments: true
share: true
---

# Bước 1: Cài cryptsetup

{% highlight text %}
sudo apt-get install cryptsetup
{% endhighlight %}

# Bước 2: Cấu hình phân vùng LUKS

Ở đây tôi muốn bảo mật phân vùng /dev/sda2 trên ổ đĩa cứng, bạn muốn bảo mật phân vùng nào thì thay đổi đường dẫn tương ứng. Chú ý thao tác này sẽ xóa hết dữ liệu có trong /dev/sda2.

{% highlight text %}
sudo cryptsetup -y -v luksFormat /dev/sda2
{% endhighlight %}

Lệnh trên khởi tạo phân vùng LUKS và tạo mã đăng nhập. Tiếp theo, chúng ta tạo mapper tới phân vùng vừa tạo: (myscret là tên tự chọn)

{% highlight text %}
sudo cryptsetup open /dev/sda2 mysecret
{% endhighlight %}

# Bước 3: Định dạng phân vùng LUKS

Đầu tiên chúng ta ghi đè dữ liệu cũ trên phân vùng vừa tạo bằng các dữ liệu ngẫu nhiên, sử dụng câu lệnh:

{% highlight text %}
sudo dd if=/dev/zero of=/dev/mapper/mysecret
{% endhighlight %}

**Lưu ý:** Lệnh này chạy khá mất thời gian, với phân vùng cỡ TB có thể mất tới 1 ngày để chạy xong!

Tiếp theo chúng ta định dạng phân vùng: (ở đây tôi chọn định dạng ext4)

{% highlight text %}
sudo mkfs.ext4 /dev/mapper/mysecret
{% endhighlight %}

**XONG!!!**

Để mount phân vùng này bạn có thể dùng Nautilus hoặc câu lệnh:

{% highlight text %}
sudo mkdir /mysecret
sudo mount /dev/mapper/mysecret /mysecret
{% endhighlight %}

Để unmout bạn dùng Nautilus hoặc câu lệnh:

{% highlight text %}
sudo umount /mysecret
{% endhighlight %}

Để bảo mật dữ liệu, unmount phân vùng và đăng xuất, hoặc dùng câu lệnh:

{% highlight text %}
sudo cryptsetup luksClose mysecret
{% endhighlight %}
