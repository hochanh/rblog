---
layout: post
title: "ggplot2: Scales"
converted: yes
---
 
## Sử dụng `scales`
 

{% highlight r %}
library(ggplot2)
plot <- qplot(cty, hwy, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
plot
{% endhighlight %}



{% highlight text %}
## standardGeneric for "plot" defined from package "graphics"
## 
## function (x, y, ...) 
## standardGeneric("plot")
## <environment: 0x46d7a88>
## Methods may be defined for arguments: x, y
## Use  showMethods("plot")  for currently available ones.
{% endhighlight %}



{% highlight r %}
plot + aes(x = drv)
{% endhighlight %}



{% highlight text %}
## Error in plot + aes(x = drv): non-numeric argument to binary operator
{% endhighlight %}
 

{% highlight r %}
p <- qplot(sleep_total, sleep_cycle, data = msleep, colour = vore)
p 
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk modify scale](../../figures/ggplot2-scales/modify scale-1.png) 

{% highlight r %}
# Explicitly add the default scale
p + scale_colour_hue()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk modify scale](../../figures/ggplot2-scales/modify scale-2.png) 

{% highlight r %}
# Adjust parameters of the default, here changing the appearance 
# of the legend
p + scale_colour_hue("What does\nit eat?", 
   breaks = c("herbi", "carni", "omni", NA), 
   labels = c("plants", "meat", "both", "don't know"))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk modify scale](../../figures/ggplot2-scales/modify scale-3.png) 

{% highlight r %}
# Use a different scale
p + scale_colour_brewer(palette = "Set1")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk modify scale](../../figures/ggplot2-scales/modify scale-4.png) 
 
## Các chi tiết
 
### Tên
 

{% highlight r %}
p <- qplot(cty, hwy, data = mpg, colour = displ)
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
p
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-1.png) 

{% highlight r %}
p + scale_x_continuous("City mpg")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-2.png) 

{% highlight r %}
p + xlab("City mpg")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-3.png) 

{% highlight r %}
p + ylab("Highway mpg")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-4.png) 

{% highlight r %}
p + labs(x = "City mpg", y = "Highway", colour = "Displacement")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-5.png) 

{% highlight r %}
p + xlab(expression(frac(miles, gallon)))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 51 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk cm](../../figures/ggplot2-scales/cm-6.png) 
 
### breaks và limits
 

{% highlight r %}
p <- qplot(cyl, wt, data = mtcars)
p
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-1.png) 

{% highlight r %}
p + scale_x_continuous(breaks = c(4, 8))
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-2.png) 

{% highlight r %}
p + scale_x_continuous(limits = c(4, 8))
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-3.png) 

{% highlight r %}
p <- qplot(wt, cyl, data = mtcars, colour = cyl)
p
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-4.png) 

{% highlight r %}
p + scale_colour_gradient(breaks = c(5.5, 6.5))
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-5.png) 

{% highlight r %}
p + scale_colour_gradient(limits = c(5.5, 6.5))
{% endhighlight %}

![plot of chunk b&l](../../figures/ggplot2-scales/b&l-6.png) 
 
### Chuyển đổi
 

{% highlight r %}
# Khác nhau giữa log scale và log data: tên các trục khác nhau
qplot(log10(carat), log10(price), data = diamonds)
{% endhighlight %}

![plot of chunk scale x](../../figures/ggplot2-scales/scale x-1.png) 

{% highlight r %}
qplot(carat, price, data = diamonds) + 
  scale_x_log10() + scale_y_log10()
{% endhighlight %}

![plot of chunk scale x](../../figures/ggplot2-scales/scale x-2.png) 
 
### Thời gian và ngày tháng
 

{% highlight r %}
plot <- qplot(date, psavert, data = economics, geom = "line") + 
  ylab("Personal savings rate") +
  geom_hline(xintercept = 0, colour = "grey50")
plot
{% endhighlight %}

![plot of chunk date time](../../figures/ggplot2-scales/date time-1.png) 

{% highlight r %}
# Cần thêm thư viện 'scales'
library(scales)
plot + scale_x_date(breaks = date_breaks("10 years"))
{% endhighlight %}

![plot of chunk date time](../../figures/ggplot2-scales/date time-2.png) 

{% highlight r %}
plot + scale_x_date(
  limits = as.Date(c("2004-01-01", "2005-01-01")),
  labels = date_format("%Y-%m-%d")
)
{% endhighlight %}

![plot of chunk date time](../../figures/ggplot2-scales/date time-3.png) 
 
### Màu sắc
 

{% highlight r %}
# gradient và gradient2
f2d <- with(faithful, MASS::kde2d(eruptions, waiting, 
  h = c(1, 10), n = 50))
df <- with(f2d, cbind(expand.grid(x, y), as.vector(z)))
names(df) <- c("eruptions", "waiting", "density")
erupt <- ggplot(df, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_x_continuous(expand = c(0, 0)) + 
  scale_y_continuous(expand = c(0, 0))
erupt + scale_fill_gradient(limits = c(0, 0.04))
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-1.png) 

{% highlight r %}
erupt + scale_fill_gradient(limits = c(0, 0.04), 
  low = "white", high = "black") 
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-2.png) 

