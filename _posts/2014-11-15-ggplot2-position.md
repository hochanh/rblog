---
layout: post
title: "ggplot2: Position"
converted: yes
---
 
## Facet
 
### Grid
 

{% highlight r %}
library(ggplot2)
mpg2 <- subset(mpg, cyl != 5 & drv %in% c("4", "f"))
{% endhighlight %}



{% highlight text %}
## Error in subset.default(mpg, cyl != 5 & drv %in% c("4", "f")): object 'cyl' not found
{% endhighlight %}



{% highlight r %}
# Mặc định
qplot(cty, hwy, data = mpg2)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
# Thêm face grid 1 hàng nhiều cột:
qplot(cty, hwy, data = mpg2) + facet_grid(. ~ cyl)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
# Một cột nhiều hàng
qplot(cty, data = mpg2, geom="histogram", binwidth = 2) +
  facet_grid(cyl ~ .)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
# Nhiều hàng nhiều cột
qplot(cty, hwy, data = mpg2) + facet_grid(drv ~ cyl)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}
 
### Đồ thị biên
 

{% highlight r %}
p <- qplot(displ, hwy, data = mpg2) +
  geom_smooth(method = "lm", se = F)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
p + facet_grid(cyl ~ drv) 
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, rows, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
# Biên
p + facet_grid(cyl ~ drv, margins = T)
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, rows, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
# Thêm màu cho đường smooth
qplot(displ, hwy, data = mpg2) + 
  geom_smooth(aes(colour = drv), method = "lm", se = F) + 
  facet_grid(cyl ~ drv, margins = T) 
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}
 
### Wrap
 

{% highlight r %}
# Phân phối xếp hạng phim theo thập kỷ
library(plyr)
movies$decade <- round_any(movies$year, 10, floor)
qplot(rating, ..density.., data=subset(movies, decade > 1890),
  geom="histogram", binwidth = 0.5) + 
  facet_wrap(~ decade, ncol = 6)
{% endhighlight %}

![plot of chunk wrap](../../figures/ggplot2-position/wrap-1.png) 
 
### Scales
 

{% highlight r %}
p <- qplot(cty, hwy, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
# scale cố định cho các facet
p + facet_wrap(~ cyl)
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
# scale tự do cho mỗi facet
p + facet_wrap(~ cyl, scales = "free")
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
# scale tự do đặc biệt hữu ích khi áp dụng với dữ liệu
# chuỗi thời gian với đo độ khác nhau
library(reshape2)
em <- melt(economics, id = "date")
qplot(date, value, data = em, geom = "line", group = variable) + 
  facet_grid(variable ~ ., scale = "free_y")
{% endhighlight %}

![plot of chunk scale](../../figures/ggplot2-position/scale-1.png) 

{% highlight r %}
mpg3 <- within(mpg2, {
  model <- reorder(model, cty)
  manufacturer <- reorder(manufacturer, -cty)
})
{% endhighlight %}



{% highlight text %}
## Error in within(mpg2, {: object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
models <- qplot(cty, model, data = mpg3)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg3' not found
{% endhighlight %}



{% highlight r %}
models
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'models' not found
{% endhighlight %}



{% highlight r %}
# scale tự do, space tự do
# opts() chuyển thành theme()
# theme_text() chuyển thành element_text()
models + facet_grid(manufacturer ~ ., scales = "free", 
  space = "free") +  theme(strip.text.y = element_text())
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'models' not found
{% endhighlight %}
 
### Group và Facet
 

{% highlight r %}
xmaj <- c(0.3, 0.5, 1,3, 5)
xmin <- as.vector(outer(1:10, 10^c(-1, 0)))
ymaj <- c(500, 1000, 5000, 10000)
ymin <- as.vector(outer(1:10, 10^c(2,3,4)))
dplot <- ggplot(subset(diamonds, color %in% c("D","E","G","J")), 
  aes(carat, price, colour = color)) + 
  scale_x_log10(breaks = xmaj, labels = xmaj, minor = xmin) + 
  scale_y_log10(breaks = ymaj, labels = ymaj, minor = ymin) + 
  scale_colour_hue(limits = levels(diamonds$color)) + 
  theme(legend.position = "none")
# Group sẽ giống thế này
dplot + geom_point()
{% endhighlight %}

![plot of chunk group vs facet](../../figures/ggplot2-position/group vs facet-1.png) 

{% highlight r %}
# Còn Facet thế này
dplot + geom_point() + facet_grid(. ~ color)
{% endhighlight %}

![plot of chunk group vs facet](../../figures/ggplot2-position/group vs facet-2.png) 

{% highlight r %}
# Đường smooth
dplot + geom_smooth(method = lm, se = F, fullrange = T)
{% endhighlight %}

![plot of chunk group vs facet](../../figures/ggplot2-position/group vs facet-3.png) 

{% highlight r %}
dplot + geom_smooth(method = lm, se = F, fullrange = T) + 
  facet_grid(. ~ color)
{% endhighlight %}

![plot of chunk group vs facet](../../figures/ggplot2-position/group vs facet-4.png) 
 
### Dodging và Faceting
 

{% highlight r %}
# Dodge sẽ ra thế này
qplot(color, data=diamonds, geom = "bar", fill = cut, 
  position="dodge")
{% endhighlight %}

![plot of chunk dodge vs. facet](../../figures/ggplot2-position/dodge vs. facet-1.png) 

{% highlight r %}
# Còn Facet thế này
qplot(cut, data = diamonds, geom = "bar", fill = cut) + 
  facet_grid(. ~ color) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8, 
   colour = "grey50"))
{% endhighlight %}

