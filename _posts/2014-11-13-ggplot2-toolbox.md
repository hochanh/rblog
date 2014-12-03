---
layout: post
title: "ggplot2: Toolbox"
converted: yes
---
 
## Các loại biểu đồ cơ bản
 

{% highlight r %}
library(ggplot2)
df <- data.frame(
  x = c(3, 1, 5), 
  y = c(2, 4, 6), 
  label = c("a","b","c")
)
p <- ggplot(df, aes(x, y, label = label)) + 
  xlab(NULL) + ylab(NULL)
p + geom_point() + labs(title = "geom_point")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-1.png) 

{% highlight r %}
p + geom_bar(stat="identity") + 
  labs(title = "geom_bar(stat=\"identity\")")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-2.png) 

{% highlight r %}
p + geom_line() + labs(title = "geom_line")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-3.png) 

{% highlight r %}
p + geom_area() + labs(title = "geom_area")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-4.png) 

{% highlight r %}
p + geom_path() + labs(title = "geom_path")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-5.png) 

{% highlight r %}
p + geom_text() + labs(title = "geom_text")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-6.png) 

{% highlight r %}
p + geom_tile() + labs(title = "geom_tile")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-7.png) 

{% highlight r %}
p + geom_polygon() + labs(title = "geom_polygon")
{% endhighlight %}

![plot of chunk 7 geom_xxx](../../figures/ggplot2-toolbox/7 geom_xxx-8.png) 
 
## Các phân phối xác suất
 
### Sử dụng histogram
 

{% highlight r %}
# Mặc định:
qplot(depth, data=diamonds, geom="histogram")
{% endhighlight %}



{% highlight text %}
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
{% endhighlight %}

![plot of chunk histo](../../figures/ggplot2-toolbox/histo-1.png) 

{% highlight r %}
# Phóng to đoạn (55, 70), tăng mức chi tiết xuống 0.1:
qplot(depth, data=diamonds, geom="histogram", xlim=c(55, 70), binwidth=0.1)
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}

![plot of chunk histo](../../figures/ggplot2-toolbox/histo-2.png) 
 
### So sánh phân phối giữa các nhóm
 

{% highlight r %}
depth_dist <- ggplot(diamonds, aes(depth)) + xlim(58, 68)
 
# Tạo nhiều histogram
depth_dist + 
  geom_histogram(aes(y = ..density..), binwidth = 0.1) +
  facet_grid(cut ~ .)
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}

![plot of chunk compare dist](../../figures/ggplot2-toolbox/compare dist-1.png) 

{% highlight r %}
# Sử dụng đồ thị mật độ có điều kiện
depth_dist + geom_histogram(aes(fill = cut), binwidth = 0.1, 
  position = "fill")
{% endhighlight %}



{% highlight text %}
## Warning: position_fill requires constant width: output may be incorrect
{% endhighlight %}

![plot of chunk compare dist](../../figures/ggplot2-toolbox/compare dist-2.png) 

{% highlight r %}
# Sử dụng các đường tần suất
depth_dist + geom_freqpoly(aes(y = ..density.., colour = cut), 
  binwidth = 0.1) 
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_path).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_path).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_path).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_path).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_path).
{% endhighlight %}

![plot of chunk compare dist](../../figures/ggplot2-toolbox/compare dist-3.png) 
 
### Phân phối liên tục có điều kiện
 

{% highlight r %}
# conditional on a discrete variable: `cut`
qplot(cut, depth, data=diamonds, geom="boxplot")
{% endhighlight %}

![plot of chunk boxplot](../../figures/ggplot2-toolbox/boxplot-1.png) 

{% highlight r %}
# conditional on a continuous variable: `carat`
library(plyr)
qplot(carat, depth, data=diamonds, geom="boxplot", 
  group = round_any(carat, 0.1, floor), xlim = c(0, 3))
{% endhighlight %}



{% highlight text %}
## Warning: position_dodge requires constant width: output may be incorrect
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_segment).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_segment).
{% endhighlight %}

![plot of chunk boxplot](../../figures/ggplot2-toolbox/boxplot-2.png) 
 
### Thêm độ nhiễu (jitter) vào phân phối
 

