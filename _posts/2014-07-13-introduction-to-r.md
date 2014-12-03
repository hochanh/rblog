---
layout: post
title: "Introduction to R"
converted: yes
---
Giới thiệu về ngôn ngữ R[^1].
 
## Các lệnh căn bản
 

{% highlight r %}
x <- c(1,3,2,5)
x
{% endhighlight %}



{% highlight text %}
## [1] 1 3 2 5
{% endhighlight %}



{% highlight r %}
x = c(1,6,2)
x
{% endhighlight %}



{% highlight text %}
## [1] 1 6 2
{% endhighlight %}



{% highlight r %}
y = c(1,4,3)
length(x)
{% endhighlight %}



{% highlight text %}
## [1] 3
{% endhighlight %}



{% highlight r %}
length(y)
{% endhighlight %}



{% highlight text %}
## [1] 3
{% endhighlight %}



{% highlight r %}
x+y
{% endhighlight %}



{% highlight text %}
## [1]  2 10  5
{% endhighlight %}



{% highlight r %}
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
{% endhighlight %}



{% highlight r %}
x=matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    1    2
## [2,]    3    4
{% endhighlight %}



{% highlight r %}
sqrt(x)
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]  1.0  1.7
## [2,]  1.4  2.0
{% endhighlight %}



{% highlight r %}
x^2
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    1    9
## [2,]    4   16
{% endhighlight %}



{% highlight r %}
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
cor(x,y)
{% endhighlight %}



{% highlight text %}
## [1] 0.99
{% endhighlight %}



{% highlight r %}
set.seed(1303)
rnorm(50)
{% endhighlight %}



{% highlight text %}
##  [1] -1.14398  1.34213  2.18539  0.53639  0.06319  0.50223 -0.00042
##  [8]  0.56582 -0.57252 -1.11023 -0.04869 -0.69566  0.82892  0.20665
## [15] -0.23567 -0.55631 -0.36475  0.86236 -0.63077  0.31360 -0.93150
## [22]  0.82387  0.52337  0.70692  0.42020 -0.26905 -1.51032 -0.69021
## [29] -0.14347 -1.01353  1.57327  0.01275  0.87265  0.42207 -0.01882
## [36]  2.61575 -0.69314 -0.26632 -0.72064  1.36773  0.26401  0.63219
## [43] -1.33065  0.02689  1.04064  1.31202 -0.03000 -0.25003  0.02341
## [50]  1.65987
{% endhighlight %}



{% highlight r %}
set.seed(3)
y=rnorm(100)
mean(y)
{% endhighlight %}



{% highlight text %}
## [1] 0.011
{% endhighlight %}



{% highlight r %}
var(y)
{% endhighlight %}



{% highlight text %}
## [1] 0.73
{% endhighlight %}



{% highlight r %}
sqrt(var(y))
{% endhighlight %}



{% highlight text %}
## [1] 0.86
{% endhighlight %}



{% highlight r %}
sd(y)
{% endhighlight %}



{% highlight text %}
## [1] 0.86
{% endhighlight %}
 
## Đồ họa
 

{% highlight r %}
# 2 dimensions
x=rnorm(100)
y=rnorm(100)
plot(x,y)
{% endhighlight %}

![plot of chunk graphic](../../figures/introduction-to-r/graphic-1.png) 

{% highlight r %}
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
{% endhighlight %}

![plot of chunk graphic](../../figures/introduction-to-r/graphic-2.png) 
 

{% highlight r %}
# 3 dimensions
x=seq(1,10)
x
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}
x=1:10
x
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}
x=seq(-pi,pi,length=50)
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-1.png) 

{% highlight r %}
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-2.png) 

{% highlight r %}
image(x,y,fa)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-3.png) 

{% highlight r %}
persp(x,y,fa)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-4.png) 

{% highlight r %}
persp(x,y,fa,theta=30)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-5.png) 

{% highlight r %}
persp(x,y,fa,theta=30,phi=20)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-6.png) 

{% highlight r %}
persp(x,y,fa,theta=30,phi=70)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-7.png) 

{% highlight r %}
persp(x,y,fa,theta=30,phi=40)
{% endhighlight %}

![plot of chunk 3-d](../../figures/introduction-to-r/3-d-8.png) 
 
## Chỉ mục dữ liệu
 

{% highlight r %}
A=matrix(1:16,4,4)
A
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    1    5    9   13
## [2,]    2    6   10   14
## [3,]    3    7   11   15
## [4,]    4    8   12   16
{% endhighlight %}



{% highlight r %}
A[2,3]
{% endhighlight %}



{% highlight text %}
## [1] 10
{% endhighlight %}



{% highlight r %}
A[c(1,3),c(2,4)]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    5   13
## [2,]    7   15
{% endhighlight %}



{% highlight r %}
A[1:3,2:4]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3]
## [1,]    5    9   13
## [2,]    6   10   14
## [3,]    7   11   15
{% endhighlight %}



{% highlight r %}
A[1:2,]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    1    5    9   13
## [2,]    2    6   10   14
{% endhighlight %}