![plot of chunk dodge vs. facet](../../figures/ggplot2-position/dodge vs. facet-2.png) 
 

{% highlight r %}
mpg4 <- subset(mpg, manufacturer %in% 
  c("audi", "volkswagen", "jeep"))
{% endhighlight %}



{% highlight text %}
## Error in match(x, table, nomatch = 0L): object 'manufacturer' not found
{% endhighlight %}



{% highlight r %}
mpg4$manufacturer <- as.character(mpg4$manufacturer)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'mpg4' not found
{% endhighlight %}



{% highlight r %}
mpg4$model <- as.character(mpg4$model)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'mpg4' not found
{% endhighlight %}



{% highlight r %}
base <- ggplot(mpg4, aes(fill = model)) + 
  geom_bar(position = "dodge") + 
  theme(legend.position = "none")
{% endhighlight %}



{% highlight text %}
## Error in ggplot(mpg4, aes(fill = model)): object 'mpg4' not found
{% endhighlight %}



{% highlight r %}
# dodge
base + aes(x = model)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'base' not found
{% endhighlight %}



{% highlight r %}
# face
base + aes(x = model) + 
  facet_grid(. ~ manufacturer)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'base' not found
{% endhighlight %}



{% highlight r %}
# scale phát  
last_plot() +  
  facet_grid(. ~ manufacturer, scales = "free_x", space = "free")
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, cols, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
base + aes(x = manufacturer)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'base' not found
{% endhighlight %}
 
### Biến liên tục
 

{% highlight r %}
# Chia khoảng theo độ dài
mpg2$disp_ww <- cut_interval(mpg2$displ, length = 1)
{% endhighlight %}



{% highlight text %}
## Error in cut(x, breaks(x, "width", n, length), include.lowest = TRUE, : object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
mpg2$disp_wn <- cut_interval(mpg2$displ, n = 6)
{% endhighlight %}



{% highlight text %}
## Error in cut(x, breaks(x, "width", n, length), include.lowest = TRUE, : object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
# Chia khoảng theo số lượng điểm
mpg2$disp_nn <- cut_number(mpg2$displ, n = 6)
{% endhighlight %}



{% highlight text %}
## Error in cut(x, breaks(x, "n", n), include.lowest = TRUE, ...): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
plot <- qplot(cty, hwy, data = mpg2) + labs(x = NULL, y = NULL)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'mpg2' not found
{% endhighlight %}



{% highlight r %}
plot + facet_wrap(~ disp_ww, nrow = 1)
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
plot + facet_wrap(~ disp_wn, nrow = 1)
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}



{% highlight r %}
plot + facet_wrap(~ disp_nn, nrow = 1)
{% endhighlight %}



{% highlight text %}
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
{% endhighlight %}
 
## Hệ tọa độ
 
### Các hệ tọa độ
 
#### Ví dụ ban đầu
 

{% highlight r %}
rect <- data.frame(x = 50, y = 50)
line <- data.frame(x = c(1, 200), y = c(100, 1))
base <- ggplot(mapping = aes(x, y)) + 
  geom_tile(data = rect, aes(width = 50, height = 50)) + 
  geom_line(data = line)
# Mặc định Đề các
base
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-1.png) 

{% highlight r %}
# Tọa độ cực
base + coord_polar("x")
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-2.png) 

{% highlight r %}
base + coord_polar("y")
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-3.png) 

{% highlight r %}
# Đảo trục
base + coord_flip()
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-4.png) 

{% highlight r %}
# Biến đổi
base + coord_trans(y = "log10")
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-5.png) 

{% highlight r %}
# Đề-các cân bằng
base + coord_equal()
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-position/coord-6.png) 
 
#### Cách biến đổi hệ tọa độ 
 

{% highlight r %}
r_grid <- seq(0, 1, length = 15)
theta_grid <- seq(0, 3 / 2 * pi, length = 15)
extents <- data.frame(r = range(r_grid), theta = range(theta_grid))
base <- ggplot(extents, aes(r, theta)) + labs(aspect.ratio = 1) +
  scale_y_continuous(expression(theta))