{% highlight r %}
# Phân phối liên tục
qplot(class, cty, data=mpg, geom="jitter")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
# Phân phối rời rạc
qplot(class, drv, data=mpg, geom="jitter")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}
 
### Đường mật độ
 

{% highlight r %}
qplot(depth, data=diamonds, geom="density", xlim = c(54, 70))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 38 rows containing non-finite values (stat_density).
{% endhighlight %}

![plot of chunk density](../../figures/ggplot2-toolbox/density-1.png) 

{% highlight r %}
qplot(depth, data=diamonds, geom="density", xlim = c(54, 70), 
  fill = cut, alpha = I(0.2))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 37 rows containing non-finite values (stat_density).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing non-finite values (stat_density).
{% endhighlight %}

![plot of chunk density](../../figures/ggplot2-toolbox/density-2.png) 
 
## Biểu diễn các điểm trùng lặp
 
### Làm nhỏ các điểm biểu diễn
 

{% highlight r %}
df <- data.frame(x = rnorm(2000), y = rnorm(2000))
norm <- ggplot(df, aes(x, y))
norm + geom_point()
{% endhighlight %}

![plot of chunk make smaller](../../figures/ggplot2-toolbox/make smaller-1.png) 

{% highlight r %}
norm + geom_point(shape = 1)
{% endhighlight %}

![plot of chunk make smaller](../../figures/ggplot2-toolbox/make smaller-2.png) 

{% highlight r %}
norm + geom_point(shape = ".") # Pixel sized
{% endhighlight %}

![plot of chunk make smaller](../../figures/ggplot2-toolbox/make smaller-3.png) 
 
### Làm mờ các điểm biểu diễn
 

{% highlight r %}
library(scales)
norm + geom_point(colour = alpha("black", 1/3))
{% endhighlight %}

![plot of chunk make transparency](../../figures/ggplot2-toolbox/make transparency-1.png) 

{% highlight r %}
norm + geom_point(colour = alpha("black", 1/5))
{% endhighlight %}

![plot of chunk make transparency](../../figures/ggplot2-toolbox/make transparency-2.png) 

{% highlight r %}
norm + geom_point(colour = alpha("black", 1/10))
{% endhighlight %}

![plot of chunk make transparency](../../figures/ggplot2-toolbox/make transparency-3.png) 
 
### Làm nhiễu
 

{% highlight r %}
td <- ggplot(diamonds, aes(table, depth)) + 
  xlim(50, 70) + ylim(50, 70)
# geom point
td + geom_point()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 36 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-1.png) 

{% highlight r %}
# geo jitter mặc định
td + geom_jitter()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 41 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-2.png) 

{% highlight r %}
# geo jitter theo phương ngang
jit <- position_jitter(width = 0.5)
td + geom_jitter(position = jit)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 41 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-3.png) 

{% highlight r %}
td + geom_jitter(position = jit, colour = alpha("black", 1/10))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 45 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-4.png) 

{% highlight r %}
td + geom_jitter(position = jit, colour = alpha("black", 1/50))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 39 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-5.png) 

{% highlight r %}
td + geom_jitter(position = jit, colour = alpha("black", 1/200))  
{% endhighlight %}



{% highlight text %}
## Warning: Removed 43 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk make jitter](../../figures/ggplot2-toolbox/make jitter-6.png) 
 
### Phân nhóm
 

{% highlight r %}
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3) +
  labs(legend.position = "none")
d + stat_bin2d()
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-1.png) 

{% highlight r %}
d + stat_bin2d(bins = 10)
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-2.png) 

{% highlight r %}
d + stat_bin2d(binwidth=c(0.02, 200))
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-3.png) 

{% highlight r %}
d + stat_binhex()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing missing values (stat_hexbin).
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-4.png) 

{% highlight r %}
d + stat_binhex(bins = 10)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing missing values (stat_hexbin).
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-5.png) 

{% highlight r %}
d + stat_binhex(binwidth=c(0.02, 200))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing missing values (stat_hexbin).
{% endhighlight %}

![plot of chunk bin](../../figures/ggplot2-toolbox/bin-6.png) 
 
