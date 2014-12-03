---
layout: post
title: "ggplot2: Polishing"
converted: yes
---
 
## Mẫu (`theme`)
 
### Mẫu có sẵn
 

{% highlight r %}
# mặc định nền xám
qplot(rating, data = movies, binwidth = 1)
{% endhighlight %}

![plot of chunk built-in](../../figures/ggplot2-polishing/built-in-1.png) 

{% highlight r %}
# chuyển sang nền trắng
last_plot() + theme_bw()
{% endhighlight %}

![plot of chunk built-in](../../figures/ggplot2-polishing/built-in-2.png) 

{% highlight r %}
# theme tác động tới đồ thị lúc hiển thị, 
# không phải lúc khởi tạo
hgram <- qplot(rating, data = movies, binwidth = 1)
hgram
{% endhighlight %}

![plot of chunk built-in](../../figures/ggplot2-polishing/built-in-3.png) 

{% highlight r %}
previous_theme <- theme_set(theme_bw())
hgram
{% endhighlight %}

![plot of chunk built-in](../../figures/ggplot2-polishing/built-in-4.png) 

{% highlight r %}
# ghi đè theme
hgram + previous_theme
{% endhighlight %}

![plot of chunk built-in](../../figures/ggplot2-polishing/built-in-5.png) 

{% highlight r %}
# ghi đè vĩnh viễn
theme_set(previous_theme)
{% endhighlight %}
 
### Cấu thành mẫu
 

{% highlight r %}
# Thay đổi tiêu đề
hgramt <- hgram + 
  labs(title = "This is a histogram")
hgramt
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-1.png) 

{% highlight r %}
# Đổi định dạng tiêu đề
hgramt + theme(plot.title = element_text(size = 20))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-2.png) 

{% highlight r %}
hgramt + theme(plot.title = element_text(size = 20, 
  colour = "red"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-3.png) 

{% highlight r %}
hgramt + theme(plot.title = element_text(size = 20, 
  hjust = 0))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-4.png) 

{% highlight r %}
hgramt + theme(plot.title = element_text(size = 20, 
  face = "bold"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-5.png) 

{% highlight r %}
hgramt + theme(plot.title = element_text(size = 20, 
  angle = 180))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-6.png) 

{% highlight r %}
# Đổi đường nền và các trục
hgram + theme(panel.grid.major = element_line(colour = "red"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-7.png) 

{% highlight r %}
hgram + theme(panel.grid.major = element_line(size = 2))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-8.png) 

{% highlight r %}
hgram + theme(panel.grid.major = element_line(linetype = "dotted"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-9.png) 

{% highlight r %}
hgram + theme(axis.line = element_line())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-10.png) 

{% highlight r %}
hgram + theme(axis.line = element_line(colour = "red"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-11.png) 

{% highlight r %}
hgram + theme(axis.line = element_line(size = 0.5, 
  linetype = "dashed"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-12.png) 

{% highlight r %}
# Đổi màu nền
hgram + theme(plot.background = element_rect(fill = "grey80", 
  colour = NA))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-13.png) 

{% highlight r %}
hgram + theme(plot.background = element_rect(size = 2))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-14.png) 

{% highlight r %}
hgram + theme(plot.background = element_rect(colour = "red"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-15.png) 

{% highlight r %}
hgram + theme(panel.background = element_rect())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-16.png) 

{% highlight r %}
hgram + theme(panel.background = element_rect(colour = NA))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-17.png) 

{% highlight r %}
hgram + theme(panel.background = 
  element_rect(linetype = "dotted"))
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-18.png) 

{% highlight r %}
# Xóa lần lượt các thuộc tính phi dữ liệu
hgramt
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-19.png) 

{% highlight r %}
last_plot() + theme(panel.grid.minor = element_blank())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-20.png) 

{% highlight r %}
last_plot() + theme(panel.grid.major = element_blank())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-21.png) 

{% highlight r %}
last_plot() + theme(panel.background = element_blank())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-22.png) 

{% highlight r %}
last_plot() + 
  theme(axis.title.x = element_blank(), 
       axis.title.y = element_blank())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-23.png) 

{% highlight r %}
last_plot() + theme(axis.line = element_line())
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-24.png) 

