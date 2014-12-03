---
layout: post
title: "ggplot2: Layers"
converted: yes
---
 
## Tạo 1 biểu đồ
 

{% highlight r %}
library(ggplot2)
# init one
p <- ggplot(diamonds, aes(carat, price, colour = cut))
# add a layer
p <- p + layer(geom = "point")  
# Now p is this
p
{% endhighlight %}

![plot of chunk creating a plot](../../figures/ggplot2-layers/creating a plot-1.png) 
 
### Toàn bộ đối số của hàm `layer()`:
 
```r
 layer(geom, geom_params, stat, stat_params, data, mapping, 
   position)
```
 
### Lối tắt
 

{% highlight r %}
# Ver 1: Verbose
p <- ggplot(diamonds, aes(x = carat))
p <- p + layer(
  geom = "bar", 
  geom_params = list(fill = "steelblue"),
  stat = "bin",
  stat_params = list(binwidth = 2)
)
p
{% endhighlight %}

![plot of chunk another plot](../../figures/ggplot2-layers/another plot-1.png) 

{% highlight r %}
# Ver 2: Shortcut
p <- ggplot(diamonds, aes(x = carat))
p <- p + geom_histogram(binwidth = 2, fill = "steelblue")
p
{% endhighlight %}

![plot of chunk another plot](../../figures/ggplot2-layers/another plot-2.png) 
 
#### Cấu trúc lối tắt:
 
```r
geom_XXX(mapping, data, ..., geom, position)
stat_XXX(mapping, data, ..., stat, position)
```
 
### `ggplot` và `qplot`
 

{% highlight r %}
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + 
  geom_point()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other examples](../../figures/ggplot2-layers/other examples-1.png) 

{% highlight r %}
# Tương đương với
qplot(sleep_rem / sleep_total, awake, data = msleep)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other examples](../../figures/ggplot2-layers/other examples-2.png) 

{% highlight r %}
# Thêm layer to qplot:
qplot(sleep_rem / sleep_total, awake, data = msleep) + 
  geom_smooth()
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other examples](../../figures/ggplot2-layers/other examples-3.png) 

{% highlight r %}
# Tương đương với
qplot(sleep_rem / sleep_total, awake, data = msleep, 
  geom = c("point", "smooth"))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other examples](../../figures/ggplot2-layers/other examples-4.png) 

{% highlight r %}
# hoặc
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + 
  geom_point() + geom_smooth()
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other examples](../../figures/ggplot2-layers/other examples-5.png) 
 
### Hàm `summary()`
 

{% highlight r %}
p <- ggplot(msleep, aes(sleep_rem / sleep_total, awake))
summary(p)
{% endhighlight %}



{% highlight text %}
## data: name, genus, vore, order, conservation, sleep_total,
##   sleep_rem, sleep_cycle, awake, brainwt, bodywt [83x11]
## mapping:  x = sleep_rem/sleep_total, y = awake
## faceting: facet_null()
{% endhighlight %}



{% highlight r %}
p <- p + geom_point()
summary(p)
{% endhighlight %}



{% highlight text %}
## data: name, genus, vore, order, conservation, sleep_total,
##   sleep_rem, sleep_cycle, awake, brainwt, bodywt [83x11]
## mapping:  x = sleep_rem/sleep_total, y = awake
## faceting: facet_null() 
## -----------------------------------
## geom_point: na.rm = FALSE 
## stat_identity:  
## position_identity: (width = NULL, height = NULL)
{% endhighlight %}
 
### Tách lớp
 

{% highlight r %}
bestfit <- geom_smooth(method = "lm", se = F, 
  colour = I("steelblue"), alpha = I(0.5), size = 2)
qplot(sleep_rem, sleep_total, data = msleep) + bestfit
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 22 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk separate layer](../../figures/ggplot2-layers/separate layer-1.png) 

{% highlight r %}
qplot(awake, brainwt, data = msleep, log = "y") + bestfit
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk separate layer](../../figures/ggplot2-layers/separate layer-2.png) 