### Sử dụng các đường đồng mức mật độ
 

{% highlight r %}
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3) + 
  labs(legend.position = "none")
 
d + geom_point() + geom_density2d()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing non-finite values (stat_density2d).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk overlay contours](../../figures/ggplot2-toolbox/overlay contours-1.png) 

{% highlight r %}
d + stat_density2d(geom = "point", aes(size = ..density..), 
 contour = F) + scale_size_area(0.2, 1.5)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing non-finite values (stat_density2d).
{% endhighlight %}

![plot of chunk overlay contours](../../figures/ggplot2-toolbox/overlay contours-2.png) 

{% highlight r %}
d + stat_density2d(geom = "tile", aes(fill = ..density..), 
  contour = F)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing non-finite values (stat_density2d).
{% endhighlight %}

![plot of chunk overlay contours](../../figures/ggplot2-toolbox/overlay contours-3.png) 

{% highlight r %}
last_plot() + scale_fill_gradient(limits = c(1e-5,8e-4))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 34912 rows containing non-finite values (stat_density2d).
{% endhighlight %}

![plot of chunk overlay contours](../../figures/ggplot2-toolbox/overlay contours-4.png) 
 
### Vẽ bản đồ
 
Gói `maps` Chỉ mới hỗ trợ bản đồ Pháp, Ý, Tân Tây Lan,  Mỹ và bản đồ thế giới.
 

{% highlight r %}
library(maps)
# Chú thích bằng điểm
data(us.cities)
big_cities <- subset(us.cities, pop > 500000)
qplot(long, lat, data = big_cities) + borders("state", size = 0.5)
{% endhighlight %}

![plot of chunk maps](../../figures/ggplot2-toolbox/maps-1.png) 

{% highlight r %}
tx_cities <- subset(us.cities, country.etc == "TX")
ggplot(tx_cities, aes(long, lat)) +
  borders("county", "texas", colour = "grey70") +
  geom_point(colour = alpha("black", 0.5))
{% endhighlight %}

![plot of chunk maps](../../figures/ggplot2-toolbox/maps-2.png) 

{% highlight r %}
# Tô màu bản đồ
states <- map_data("state")
arrests <- USArrests
names(arrests) <- tolower(names(arrests))
arrests$region <- tolower(rownames(USArrests))
 
choro <- merge(states, arrests, by = "region")
# Reorder the rows because order matters when drawing polygons
# and merge destroys the original ordering
choro <- choro[order(choro$order), ]
qplot(long, lat, data = choro, group = group, 
  fill = assault, geom = "polygon")
{% endhighlight %}

![plot of chunk maps](../../figures/ggplot2-toolbox/maps-3.png) 

{% highlight r %}
qplot(long, lat, data = choro, group = group, 
  fill = assault / murder, geom = "polygon")
{% endhighlight %}

![plot of chunk maps](../../figures/ggplot2-toolbox/maps-4.png) 

{% highlight r %}
# Vài tùy chọn khác
ia <- map_data("county", "iowa")
mid_range <- function(x) mean(range(x, na.rm = TRUE))
centres <- ddply(ia, .(subregion), 
  colwise(mid_range, .(lat, long)))
ggplot(ia, aes(long, lat)) + 
  geom_polygon(aes(group = group), 
    fill = NA, colour = "grey60") +
  geom_text(aes(label = subregion), data = centres, 
    size = 2, angle = 45)
{% endhighlight %}

![plot of chunk maps](../../figures/ggplot2-toolbox/maps-5.png) 
 
## Độ bất định
 

{% highlight r %}
d <- subset(diamonds, carat < 2.5 & 
  rbinom(nrow(diamonds), 1, 0.2) == 1)
# carat và price sau khi log10 sẽ có quan hệ tuyến tính
d$lcarat <- log10(d$carat)
d$lprice <- log10(d$price)
 
# Loại bỏ quan hệ tuyến tính bằng cách sử dụng 
# giá trị residual trong mô hình tuyến tính
# làm biến dự báo mới
detrend <- lm(lprice ~ lcarat, data = d)
d$lprice2 <- resid(detrend)
 
