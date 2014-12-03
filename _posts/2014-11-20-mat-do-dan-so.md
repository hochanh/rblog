---
layout: post
title: googleVis bản đồ Việt Nam
converted: yes
---
 
Chạy googleVis với khu vực Việt Nam thì `dataMode = "regions"` không chạy được, vì chưa [hỗ trợ](https://support.google.com/fusiontables/answer/173438?hl=en).
 
Đành chạy với thông số `dataMode = "markers"`:
 

{% highlight r %}
library(googleVis)
pop2013 <- read.csv("./vietnam/pop2013.csv")
top10 <- pop2013[pop2013$Pop.Area > sort(pop2013$Pop.Area)[53], ]
top10_gg = gvisGeoMap(
  top10, "Province", "Pop.Area",
  options = list(region = "VN", dataMode = "markers",
                 width = 400, height = 500))
plot(top10_gg)
print(top10_gg, file="../figures/mat-do-dan-so/top10_gg.html")
{% endhighlight %}
 
[Xem kết quả](../../figures/mat-do-dan-so/top10_gg.html).
 
 
Tải [`pop2013.csv`](http://raw.githubusercontent.com/manhtai/blog/gh-pages/_knitr/vietnam/pop2013.csv).