{% highlight r %}
A[,1:2]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    1    5
## [2,]    2    6
## [3,]    3    7
## [4,]    4    8
{% endhighlight %}



{% highlight r %}
A[1,]
{% endhighlight %}



{% highlight text %}
## [1]  1  5  9 13
{% endhighlight %}



{% highlight r %}
A[-c(1,3),]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    2    6   10   14
## [2,]    4    8   12   16
{% endhighlight %}



{% highlight r %}
A[-c(1,3),-c(1,3,4)]
{% endhighlight %}



{% highlight text %}
## [1] 6 8
{% endhighlight %}



{% highlight r %}
dim(A)
{% endhighlight %}



{% highlight text %}
## [1] 4 4
{% endhighlight %}
 
 
## Tổng quan về dữ liệu 
 

{% highlight r %}
# fileUrl <- "http://www-bcf.usc.edu/~gareth/ISL/Auto.csv"
# download.file(fileUrl,destfile="./ISL/Auto.csv")
 
Auto=read.csv("./ISL/Auto.csv",header=T,na.strings="?")
dim(Auto)
{% endhighlight %}



{% highlight text %}
## [1] 397   9
{% endhighlight %}



{% highlight r %}
Auto[1:4,]
{% endhighlight %}



{% highlight text %}
##   mpg cylinders displacement horsepower weight acceleration year origin
## 1  18         8          307        130   3504           12   70      1
## 2  15         8          350        165   3693           12   70      1
## 3  18         8          318        150   3436           11   70      1
## 4  16         8          304        150   3433           12   70      1
##                        name
## 1 chevrolet chevelle malibu
## 2         buick skylark 320
## 3        plymouth satellite
## 4             amc rebel sst
{% endhighlight %}



{% highlight r %}
Auto=na.omit(Auto)
dim(Auto)
{% endhighlight %}



{% highlight text %}
## [1] 392   9
{% endhighlight %}



{% highlight r %}
names(Auto)
{% endhighlight %}



{% highlight text %}
## [1] "mpg"          "cylinders"    "displacement" "horsepower"  
## [5] "weight"       "acceleration" "year"         "origin"      
## [9] "name"
{% endhighlight %}



{% highlight r %}
attach(Auto)
{% endhighlight %}



{% highlight text %}
## The following object is masked from package:ggplot2:
## 
##     mpg
{% endhighlight %}



{% highlight r %}
plot(cylinders, mpg)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-1.png) 

{% highlight r %}
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-2.png) 

{% highlight r %}
plot(cylinders, mpg, col="red")
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-3.png) 

{% highlight r %}
plot(cylinders, mpg, col="red", varwidth=T)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-4.png) 

{% highlight r %}
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-5.png) 

{% highlight r %}
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-6.png) 

{% highlight r %}
hist(mpg)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-7.png) 

{% highlight r %}
hist(mpg,col=2)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-8.png) 

{% highlight r %}
hist(mpg,col=2,breaks=15)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-9.png) 

{% highlight r %}
pairs(Auto)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-10.png) 

{% highlight r %}
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-11.png) 

{% highlight r %}
plot(horsepower,mpg)
identify(horsepower,mpg,name)
{% endhighlight %}

![plot of chunk add](../../figures/introduction-to-r/add-12.png) 

{% highlight text %}
## integer(0)
{% endhighlight %}



{% highlight r %}
summary(Auto)
{% endhighlight %}



{% highlight text %}
##       mpg       cylinders    displacement   horsepower      weight    
##  Min.   : 9   Min.   :3.0   Min.   : 68   Min.   : 46   Min.   :1613  
##  1st Qu.:17   1st Qu.:4.0   1st Qu.:105   1st Qu.: 75   1st Qu.:2225  
##  Median :23   Median :4.0   Median :151   Median : 94   Median :2804  
##  Mean   :23   Mean   :5.5   Mean   :194   Mean   :104   Mean   :2978  
##  3rd Qu.:29   3rd Qu.:8.0   3rd Qu.:276   3rd Qu.:126   3rd Qu.:3615  
##  Max.   :47   Max.   :8.0   Max.   :455   Max.   :230   Max.   :5140  
##                                                                       
##   acceleration       year        origin                     name    
##  Min.   : 8.0   Min.   :70   Min.   :1.00   amc matador       :  5  
##  1st Qu.:13.8   1st Qu.:73   1st Qu.:1.00   ford pinto        :  5  
##  Median :15.5   Median :76   Median :1.00   toyota corolla    :  5  
##  Mean   :15.5   Mean   :76   Mean   :1.58   amc gremlin       :  4  
##  3rd Qu.:17.0   3rd Qu.:79   3rd Qu.:2.00   amc hornet        :  4  
##  Max.   :24.8   Max.   :82   Max.   :3.00   chevrolet chevette:  4  
##                                             (Other)           :365
{% endhighlight %}



{% highlight r %}
summary(mpg)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       9      17      23      23      29      47
{% endhighlight %}
[^1]: <http://www-bcf.usc.edu/~gareth/ISL>