{% highlight r %}
# Đổi theme mặc định
old_theme <- theme_update(
  plot.background = element_rect(fill = "#3366FF"),
  panel.background = element_rect(fill = "#003DF5"),
  axis.text.x = element_text(colour = "#CCFF33"),
  axis.text.y = element_text(colour = "#CCFF33", hjust = 1),
  axis.title.x = element_text(colour = "#CCFF33", face = "bold"),
  axis.title.y = element_text(colour = "#CCFF33", face = "bold", 
   angle = 90)
)
# Kết quả đổi theme
qplot(cut, data = diamonds, geom="bar")
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-25.png) 

{% highlight r %}
qplot(cty, hwy, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
# Đặt lại theme
theme_set(old_theme)
# Kết quả đặt lại
qplot(cut, data = diamonds, geom="bar")
{% endhighlight %}

![plot of chunk theme element](../../figures/ggplot2-polishing/theme element-26.png) 

{% highlight r %}
qplot(cty, hwy, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}
 
## Tùy chỉnh `scales` và `geoms`
 
### `scale`
 

{% highlight r %}
# Thay đổi scale mặc định bằng cách gán hàm
scale_colour_discrete <- scale_colour_grey
scale_fill_discrete <- scale_fill_grey
scale_colour_continuous <- function(...) 
  scale_colour_gradient(low = "white", high = "black")
scale_fill_continuos <- function(...)
  scale_fill_gradient(low = "white", high = "black")
{% endhighlight %}
 
### `geom` và `stat`
 

{% highlight r %}
update_geom_defaults("point", aes(colour = "darkblue"))
qplot(mpg, wt, data=mtcars)
{% endhighlight %}

![plot of chunk geom & stat](../../figures/ggplot2-polishing/geom & stat-1.png) 

{% highlight r %}
update_stat_defaults("bin", aes(y = ..density..))
qplot(rating, data = movies, geom = "histogram", binwidth = 1)
{% endhighlight %}

![plot of chunk geom & stat](../../figures/ggplot2-polishing/geom & stat-2.png) 
 
## Lưu biểu đồ
 

{% highlight r %}
# Lưu 1 biểu đồ
qplot(mpg, wt, data = mtcars)
ggsave(file = "output.pdf")
 
#Trường hợp lưu nhiều đồ thị vào 1 tệp
pdf(file = "output.pdf", width = 6, height = 6)
qplot(mpg, wt, data = mtcars)
qplot(wt, mpg, data = mtcars)
dev.off()
{% endhighlight %}
 
## Nhiều biểu đồ trên cùng 1 trang
 

{% highlight r %}
# 3 biểu đồ mẫu
(a <- qplot(date, unemploy, data = economics, geom = "line"))
(b <- qplot(uempmed, unemploy, data = economics) + 
  geom_smooth(se = F))
(c <- qplot(uempmed, unemploy, data = economics, geom="path"))
{% endhighlight %}
 
### `viewport()`
 

{% highlight r %}
# A viewport that takes up the entire plot device
library(grid)
vp1 <- viewport(width = 1, height = 1, x = 0.5, y = 0.5)
vp1 <- viewport()
 
# A viewport that takes up half the width and half the height, 
# located in the middle of the plot.
vp2 <- viewport(width = 0.5, height = 0.5, x = 0.5, y = 0.5)
vp2 <- viewport(width = 0.5, height = 0.5)
 
# A viewport that is 2cm x 3cm located in the center
vp3 <- viewport(width = unit(2, "cm"), height = unit(3, "cm"))
 
# A viewport in the top right
vp4 <- viewport(x = 1, y = 1, just = c("right", "top" ))
# Bottom left
vp5 <- viewport(x = 0, y = 0, just = c("right", "bottom"))
{% endhighlight %}
 
### Biểu đồ con
 

{% highlight r %}
pdf("polishing-subplot-1.pdf", width = 4, height = 4)
subvp <- viewport(width = 0.4, height = 0.4, x = 0.75, y = 0.35)
b
print(c, vp = subvp)
dev.off()
 
# Sửa cho đẹp
csmall <- c + 
  theme_gray(9) + 
  labs(x = NULL, y = NULL) + 
  theme(plot.margin = unit(rep(0, 4), "lines"))
 
pdf("polishing-subplot-2.pdf", width = 4, height = 4)
b
print(csmall, vp = subvp)
dev.off()
{% endhighlight %}
 
### Lưới chữ nhật
 

{% highlight r %}
pdf("polishing-layout.pdf", width = 8, height = 6)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 2)))
 
vplayout <- function(x, y) 
  viewport(layout.pos.row = x, layout.pos.col = y)
print(a, vp = vplayout(1, 1:2))
print(b, vp = vplayout(2, 1))
print(c, vp = vplayout(2, 2))
dev.off()
{% endhighlight %}
