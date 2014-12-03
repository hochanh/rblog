---
layout: post
title: "ggplot2: Duplication"
converted: yes
---
 
## Dùng phép lặp `last_plot()`
 

{% highlight r %}
library(ggplot2)
options(digits = 2)
 
# Dùng last_plot() để phóng to đoạn quan tâm
qplot(x, y, data = diamonds, na.rm = TRUE)
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-1.png) 

{% highlight r %}
last_plot() + xlim(3, 11) + ylim(3, 11)
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-2.png) 

{% highlight r %}
last_plot() + xlim(4, 10) + ylim(4, 10)
{% endhighlight %}



{% highlight text %}
## Scale for 'x' is already present. Adding another scale for 'x', which will replace the existing scale.
## Scale for 'y' is already present. Adding another scale for 'y', which will replace the existing scale.
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-3.png) 

{% highlight r %}
last_plot() + xlim(4, 5) + ylim(4, 5)
{% endhighlight %}



{% highlight text %}
## Scale for 'x' is already present. Adding another scale for 'x', which will replace the existing scale.
## Scale for 'y' is already present. Adding another scale for 'y', which will replace the existing scale.
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-4.png) 

{% highlight r %}
last_plot() + xlim(4, 4.5) + ylim(4, 4.5)
{% endhighlight %}



{% highlight text %}
## Scale for 'x' is already present. Adding another scale for 'x', which will replace the existing scale.
## Scale for 'y' is already present. Adding another scale for 'y', which will replace the existing scale.
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-5.png) 

{% highlight r %}
last_plot() + geom_abline(colour = "red")
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-6.png) 

{% highlight r %}
# Lệnh tổng hợp cuối cùng
qplot(x, y, data = diamonds, na.rm = T) + 
  geom_abline(colour = "red") +
  xlim(4, 4.5) + ylim(4, 4.5)
{% endhighlight %}

![plot of chunk iteration](../../figures/ggplot2-duplication/iteration-7.png) 
 
## Lưu mẫu biểu đồ
 
### Lưu các đối tượng đơn
 

{% highlight r %}
gradient_rb <- scale_colour_gradient(low = "red", high = "blue")
qplot(cty, hwy, data = mpg, colour = displ) + gradient_rb
{% endhighlight %}

![plot of chunk single](../../figures/ggplot2-duplication/single-1.png) 

{% highlight r %}
qplot(bodywt, brainwt, data = msleep, colour = awake, log="xy") +
  gradient_rb
{% endhighlight %}



{% highlight text %}
## Warning: Removed 27 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk single](../../figures/ggplot2-duplication/single-2.png) 
 
### Lưu danh sách đối tượng
 

{% highlight r %}
xquiet <- scale_x_continuous("", breaks = NULL)
yquiet <- scale_y_continuous("", breaks = NULL)
quiet <- list(xquiet, yquiet)
 
qplot(mpg, wt, data = mtcars) + quiet
{% endhighlight %}

![plot of chunk list](../../figures/ggplot2-duplication/list-1.png) 

{% highlight r %}
qplot(displ, cty, data = mpg) + quiet
{% endhighlight %}

![plot of chunk list](../../figures/ggplot2-duplication/list-2.png) 
 
### Dùng hàm đổi đối số mặc định của hàm
 

{% highlight r %}
geom_lm <- function(formula = y ~ x) {
  geom_smooth(formula = formula, se = FALSE, method = "lm")
}
qplot(mpg, wt, data = mtcars) + geom_lm()
{% endhighlight %}

![plot of chunk func](../../figures/ggplot2-duplication/func-1.png) 

{% highlight r %}
library(splines)
qplot(mpg, wt, data = mtcars) + geom_lm(y ~ ns(x, 3))
{% endhighlight %}

![plot of chunk func](../../figures/ggplot2-duplication/func-2.png) 
 
## Lưu hàm biểu đồ
 

{% highlight r %}
pcp_data <- function(df) {
  libs <- c("plyr","reshape2")
  lapply(libs, require, character.only = TRUE)
  numeric <- laply(df, is.numeric)
  # Rescale numeric columns
  range01 <- function(x) x / range(x)
  df[numeric] <- colwise(range01)(df[numeric])
  # Add row identified
  df$.row <- rownames(df)
  # Melt, using non-numeric variables as id vars
  dfm <- melt(df, id = c(".row", names(df)[!numeric]))
  # Add pcp to class of the data frame
  class(dfm) <- c("pcp", class(dfm))
  dfm
}
pcp <- function(df, ...) {
  df <- pcp_data(df)
  ggplot(df, aes(variable, value)) + geom_line(aes(group = .row))
}
pcp(mpg)
{% endhighlight %}

![plot of chunk plot functions](../../figures/ggplot2-duplication/plot functions-1.png) 

{% highlight r %}
pcp(mpg) + aes(colour = drv)
{% endhighlight %}

![plot of chunk plot functions](../../figures/ggplot2-duplication/plot functions-2.png) 
