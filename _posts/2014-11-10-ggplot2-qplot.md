---
layout: post
title: "ggplot2: qplot()"
converted: yes
---
 
## Dữ liệu
 

{% highlight r %}
library(ggplot2)
head(diamonds)
{% endhighlight %}



{% highlight text %}
##   carat       cut color clarity depth table price   x   y   z
## 1  0.23     Ideal     E     SI2    62    55   326 4.0 4.0 2.4
## 2  0.21   Premium     E     SI1    60    61   326 3.9 3.8 2.3
## 3  0.23      Good     E     VS1    57    65   327 4.0 4.1 2.3
## 4  0.29   Premium     I     VS2    62    58   334 4.2 4.2 2.6
## 5  0.31      Good     J     SI2    63    58   335 4.3 4.3 2.8
## 6  0.24 Very Good     J    VVS2    63    57   336 3.9 4.0 2.5
{% endhighlight %}



{% highlight r %}
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
{% endhighlight %}
 
## Lệnh cơ bản
 

{% highlight r %}
# Basic use
qplot(carat, price, data = diamonds)
{% endhighlight %}

![plot of chunk basic use](../../figures/ggplot2-qplot/basic use-1.png) 

{% highlight r %}
qplot(log(carat), log(price), data = diamonds)
{% endhighlight %}

![plot of chunk basic use](../../figures/ggplot2-qplot/basic use-2.png) 

{% highlight r %}
qplot(carat, x * y * z, data = diamonds)
{% endhighlight %}

![plot of chunk basic use](../../figures/ggplot2-qplot/basic use-3.png) 
 
## Các thuộc tính thẩm mỹ
 

{% highlight r %}
# Color and shape
qplot(carat, price, data = dsmall, colour = color)
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-1.png) 

{% highlight r %}
qplot(carat, price, data = dsmall, shape = cut)
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-2.png) 

{% highlight r %}
# Alpha aesthetic
qplot(carat, price, data = diamonds, alpha = I(1/10))
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-3.png) 

{% highlight r %}
qplot(carat, price, data = diamonds, alpha = I(1/100))
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-4.png) 

{% highlight r %}
qplot(carat, price, data = diamonds, alpha = I(1/200))
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-5.png) 

{% highlight r %}
# Add smoother
qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-6.png) 

{% highlight r %}
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk other aesthetic](../../figures/ggplot2-qplot/other aesthetic-7.png) 
 
## Các đối tượng hình học
 
### Thêm `smoother`
 

{% highlight r %}
# method = "loess", default for n < 1000
qplot(carat, price, data = dsmall, geom = c("point", "smooth"), 
  span = 0.2)
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-1.png) 

{% highlight r %}
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  span = 1)
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-2.png) 

{% highlight r %}
# method = "gam", default for n > 1000
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  method = "gam", formula = y ~ s(x))
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-3.png) 

{% highlight r %}
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  method = "gam", formula = y ~ s(x, bs = "cs"))
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-4.png) 

{% highlight r %}
# method = "lm"
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  method = "lm")
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-5.png) 

{% highlight r %}
library(splines)
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  method = "lm", formula = y ~ ns(x,5))
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-6.png) 

{% highlight r %}
# method = "rlm"
library(MASS)
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
  method = "rlm")
{% endhighlight %}

![plot of chunk smoother](../../figures/ggplot2-qplot/smoother-7.png) 
 
### Boxplots và jittered points
 

{% highlight r %}
# Basic command
qplot(color, price / carat, data = diamonds, geom = "jitter")
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-1.png) 

{% highlight r %}
qplot(color, price / carat, data = diamonds, geom = "boxplot")
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-2.png) 

{% highlight r %}
# More colorful?
qplot(color, price / carat, data = diamonds, geom = "jitter",
  color = color)
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-3.png) 

{% highlight r %}
qplot(color, price / carat, data = diamonds, geom = "boxplot",
  fill = color)
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-4.png) 

{% highlight r %}
# Add semi-transparent
qplot(color, price / carat, data = diamonds, geom = "jitter", 
  alpha = I(1 / 5))
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-5.png) 

{% highlight r %}
qplot(color, price / carat, data = diamonds, geom = "jitter", 
  alpha = I(1 / 50))
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-6.png) 

{% highlight r %}
qplot(color, price / carat, data = diamonds, geom = "jitter", 
  alpha = I(1 / 200))
{% endhighlight %}