{% highlight r %}
qplot(bodywt, brainwt, data = msleep, log = "xy") + bestfit
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (stat_smooth).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk separate layer](../../figures/ggplot2-layers/separate layer-3.png) 
 
## Dữ liệu
 

{% highlight r %}
p <- ggplot(mtcars, aes(mpg, wt, colour = cyl)) + geom_point()
p
{% endhighlight %}

![plot of chunk data](../../figures/ggplot2-layers/data-1.png) 

{% highlight r %}
# Làm mới dữ liệu
mtcars <- transform(mtcars, mpg = mpg ^ 2)
p %+% mtcars
{% endhighlight %}

![plot of chunk data](../../figures/ggplot2-layers/data-2.png) 
 
## Các ánh xạ thẩm mỹ
 
### Hàm `aes()`
 
```r
aes(x = weight, y = height, colour = age)
aes(weight, height, colour = sqrt(age))
```
 
### Biểu đồ và phân lớp
 

{% highlight r %}
p <- ggplot(mtcars)
summary(p)
{% endhighlight %}



{% highlight text %}
## data: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
##   [32x11]
## faceting: facet_null()
{% endhighlight %}



{% highlight r %}
p <- p + aes(wt, hp)
summary(p)
{% endhighlight %}



{% highlight text %}
## data: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
##   [32x11]
## mapping:  x = wt, y = hp
## faceting: facet_null()
{% endhighlight %}



{% highlight r %}
p <- ggplot(mtcars, aes(x = mpg, y = wt))
p + geom_point()
{% endhighlight %}

![plot of chunk plot & layer](../../figures/ggplot2-layers/plot & layer-1.png) 

{% highlight r %}
# Ghi đè phân lớp
p + geom_point(aes(colour = factor(cyl)))
{% endhighlight %}

![plot of chunk plot & layer](../../figures/ggplot2-layers/plot & layer-2.png) 

{% highlight r %}
p + geom_point(aes(y = disp))
{% endhighlight %}

![plot of chunk plot & layer](../../figures/ggplot2-layers/plot & layer-3.png) 
 
### Thiết đặt hay ánh xạ?
 

{% highlight r %}
p <- ggplot(mtcars, aes(mpg, wt))
# Thiết đặt 
p + geom_point(colour = "darkblue")  
{% endhighlight %}

![plot of chunk setting vs mapping](../../figures/ggplot2-layers/setting vs mapping-1.png) 

{% highlight r %}
# Ánh xạ
p + geom_point(aes(colour = "darkblue"))
{% endhighlight %}

![plot of chunk setting vs mapping](../../figures/ggplot2-layers/setting vs mapping-2.png) 

{% highlight r %}
# Tương tự với `qplot()`
qplot(mpg, wt, data=mtcars, colour = I("darkblue"))
{% endhighlight %}

![plot of chunk setting vs mapping](../../figures/ggplot2-layers/setting vs mapping-3.png) 

{% highlight r %}
qplot(mpg, wt, data=mtcars, colour = "darkblue")
{% endhighlight %}

![plot of chunk setting vs mapping](../../figures/ggplot2-layers/setting vs mapping-4.png) 
 
### Nhóm
 
#### Nhiều nhóm, một thuộc tính thẩm mỹ
 

{% highlight r %}
data(Oxboys, package="nlme")
p <- ggplot(Oxboys, aes(age, height, group = Subject)) + 
  geom_line()
# Tương tự với `qplot()`
qplot(age, height, data=Oxboys, group = Subject, geom="line")
{% endhighlight %}

![plot of chunk grouping 1](../../figures/ggplot2-layers/grouping 1-1.png) 

{% highlight r %}
qplot(age, height, data=Oxboys, geom="line")
{% endhighlight %}

![plot of chunk grouping 1](../../figures/ggplot2-layers/grouping 1-2.png) 
 
#### Các nhóm khác nhau với các thuộc tính thẩm mỹ (lớp) khác nhau
 

{% highlight r %}
p + geom_smooth(aes(group = Subject), method="lm", se = F)
{% endhighlight %}

![plot of chunk grouping 2](../../figures/ggplot2-layers/grouping 2-1.png) 

