---
layout: post
title: "Hướng dẫn cài Jekyll trên Ubuntu"
description: "Hướng dẫn cài Jekyll trên Ubuntu 14.04"
tags: [Jekyll, Ubuntu]
comments: true
share: true
---

### Giới thiệu
Nói một cách dễ hiểu, Jekyll là một hệ quản trị dữ liệu blog. Chẳng hạn như blog này ;)

GitHub pages cũng sử dụng Jekyll, nên nếu không muốn cài Jekyll lên máy, bạn có thể tải template có sẵn về, viết bài, rồi "git push" lên GitHub.

Bài hướng dẫn này hướng dẫn cài Jekyll lên Ubuntu 14.04.

### Cài đặt

{% highlight text %}
sudo apt-get install ruby ruby-dev make
{% endhighlight %}

{% highlight text %}
sudo gem install jekyll --no-rdoc --no-ri
{% endhighlight %}

{% highlight text %}
sudo apt-get install nodejs
{% endhighlight %}

### Khởi động Jekyll

{% highlight text %}
~$ cd /github/blog 'thư mục chứa blog
~$ jekyll serve
{% endhighlight %}

Đường dẫn mặc định của trang web là http://0.0.0.0:4000

_Tham khảo:_ http://michaelchelen.net/81fa/install-jekyll-2-ubuntu-14-04/