![plot of chunk boxplot and jitter](../../figures/ggplot2-qplot/boxplot and jitter-7.png) 
 
### Hoành đồ và mật độ
 

{% highlight r %}
# basic
qplot(carat, data = diamonds, geom = "histogram")
{% endhighlight %}



{% highlight text %}
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-1.png) 

{% highlight r %}
qplot(carat, data = diamonds, geom = "density")
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-2.png) 

{% highlight r %}
# add binwidth & xlim
qplot(carat, data = diamonds, geom = "histogram", binwidth = 1,
  xlim = c(0,3))
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-3.png) 

{% highlight r %}
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1,
  xlim = c(0,3))
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-4.png) 

{% highlight r %}
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.01,
  xlim = c(0,3))
{% endhighlight %}



{% highlight text %}
## Warning: position_stack requires constant width: output may be incorrect
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-5.png) 

{% highlight r %}
# more colorful?
qplot(carat, data = diamonds, geom = "density", colour = color)
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-6.png) 

{% highlight r %}
qplot(carat, data = diamonds, geom = "histogram", fill = color)
{% endhighlight %}



{% highlight text %}
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
{% endhighlight %}

![plot of chunk histo & densi](../../figures/ggplot2-qplot/histo & densi-7.png) 
 
### Biểu đồ cột
 

{% highlight r %}
# simple version
qplot(color, data = diamonds, geom = "bar")
{% endhighlight %}

![plot of chunk bar chart](../../figures/ggplot2-qplot/bar chart-1.png) 

{% highlight r %}
# weighted version (by carat)
qplot(color, data = diamonds, geom = "bar", weight = carat) +
  scale_y_continuous("carat")
{% endhighlight %}

![plot of chunk bar chart](../../figures/ggplot2-qplot/bar chart-2.png) 

{% highlight r %}
# more colorful?
qplot(color, data = diamonds, geom = "bar", fill = color)
{% endhighlight %}

![plot of chunk bar chart](../../figures/ggplot2-qplot/bar chart-3.png) 
 
### Chuỗi thời gian
 

{% highlight r %}
# with line
qplot(date, unemploy / pop, data = economics, geom = "line")
{% endhighlight %}

![plot of chunk time series](../../figures/ggplot2-qplot/time series-1.png) 

{% highlight r %}
qplot(date, uempmed, data = economics, geom = "line")
{% endhighlight %}

![plot of chunk time series](../../figures/ggplot2-qplot/time series-2.png) 

{% highlight r %}
# with path
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy / pop, uempmed, data = economics,
  geom = c("point", "path"))
{% endhighlight %}

![plot of chunk time series](../../figures/ggplot2-qplot/time series-3.png) 

{% highlight r %}
qplot(unemploy / pop, uempmed, data = economics,
  geom = "path", color = year(date)) + scale_size_area()
{% endhighlight %}

![plot of chunk time series](../../figures/ggplot2-qplot/time series-4.png) 
 
## Faceting
 

{% highlight r %}
# facets
qplot(carat, data = diamonds, facets = color ~ .,
  geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
{% endhighlight %}

![plot of chunk faceting](../../figures/ggplot2-qplot/faceting-1.png) 

{% highlight r %}
# with ..density..
qplot(carat, ..density.., data = diamonds, facets = color ~ .,
  geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
{% endhighlight %}

![plot of chunk faceting](../../figures/ggplot2-qplot/faceting-2.png) 
 
## Các tùy chọn khác
 

{% highlight r %}
qplot(
  carat, price, data = dsmall,
  xlab = "Price ($)", ylab = "Weight (carats)",
  main = "Price-weight relationship"
)
{% endhighlight %}

![plot of chunk other opts](../../figures/ggplot2-qplot/other opts-1.png) 

{% highlight r %}
qplot(
  carat, price/carat, data = dsmall,
  ylab = expression(frac(price,carat)),
  xlab = "Weight (carats)",
  main="Small diamonds",
  xlim = c(.2,1)
)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 35 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk other opts](../../figures/ggplot2-qplot/other opts-2.png) 

{% highlight r %}
qplot(carat, price, data = dsmall, log = "xy")
{% endhighlight %}

![plot of chunk other opts](../../figures/ggplot2-qplot/other opts-3.png) 
