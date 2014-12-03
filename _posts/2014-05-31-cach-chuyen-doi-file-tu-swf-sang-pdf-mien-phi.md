---
layout: post
title: "Cách chuyển đổi từ swf sang pdf miễn phí"
description: "Dùng cách này, chúng ta có thể lấy được file miễn phí từ những trang web dùng FlexPaper có tính phí, chẳng hạn trang"
comments: true
share: true
---


Tải SWFTools tại [đây](http://www.swftools.org/download.html).

Sau khi cài đặt, mở CMD lên, chuyển về thư mục chứa file swf cần chuyển, dán dòng lệnh dưới đây vào.

{% highlight c %}

for %a IN ("*.swf") do "DUONG_DAN_THU_MUC_CAI_SWFTOOLS\swfrender" "DUONG_DAN_THU_MUC_CHUA_FILE_SWF\%a" -o "DUONG_DAN_FILE_ANH\%~na.png" -X 1530 -Y 1980

{% endhighlight %}

Chẳng hạn tôi để file swf trong thư mục Downloads, cài đặt SWFTools ở ổ C:, tôi có

{% highlight c %}

for %a IN ("*.swf") do "C:\Program Files\SWFTools\swfrender" "H:\Stuff\Downloads\%a" -o "H:\Stuff\Downloads\%~na.png" -X 1530 -Y 1980

{% endhighlight %}


Chờ một lát, file swf sẽ được chuyển sang định dạng png. Bấy giờ bạn dùng chương trình tạo file pdf, chẳng hạn NitroPDF để tạo file.

Dùng cách này, chúng ta có thể lấy được file miễn phí từ những trang web dùng FlexPaper có tính phí, chẳng hạn trang [DoAn.edu.vn](http://doan.edu.vn).

Các bạn có thể Google để biết thêm cách để lấy được file swf từ các trang web dùng FlexPaper.