# Nhớ lcarat * color <=> lcarat + color + lcarat:color
# lcarat:color là interaction term giữa lcarat và color.
# Chạy mô hình với biến dự báo mới để xem xét độ bất định
# trong mô hình cũ là do nhân tố nào gây ra.
mod <- lm(lprice2 ~ lcarat * color, data = d)
 
library(effects)
{% endhighlight %}



{% highlight text %}
## Loading required package: grid
## Loading required package: colorspace
## 
## Attaching package: 'effects'
## 
## The following object is masked from 'package:car':
## 
##     Prestige
{% endhighlight %}



{% highlight r %}
effectdf <- function(...) {
  suppressWarnings(as.data.frame(effect(...)))
}
color <- effectdf("color", mod)
{% endhighlight %}



{% highlight text %}
## NOTE: color is not a high-order term in the model
{% endhighlight %}



{% highlight r %}
both1 <- effectdf("lcarat:color", mod)
 
carat <- effectdf("lcarat", mod, default.levels = 50)
{% endhighlight %}



{% highlight text %}
## NOTE: lcarat is not a high-order term in the model
{% endhighlight %}



{% highlight r %}
both2 <- effectdf("lcarat:color", mod, default.levels = 3)
 
# Đồ thị tuyến tính
qplot(lcarat, lprice, data=d, colour = color)
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-1.png) 

{% highlight r %}
# Đồ thị sau khi loại bỏ quan hệ tuyến tính,
# đây chính là đồ thị biểu diễn độ bất định
qplot(lcarat, lprice2, data=d, colour = color)
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-2.png) 

{% highlight r %}
# Khởi tạo đồ thị biểu diễn độ bất định trong việc 
# tính toán mô hình đối với biến colour
fplot <- ggplot(mapping = aes(y = fit, ymin = lower, ymax = upper)) + 
  ylim(range(both2$lower, both2$upper))
 
# Ảnh hưởng biên của colour
fplot %+% color + aes(x = color) + geom_point() + geom_errorbar()
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-3.png) 

{% highlight r %}
# Ảnh hưởng có điều kiện của colour đối với các mức carat
fplot %+% both2 + 
  aes(x = color, colour = lcarat, group = interaction(color, lcarat)) + 
  geom_errorbar() + geom_line(aes(group=lcarat)) + 
  scale_colour_gradient()
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-4.png) 

{% highlight r %}
# Đồ thị biểu diễn độ bất định trong việc tính toán mô hình
# đối với biến carat.
 
# Ảnh hưởng biên của carat
fplot %+% carat + aes(x = lcarat) + geom_smooth(stat="identity")
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-5.png) 

{% highlight r %}
ends <- subset(both1, lcarat == max(lcarat))
# Ảnh hưởng có điều kiện của carat với các mức colour khác nhau
fplot %+% both1 + aes(x = lcarat, colour = color) +
 geom_smooth(stat="identity") + 
 scale_colour_hue() + labs(legend.position = "none") +
 geom_text(aes(label = color, x = lcarat + 0.02), ends)
{% endhighlight %}

![plot of chunk uncertainly](../../figures/ggplot2-toolbox/uncertainly-6.png) 
 
## Tóm tắt các giá trị thống kê
 

{% highlight r %}
# x rời rạc
m <- ggplot(movies, aes(year, rating))
m + stat_summary(fun.y = "median", geom = "line")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-1.png) 

{% highlight r %}
m + stat_summary(fun.data = "median_hilow", geom = "smooth")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-2.png) 

{% highlight r %}
m + stat_summary(fun.y = "mean", geom = "line")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-3.png) 

{% highlight r %}
m + stat_summary(fun.data = "mean_cl_boot", geom = "smooth")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-4.png) 

{% highlight r %}
# x liên tục
m2 <- ggplot(movies, aes(round(rating), log10(votes)))
m2 + stat_summary(fun.y = "mean", geom = "point")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-5.png) 

{% highlight r %}
m2 + stat_summary(fun.data = "mean_cl_normal", geom = "errorbar")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-6.png) 

{% highlight r %}
m2 + stat_summary(fun.data = "median_hilow", geom = "pointrange")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-7.png) 

{% highlight r %}
m2 + stat_summary(fun.data = "median_hilow", geom = "crossbar")
{% endhighlight %}

