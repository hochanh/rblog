---
layout: post
title: "ggplot2: Grammar"
converted: yes
---
 
## Dữ liệu
 

{% highlight r %}
head(mpg)
{% endhighlight %}



{% highlight text %}
## [1] 18 15 18 16 17 15
{% endhighlight %}
 
## Xây dựng biểu đồ điểm
 

{% highlight r %}
qplot(displ, hwy, data = mpg, colour = factor(cyl))
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
qplot(displ, hwy, data=mpg, colour=factor(cyl), geom="line")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
qplot(displ, hwy, data=mpg, colour=factor(cyl), geom="bar", 
  stat="identity", position = "identity")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
# A complex plot without name
qplot(displ, hwy, data=mpg, colour=factor(cyl)) + 
  geom_smooth(data = subset(mpg, cyl != 5), method="lm")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}
 
## Một biểu đồ phức tạp hơn
 

{% highlight r %}
# A more complex plot with facets and multiple layers.
qplot(displ, hwy, data=mpg, facets = . ~ year) + geom_smooth()
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}
 
## Các thành phần của ngữ pháp phân lớp
 

{% highlight r %}
x <- 1:10
y <- factor(letters[1:5])
qplot(x, x, size = x)
{% endhighlight %}

![plot of chunk scale](../../figures/ggplot2-grammar-mastery/scale-1.png) 

{% highlight r %}
qplot(x, x, 1:10, colour = x)
{% endhighlight %}

![plot of chunk scale](../../figures/ggplot2-grammar-mastery/scale-2.png) 

{% highlight r %}
qplot(y, y, 1:10, shape = y)
{% endhighlight %}

![plot of chunk scale](../../figures/ggplot2-grammar-mastery/scale-3.png) 

{% highlight r %}
qplot(y, y, 1:10, colour = y)
{% endhighlight %}

![plot of chunk scale](../../figures/ggplot2-grammar-mastery/scale-4.png) 
 

{% highlight r %}
x1 <- c(1,10)
y1 <- c(1, 5)
p <- qplot(x1, y1, geom="blank", xlab=NULL, ylab=NULL) + theme_bw()
p 
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-grammar-mastery/coord-1.png) 

{% highlight r %}
p + coord_trans(y="log10")
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-grammar-mastery/coord-2.png) 

{% highlight r %}
p + coord_polar()
{% endhighlight %}

![plot of chunk coord](../../figures/ggplot2-grammar-mastery/coord-3.png) 
 

{% highlight r %}
p <- qplot(displ, hwy, data = mpg, colour = factor(cyl))
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
summary(p)
{% endhighlight %}



{% highlight text %}
## data: [0x0]
## mapping:  x = x1, y = y1
## faceting: facet_null() 
## -----------------------------------
## geom_blank:  
## stat_identity:  
## position_identity: (width = NULL, height = NULL)
{% endhighlight %}



{% highlight r %}
# Save plot object to disk
# save(p, file = "plot.rdata")
# Load from disk
# load("plot.rdata")
# Save png to disk
# ggsave("plot.png", width = 5, height = 5)
{% endhighlight %}