{% highlight r %}
erupt + scale_fill_gradient2(limits = c(-0.04, 0.04), 
  midpoint = mean(df$density)) 
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-3.png) 

{% highlight r %}
# gradientn
library(vcd)
{% endhighlight %}



{% highlight text %}
## Error in library(vcd): there is no package called 'vcd'
{% endhighlight %}



{% highlight r %}
fill_gradn <- function(pal) {
  scale_fill_gradientn(colours = pal(7), limits = c(0, 0.04))
}
# Tải thêm thư viện `colorspace`
library(colorspace)
erupt + fill_gradn(rainbow_hcl)
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-4.png) 

{% highlight r %}
erupt + fill_gradn(diverge_hcl)
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-5.png) 

{% highlight r %}
erupt + fill_gradn(heat_hcl)
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-6.png) 

{% highlight r %}
# 3 ColorBrewer palettes
point <- qplot(brainwt, bodywt, data = msleep, log = "xy", 
  colour = vore)
area <- qplot(log10(brainwt), data = msleep, fill = vore, 
  binwidth = 1)
# Chú ý 'pal=' không làm việc, phải dùng 'palette=', không hiểu
# tại sao.
point + scale_colour_brewer(palette = "Set1")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-7.png) 

{% highlight r %}
point + scale_colour_brewer(palette = "Set2")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-8.png) 

{% highlight r %}
point + scale_colour_brewer(palette = "Pastel1")
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-9.png) 

{% highlight r %}
area + scale_fill_brewer(palette = "Set1")
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-10.png) 

{% highlight r %}
area + scale_fill_brewer(palette = "Set2")
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-11.png) 

{% highlight r %}
area + scale_fill_brewer(palette = "Pastel1")
{% endhighlight %}

![plot of chunk gradient](../../figures/ggplot2-scales/gradient-12.png) 
 
### Tùy chỉnh
 

{% highlight r %}
# Màu tùy chỉnh
plot <- qplot(brainwt, bodywt, data = msleep, log = "xy")
plot + aes(colour = vore) + 
  scale_colour_manual(values = c("red", "orange", "yellow", 
    "green", "blue"))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-1.png) 

{% highlight r %}
colours <- c(carni = "red", "NA" = "orange", insecti = "yellow", 
  herbi = "green", omni = "blue")
plot + aes(colour = vore) + scale_colour_manual(values = colours)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-2.png) 

{% highlight r %}
# Hình dạng tùy chỉnh
plot + aes(shape = vore) + 
  scale_shape_manual(values = c(1, 2, 6, 0, 23))
{% endhighlight %}



{% highlight text %}
## Warning: Removed 32 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-3.png) 

{% highlight r %}
# Đa màu sắc
huron <- data.frame(year = 1875:1972, level = LakeHuron)
ggplot(huron, aes(year)) +
  geom_line(aes(y = level - 5), colour = "blue") + 
  geom_line(aes(y = level + 5), colour = "red")
{% endhighlight %}



{% highlight text %}
## Don't know how to automatically pick scale for object of type ts. Defaulting to continuous
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-4.png) 

{% highlight r %}
ggplot(huron, aes(year)) +
  geom_line(aes(y = level - 5, colour = "below")) + 
  geom_line(aes(y = level + 5, colour = "above"))
{% endhighlight %}



{% highlight text %}
## Don't know how to automatically pick scale for object of type ts. Defaulting to continuous
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-5.png) 

{% highlight r %}
ggplot(huron, aes(year)) +
  geom_line(aes(y = level - 5, colour = "below")) + 
  geom_line(aes(y = level + 5, colour = "above")) + 
  scale_colour_manual("Direction", 
    values = c("below" = "blue", "above" = "red"))
{% endhighlight %}



{% highlight text %}
## Don't know how to automatically pick scale for object of type ts. Defaulting to continuous
{% endhighlight %}

![plot of chunk manual](../../figures/ggplot2-scales/manual-6.png) 
 
### Scale đồng nhất
 

{% highlight r %}
x <- colors()
luv <- as.data.frame(convertColor(t(col2rgb(x)), "sRGB", "Luv"))
qplot(u, v, data=luv, colour = x, size = I(3)) + scale_colour_identity() +
   coord_equal()
{% endhighlight %}

![plot of chunk identity](../../figures/ggplot2-scales/identity-1.png) 
 
## Chú giải
 

{% highlight r %}
# Legends produced by geom: point, line, point and line, and bar.
p <- ggplot(diamonds[1:100, ], aes(price, carat, colour = cut))
p + geom_point()
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-1.png) 

{% highlight r %}
p + geom_line()
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-2.png) 

{% highlight r %}
p + geom_point() + geom_line()
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-3.png) 

{% highlight r %}
p + geom_bar(binwidth = 100) + aes(fill = cut, y = ..count..)
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-4.png) 

{% highlight r %}
# Colour legend, shape legend, colour + shape legend.
p <- ggplot(diamonds[1:100, ], aes(price, carat)) +  
  geom_point()
p + aes(colour = cut)
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-5.png) 

{% highlight r %}
p + aes(shape = cut)
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-6.png) 

{% highlight r %}
p + aes(shape = cut, colour = cut)
{% endhighlight %}

![plot of chunk legend](../../figures/ggplot2-scales/legend-7.png) 
