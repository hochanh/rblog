---
layout: post
title: Resampling methods in R
converted: yes
---
 
## Phương pháp tập kiểm chứng
 

{% highlight r %}
library(ISLR)
set.seed(1)
train=sample(392,196)
lm.fit=lm(mpg~horsepower,data=Auto,subset=train)
attach(Auto)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from auto01:
## 
##     acceleration, cylinders, displacement, horsepower, mpg, name,
##     origin, weight, year
## 
## The following objects are masked from Auto (pos = 16):
## 
##     acceleration, cylinders, displacement, horsepower, mpg, name,
##     origin, weight, year
## 
## The following object is masked from package:ggplot2:
## 
##     mpg
{% endhighlight %}



{% highlight r %}
mean((mpg-predict(lm.fit,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 26
{% endhighlight %}



{% highlight r %}
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 20
{% endhighlight %}



{% highlight r %}
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 20
{% endhighlight %}



{% highlight r %}
set.seed(2)
train=sample(392,196)
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 23
{% endhighlight %}



{% highlight r %}
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 19
{% endhighlight %}



{% highlight r %}
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
{% endhighlight %}



{% highlight text %}
## [1] 19
{% endhighlight %}
 
## Kiểm chứng chéo để lại 1 phần tử
 

{% highlight r %}
glm.fit=glm(mpg~horsepower,data=Auto)
coef(glm.fit)
{% endhighlight %}



{% highlight text %}
## (Intercept)  horsepower 
##       39.94       -0.16
{% endhighlight %}



{% highlight r %}
lm.fit=lm(mpg~horsepower,data=Auto)
coef(lm.fit)
{% endhighlight %}



{% highlight text %}
## (Intercept)  horsepower 
##       39.94       -0.16
{% endhighlight %}



{% highlight r %}
library(boot)
{% endhighlight %}



{% highlight text %}
## 
## Attaching package: 'boot'
## 
## The following object is masked from 'package:car':
## 
##     logit
{% endhighlight %}



{% highlight r %}
glm.fit=glm(mpg~horsepower,data=Auto)
cv.err=cv.glm(Auto,glm.fit)
cv.err$delta
{% endhighlight %}



{% highlight text %}
## [1] 24 24
{% endhighlight %}



{% highlight r %}
cv.error=rep(0,5)
for (i in 1:5){
 glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
 cv.error[i]=cv.glm(Auto,glm.fit)$delta[1]
 }
cv.error
{% endhighlight %}



{% highlight text %}
## [1] 24 19 19 19 19
{% endhighlight %}
 
## Kiểm chứng chéo k phần
 

{% highlight r %}
set.seed(17)
cv.error.10=rep(0,10)
for (i in 1:10){
 glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
 cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
 }
cv.error.10
{% endhighlight %}



{% highlight text %}
##  [1] 24 19 19 19 19 19 19 20 19 20
{% endhighlight %}
 
## Tự khởi tạo mẫu
 
### Ước tính độ chính xác của một giá trị thống kê
 

{% highlight r %}
alpha.fn=function(data,index){
 X=data$X[index]
 Y=data$Y[index]
 return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
 }
alpha.fn(Portfolio,1:100)
{% endhighlight %}



{% highlight text %}
## [1] 0.58
{% endhighlight %}



{% highlight r %}
set.seed(1)
alpha.fn(Portfolio,sample(100,100,replace=T))
{% endhighlight %}



{% highlight text %}
## [1] 0.6
{% endhighlight %}



{% highlight r %}
boot(Portfolio,alpha.fn,R=1000)
{% endhighlight %}



{% highlight text %}
## 
## ORDINARY NONPARAMETRIC BOOTSTRAP
## 
## 
## Call:
## boot(data = Portfolio, statistic = alpha.fn, R = 1000)
## 
## 
## Bootstrap Statistics :
##     original   bias    std. error
## t1*     0.58 -7.3e-05       0.089
{% endhighlight %}
 
### Ước tính độ chính xác của mô hình hồi quy tuyến tính
 

{% highlight r %}
boot.fn=function(data,index)
 return(coef(lm(mpg~horsepower,data=data,subset=index)))
boot.fn(Auto,1:392)
{% endhighlight %}



{% highlight text %}
## (Intercept)  horsepower 
##       39.94       -0.16
{% endhighlight %}



{% highlight r %}
set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))
{% endhighlight %}



{% highlight text %}
## (Intercept)  horsepower 
##       38.74       -0.15
{% endhighlight %}



{% highlight r %}
boot.fn(Auto,sample(392,392,replace=T))
{% endhighlight %}



{% highlight text %}
## (Intercept)  horsepower 
##       40.04       -0.16
{% endhighlight %}



{% highlight r %}
boot(Auto,boot.fn,1000)
{% endhighlight %}



{% highlight text %}
## 
## ORDINARY NONPARAMETRIC BOOTSTRAP
## 
## 
## Call:
## boot(data = Auto, statistic = boot.fn, R = 1000)
## 
## 
## Bootstrap Statistics :
##     original   bias    std. error
## t1*    39.94  0.02972      0.8600
## t2*    -0.16 -0.00031      0.0074
{% endhighlight %}



{% highlight r %}
summary(lm(mpg~horsepower,data=Auto))$coef
{% endhighlight %}



{% highlight text %}
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)    39.94     0.7175      56 1.2e-187
## horsepower     -0.16     0.0064     -24  7.0e-81
{% endhighlight %}



{% highlight r %}
# another boot
boot.fn=function(data,index)
 coefficients(lm(mpg~horsepower+I(horsepower^2),data=data,subset=index))
set.seed(1)
boot(Auto,boot.fn,1000)
{% endhighlight %}



{% highlight text %}
## 
## ORDINARY NONPARAMETRIC BOOTSTRAP
## 
## 
## Call:
## boot(data = Auto, statistic = boot.fn, R = 1000)
## 
## 
## Bootstrap Statistics :
##     original   bias    std. error
## t1*  56.9001  6.1e-03     2.09449
## t2*  -0.4662 -1.8e-04     0.03341
## t3*   0.0012  1.3e-06     0.00012
{% endhighlight %}



{% highlight r %}
summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef
{% endhighlight %}



{% highlight text %}
##                 Estimate Std. Error t value Pr(>|t|)
## (Intercept)      56.9001    1.80043      32 1.7e-109
## horsepower       -0.4662    0.03112     -15  2.3e-40
## I(horsepower^2)   0.0012    0.00012      10  2.2e-21
{% endhighlight %}