{% highlight r %}
p + geom_smooth(aes(group = 1), method="lm", size = 2, se = F)
{% endhighlight %}

![plot of chunk grouping 2](../../figures/ggplot2-layers/grouping 2-2.png) 

{% highlight r %}
# Tương tự với `qplot()`
qplot(age, height, data=Oxboys, group = Subject, geom="line") +
  geom_smooth(method="lm", se = F)
{% endhighlight %}

![plot of chunk grouping 2](../../figures/ggplot2-layers/grouping 2-3.png) 

{% highlight r %}
qplot(age, height, data=Oxboys, group = Subject, geom="line") +
  geom_smooth(aes(group = 1), method="lm", size = 2, se = F)
{% endhighlight %}

![plot of chunk grouping 2](../../figures/ggplot2-layers/grouping 2-4.png) 
 
#### Ghi đè nhóm mặc định
 

{% highlight r %}
(boysbox <- ggplot(Oxboys, aes(Occasion, height)) + geom_boxplot())
{% endhighlight %}

![plot of chunk grouping 3](../../figures/ggplot2-layers/grouping 3-1.png) 

{% highlight r %}
boysbox + geom_line(aes(group = Subject), colour = "#3366FF")
{% endhighlight %}

![plot of chunk grouping 3](../../figures/ggplot2-layers/grouping 3-2.png) 

{% highlight r %}
# Tương tự với `qplot()`
qplot(Occasion, height, data=Oxboys, geom="boxplot")
{% endhighlight %}

![plot of chunk grouping 3](../../figures/ggplot2-layers/grouping 3-3.png) 

{% highlight r %}
qplot(Occasion, height, data=Oxboys, geom="boxplot") +
 geom_line(aes(group = Subject), colour="#3366FF")
{% endhighlight %}

![plot of chunk grouping 3](../../figures/ggplot2-layers/grouping 3-4.png) 
 
### Ghép thuộc tính thẩm mỹ với đối tượng đồ họa
 
#### Đường thẳng
 

{% highlight r %}
df <- data.frame(x = 1:3, y = 1:3, colour = c(1,3,5))
# Ver 1
qplot(x, y, data=df, colour=factor(colour), size = I(5)) + 
  geom_line(aes(group = 1), size = 2)
{% endhighlight %}

![plot of chunk matching lines](../../figures/ggplot2-layers/matching lines-1.png) 

{% highlight r %}
# Ver 2
qplot(x, y, data=df, colour=colour, size = I(5)) + 
  geom_line(size = 2)
{% endhighlight %}

![plot of chunk matching lines](../../figures/ggplot2-layers/matching lines-2.png) 

{% highlight r %}
# Chuyển đổi biến rời rạc thành biến liên tục
xgrid <- with(df, seq(min(x), max(x), length = 50))
interp <- data.frame(
  x = xgrid,
  y = approx(df$x, df$y, xout = xgrid)$y,
  colour = approx(df$x, df$colour, xout = xgrid)$y  
)
 
# Ver 3
qplot(x, y, data = df, colour = colour, size = I(5)) + 
  geom_line(data = interp, size = 2)
{% endhighlight %}

![plot of chunk matching lines](../../figures/ggplot2-layers/matching lines-3.png) 
 
#### Đa giác
 

{% highlight r %}
qplot(color, data = diamonds)
{% endhighlight %}

![plot of chunk matching polygon](../../figures/ggplot2-layers/matching polygon-1.png) 

{% highlight r %}
qplot(color, data = diamonds, fill = cut)
{% endhighlight %}

![plot of chunk matching polygon](../../figures/ggplot2-layers/matching polygon-2.png) 
 
## Phép biến đổi thống kê
 

{% highlight r %}
ggplot(diamonds, aes(carat)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.1)
{% endhighlight %}

![plot of chunk stat](../../figures/ggplot2-layers/stat-1.png) 

{% highlight r %}
# Tương tự với `qplot()`  
qplot(carat, ..density.., data = diamonds, geom="histogram", 
  binwidth = 0.1)
{% endhighlight %}

![plot of chunk stat](../../figures/ggplot2-layers/stat-2.png) 
 
## Điều chỉnh vị trí
 