# Đường ban đầu
base + geom_point(colour = "red", size = 4) + geom_line()
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-1.png) 

{% highlight r %}
pts <- data.frame(r = r_grid, theta = theta_grid)
# Chia đường thành các điểm
base + geom_line() + geom_point(data = pts)
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-2.png) 

{% highlight r %}
base + geom_point(data = pts)
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-3.png) 

{% highlight r %}
# Chuyển đổi điểm
xlab <- scale_x_continuous(expression(x == r * sin(theta)))
ylab <- scale_y_continuous(expression(x == r * cos(theta)))
polar <- base %+% pts + aes(x = r * sin(theta), y = r * cos(theta)) + 
  xlab + ylab
{% endhighlight %}



{% highlight text %}
## Scale for 'y' is already present. Adding another scale for 'y', which will replace the existing scale.
{% endhighlight %}



{% highlight r %}
polar + geom_point()
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-4.png) 

{% highlight r %}
# Nối điểm thành đường
polar + geom_point() + geom_path()
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-5.png) 

{% highlight r %}
# Kết quả
polar + geom_point(data=extents, colour = "red", size = 4) + geom_path() 
{% endhighlight %}

![plot of chunk trans2](../../figures/ggplot2-position/trans2-6.png) 
 
### Hệ tọa độ Đề-các
 
#### Đặt các giới hạn
 

{% highlight r %}
(p <- qplot(disp, wt, data=mtcars) + geom_smooth())
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-1.png) 

{% highlight r %}
p + scale_x_continuous(limits = c(325, 500))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}



{% highlight text %}
## Warning: Removed 24 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 24 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-2.png) 

{% highlight r %}
p + coord_cartesian(xlim = c(325, 500))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-3.png) 

{% highlight r %}
(d <- ggplot(diamonds, aes(carat, price)) + 
  stat_bin2d(bins = 25, colour="grey70") + 
  theme(legend.position = "none")) 
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-4.png) 

{% highlight r %}
d + scale_x_continuous(limits = c(0, 2))
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-5.png) 

{% highlight r %}
d + coord_cartesian(xlim = c(0, 2))
{% endhighlight %}

![plot of chunk set limits](../../figures/ggplot2-position/set limits-6.png) 
 
#### Đảo trục
 

{% highlight r %}
qplot(displ, cty, data = mpg) + geom_smooth()
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
qplot(cty, displ, data = mpg) + geom_smooth()
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
qplot(cty, displ, data = mpg) + geom_smooth() + coord_flip()
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}
 
#### Biến đổi dữ liệu
 

{% highlight r %}
qplot(carat, price, data = diamonds, log = "xy") + 
  geom_smooth(method = "lm")
{% endhighlight %}

![plot of chunk transform](../../figures/ggplot2-position/transform-1.png) 

{% highlight r %}
library(scales)
last_plot() + coord_trans(x = exp_trans(10), y = exp_trans(10))
{% endhighlight %}

![plot of chunk transform](../../figures/ggplot2-position/transform-2.png) 
 
### Phi Đề-các
 
#### Tọa độ cực
 

{% highlight r %}
(pie <- ggplot(mtcars, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1))
{% endhighlight %}

![plot of chunk polar](../../figures/ggplot2-position/polar-1.png) 

{% highlight r %}
# Pie chart
pie + coord_polar(theta = "y")
{% endhighlight %}

![plot of chunk polar](../../figures/ggplot2-position/polar-2.png) 

{% highlight r %}
# The bullseye chart
pie + coord_polar()
{% endhighlight %}

![plot of chunk polar](../../figures/ggplot2-position/polar-3.png) 
 
#### Tọa độ bản đồ
 

{% highlight r %}
library(maps)
nz <- map_data("nz")
nzmap <- ggplot(nz, aes(x=long, y=lat, group=group)) +
  geom_polygon(fill="white", colour="black")
 
# Tọa độ mặc định
nzmap
{% endhighlight %}

![plot of chunk map](../../figures/ggplot2-position/map-1.png) 

{% highlight r %}
# Tọa độ bản đồ mặc định
nzmap + coord_map()
{% endhighlight %}

![plot of chunk map](../../figures/ggplot2-position/map-2.png) 

{% highlight r %}
# Thông số khác
nzmap + coord_map("cylindrical")
{% endhighlight %}

![plot of chunk map](../../figures/ggplot2-position/map-3.png) 

{% highlight r %}
nzmap + coord_map("azequalarea",orientation=c(-36.92,174.6,0))
{% endhighlight %}

![plot of chunk map](../../figures/ggplot2-position/map-4.png) 