![plot of chunk statistical summaries](../../figures/ggplot2-toolbox/statistical summaries-8.png) 
 
### Các hàm tóm tắt lẻ
 

{% highlight r %}
midm <- function(x) mean(x, trim = 0.5)
m2 + 
  stat_summary(aes(colour = "trimmed"), fun.y = midm, 
    geom = "point") +
  stat_summary(aes(colour = "raw"), fun.y = mean, 
    geom = "point") + 
  scale_colour_hue("Mean")
{% endhighlight %}

![plot of chunk individual sum](../../figures/ggplot2-toolbox/individual sum-1.png) 
 
### Các hàm tóm tắt đơn
 

{% highlight r %}
iqr <- function(x, ...) {
  qs <- quantile(as.numeric(x), c(0.25, 0.75), na.rm = T)
  names(qs) <- c("ymin", "ymax")
  qs
}
m + stat_summary(fun.data = "iqr", geom="ribbon")
{% endhighlight %}

![plot of chunk single](../../figures/ggplot2-toolbox/single-1.png) 
 
## Chú thích đồ thị
 

{% highlight r %}
(unemp <- qplot(date, unemploy, data=economics, geom="line", 
  xlab = "", ylab = "No. unemployed (1000s)"))
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-1.png) 

{% highlight r %}
presidential <- presidential[-(1:3), ]
 
yrng <- range(economics$unemploy)
xrng <- range(economics$date)
unemp + geom_vline(aes(xintercept = as.numeric(start)), 
  data = presidential)
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-2.png) 

{% highlight r %}
unemp + geom_rect(aes(NULL, NULL, xmin = start, xmax = end, 
  fill = party), ymin = yrng[1], ymax = yrng[2], 
  data = presidential) + scale_fill_manual(values = 
  alpha(c("blue", "red"), 0.2))
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-3.png) 

{% highlight r %}
last_plot() + geom_text(aes(x = start, y = yrng[1], label = name), 
  data = presidential, size = 3, hjust = 0, vjust = 0)
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-4.png) 

{% highlight r %}
caption <- paste(strwrap("Unemployment rates in the US have 
  varied a lot over the years", 40), collapse="\n")
unemp + geom_text(aes(x, y, label = caption), 
  data = data.frame(x = xrng[2], y = yrng[2]), 
  hjust = 1, vjust = 1, size = 4)
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-5.png) 

{% highlight r %}
highest <- subset(economics, unemploy == max(unemploy))
unemp + geom_point(data = highest, 
  size = 3, colour = alpha("red", 0.5))
{% endhighlight %}

![plot of chunk annotate](../../figures/ggplot2-toolbox/annotate-6.png) 
 
## Dữ liệu có trọng số
 

{% highlight r %}
# Không có trọng số
qplot(percwhite, percbelowpoverty, data = midwest)
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-1.png) 

{% highlight r %}
# Trọng số dân số
qplot(percwhite, percbelowpoverty, data = midwest, 
  size = poptotal / 1e6) + scale_size_area("Population\n(millions)", 
  breaks = c(0.5, 1, 2, 4))
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-2.png) 

{% highlight r %}
# Trọng số khu vực
qplot(percwhite, percbelowpoverty, data = midwest, size = area) + 
  scale_size_area()
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-3.png) 

{% highlight r %}
# Vẽ đường tương quan
lm_smooth <- geom_smooth(method = lm, size = 1)
qplot(percwhite, percbelowpoverty, data = midwest) + lm_smooth 
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-4.png) 

{% highlight r %}
qplot(percwhite, percbelowpoverty, data = midwest, 
  weight = popdensity, size = popdensity) + lm_smooth
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-5.png) 

{% highlight r %}
# Histogram không trọng số
qplot(percbelowpoverty, data = midwest, binwidth = 1)
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-6.png) 

{% highlight r %}
# Histogram có trọng số
qplot(percbelowpoverty, data = midwest, weight = poptotal, 
  binwidth = 1) + ylab("population")
{% endhighlight %}

![plot of chunk weighted data](../../figures/ggplot2-toolbox/weighted data-7.png) 
