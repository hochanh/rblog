---
layout: post
title: "Bản đồ Việt Nam trong R"
converted: yes
---
 
## Lấy dữ liệu
 
Dữ liệu bản đồ Việt Nam cho R được lấy từ trang <http://gadm.org/>. (Trên trang này còn có rất nhiều bản đồ khác.)
 
Hoặc lấy trực tiếp trong R:
 

{% highlight r %}
con <- url("http://biogeo.ucdavis.edu/data/gadm2/R/VNM_adm2.RData")
print(load(con))
close(con)
{% endhighlight %}
 
Sau khi lấy về (ngày 21/11/2014) thì thấy bản đồ này là bản đồ 64 tỉnh, tức bản đồ trước khi Hà Tây sáp nhập vào Hà Nội năm 2008. Vậy là phải thêm bước 2.
 
## Sáp nhập tỉnh
 
### Tải dữ liệu
 

{% highlight r %}
load("./vietnam/maps/VNM_adm2.RData")
{% endhighlight %}
 
### Gọi thư viện cần thiết
 

{% highlight r %}
libs <- c("rgeos", "maptools", "sp")
lapply(libs, require, character.only = TRUE)
{% endhighlight %}
 
### Nhóm và sáp nhập tỉnh
 
#### Sáp nhập SpatialPolygons
 

{% highlight r %}
gadm63.fac <- as.factor(c(1:18,19,18,21:64))
gadm63.sp <- unionSpatialPolygons(gadm, gadm63.fac)
{% endhighlight %}
 
#### Sáp nhập DataFrame
 

{% highlight r %}
# Lấy data frame từ gadm
gadm63.df <- gadm@data
 
# Xóa tỉnh "Hà Tây"
gadm63.df <- gadm63.df[-20, ]
{% endhighlight %}
 
#### Trộn SP và DF
 

{% highlight r %}
gadm63 <- SpatialPolygonsDataFrame(gadm63.sp, gadm63.df)
{% endhighlight %}
 
#### Kiểm tra
 

{% highlight r %}
plot(gadm[c(18,20),])
plot(gadm63[10, ], add = TRUE, border = "red", lwd = 2)
{% endhighlight %}
 
![Hà Nội](../../figures/ban-do-viet-nam-in-r/hanoi.png){: .fig}
 
Lưu lại dùng sau:
 

{% highlight r %}
saveRDS(gadm63, file="./vietnam/geo63.rds")
{% endhighlight %}
 
## Bản đồ Việt Nam
 

{% highlight r %}
geo63 <- readRDS("./vietnam/geo63.rds")
spplot(geo63, "ID_1", main="63 tỉnh")
{% endhighlight %}
 
![Việt Nam](../../figures/ban-do-viet-nam-in-r/geo63.png){: .fig}
 
 
Tải tệp [`geo63.rds`](http://raw.githubusercontent.com/vomanhtai/blog/gh-pages/_knitr/vietnam/geo63.rds).