{% highlight r %}
# Stack, fill & dodge
dplot <- ggplot(diamonds, aes(clarity, fill = cut))
dplot + geom_bar(position = "stack")
{% endhighlight %}

![plot of chunk position adjustments](../../figures/ggplot2-layers/position adjustments-1.png) 

{% highlight r %}
dplot + geom_bar(position = "fill")
{% endhighlight %}

![plot of chunk position adjustments](../../figures/ggplot2-layers/position adjustments-2.png) 

{% highlight r %}
dplot + geom_bar(position = "dodge")
{% endhighlight %}

![plot of chunk position adjustments](../../figures/ggplot2-layers/position adjustments-3.png) 

{% highlight r %}
# Identity
dplot + geom_bar(position = "identity")
{% endhighlight %}

![plot of chunk position adjustments](../../figures/ggplot2-layers/position adjustments-4.png) 

{% highlight r %}
qplot(clarity, data = diamonds, geom="line", colour = cut, 
  stat="bin", group=cut)
{% endhighlight %}

![plot of chunk position adjustments](../../figures/ggplot2-layers/position adjustments-5.png) 
 
## Kết hợp tất cả!
 
### Kết hợp geoms và stats
 

{% highlight r %}
d <- ggplot(diamonds, aes(carat)) + xlim(0, 3)
# Ver 1: area geom
d + stat_bin(aes(ymax = ..count..), binwidth = 0.1, geom = "area")
{% endhighlight %}

![plot of chunk geoms and stats](../../figures/ggplot2-layers/geoms and stats-1.png) 

{% highlight r %}
# Ver 2: point geom
d + stat_bin(
  aes(size = ..density..), binwidth = 0.1, 
  geom = "point", position="identity"
)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk geoms and stats](../../figures/ggplot2-layers/geoms and stats-2.png) 

{% highlight r %}
# # Ver 3: tile geom
d + stat_bin2d(aes(y = 1), binwidth = c(0.1,1))
{% endhighlight %}

![plot of chunk geoms and stats](../../figures/ggplot2-layers/geoms and stats-3.png) 
 
### Vẽ đồ thị cho các thống kê tính trước
 
```r
stat_identity()
```
 
### Thay đổi thuộc tính thẩm mỹ và dữ liệu
 

{% highlight r %}
require(nlme, quiet = TRUE, warn.conflicts = FALSE)
# Chạy mô hình 1
model <- lme(height ~ age, data = Oxboys, 
 random = ~ 1 + age | Subject)
# Khởi tạo plot
oplot <- ggplot(Oxboys, aes(age, height, group = Subject)) + 
  geom_line()
 
# So sánh giữa thực tế và mô hình:
# 1. Tính toán theo mô hình
#    từ dữ liệu tự khởi tạo.
age_grid <- seq(-1, 1, length = 10)
subjects <- unique(Oxboys$Subject)
 
preds <- expand.grid(age = age_grid, Subject = subjects)
preds$height <- predict(model, preds)
 
oplot + geom_line(data = preds, colour = "#3366FF", size= 0.4)
{% endhighlight %}

![plot of chunk vary aes & data](../../figures/ggplot2-layers/vary aes & data-1.png) 

{% highlight r %}
# 2. Tính toán theo mô hình
#    từ dữ liệu gốc.
Oxboys$fitted <- predict(model)
Oxboys$resid <- with(Oxboys, fitted - height)
 
# Cập nhật dữ liệu gốc, đổi trục tung thành residual,
# và thêm một đường smooth.
oplot %+% Oxboys + aes(y = resid) + geom_smooth(aes(group=1))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk vary aes & data](../../figures/ggplot2-layers/vary aes & data-2.png) 

{% highlight r %}
# Chạy mô hình 2
model2 <- update(model, height ~ age + I(age ^ 2))
Oxboys$fitted2 <- predict(model2)
Oxboys$resid2 <- with(Oxboys, fitted2 - height)
 
oplot %+% Oxboys + aes(y = resid2) + geom_smooth(aes(group=1))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk vary aes & data](../../figures/ggplot2-layers/vary aes & data-3.png) 
