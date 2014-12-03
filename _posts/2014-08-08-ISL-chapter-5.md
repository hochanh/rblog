---
layout: post
title: "ISL: Chapter 5"
converted: yes
---
 
## Bài 5
 

{% highlight r %}
# Fit a logistic model
library(ISLR)
names(Default)
{% endhighlight %}



{% highlight text %}
## [1] "default" "student" "balance" "income"
{% endhighlight %}



{% highlight r %}
attach(Default)
glmout=glm(default~income+balance,data=Default,family=binomial)
summary(glmout)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## glm(formula = default ~ income + balance, family = binomial, 
##     data = Default)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -2.473  -0.144  -0.057  -0.021   3.724  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept) -1.15e+01   4.35e-01  -26.54   <2e-16 ***
## income       2.08e-05   4.99e-06    4.17    3e-05 ***
## balance      5.65e-03   2.27e-04   24.84   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 2920.6  on 9999  degrees of freedom
## Residual deviance: 1579.0  on 9997  degrees of freedom
## AIC: 1585
## 
## Number of Fisher Scoring iterations: 8
{% endhighlight %}



{% highlight r %}
glmpro=predict(glmout,type="response")
contrasts(default)
{% endhighlight %}



{% highlight text %}
##     Yes
## No    0
## Yes   1
{% endhighlight %}



{% highlight r %}
glmpre=rep("No",10000)
glmpre[glmpro>.5]="Yes"
table(glmpre,default)
{% endhighlight %}



{% highlight text %}
##       default
## glmpre   No  Yes
##    No  9629  225
##    Yes   38  108
{% endhighlight %}



{% highlight r %}
mean(glmpre==default)
{% endhighlight %}



{% highlight text %}
## [1] 0.97
{% endhighlight %}



{% highlight r %}
# Validation approach
set.seed(777)
train=sample(10000,5000)
valid.set=Default[-train,]
glmout=glm(default~income+balance,data=Default,family=binomial,subset=train)
glmpro=predict(glmout,valid.set,type="response")
glmpre=rep("No",5000)
glmpre[glmpro>.5]="Yes"
mean(glmpre==valid.set$default)
{% endhighlight %}



{% highlight text %}
## [1] 0.98
{% endhighlight %}



{% highlight r %}
# Repeat #2
set.seed(298)
train=sample(10000,5000)
valid.set=Default[-train,]
glmout=glm(default~income+balance,data=Default,family=binomial,subset=train)
glmpro=predict(glmout,valid.set,type="response")
glmpre=rep("No",5000)
glmpre[glmpro>.5]="Yes"
mean(glmpre==valid.set$default)
{% endhighlight %}



{% highlight text %}
## [1] 0.97
{% endhighlight %}



{% highlight r %}
# Repeat #3
set.seed(777298)
train=sample(10000,5000)
valid.set=Default[-train,]
glmout=glm(default~income+balance,data=Default,family=binomial,subset=train)
glmpro=predict(glmout,valid.set,type="response")
glmpre=rep("No",5000)
glmpre[glmpro>.5]="Yes"
mean(glmpre==valid.set$default)
{% endhighlight %}



{% highlight text %}
## [1] 0.97
{% endhighlight %}



{% highlight r %}
# Add dummy variable 'student'
set.seed(777)
train=sample(10000,5000)
valid.set=Default[-train,]
glmout=glm(default~income+balance+student,data=Default,family=binomial,subset=train)
contrasts(student)
{% endhighlight %}



{% highlight text %}
##     Yes
## No    0
## Yes   1
{% endhighlight %}



{% highlight r %}
glmpro=predict(glmout,valid.set,type="response")
glmpre=rep("No",5000)
glmpre[glmpro>.5]="Yes"
mean(glmpre==valid.set$default)
{% endhighlight %}



{% highlight text %}
## [1] 0.98
{% endhighlight %}
 
## Bài 6
 

{% highlight r %}
library(ISLR)
library(boot)
attach(Default)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Default (pos = 3):
## 
##     balance, default, income, student
{% endhighlight %}



{% highlight r %}
glmout=glm(default~income+balance,data=Default,family=binomial)
summary(glmout)$coef
{% endhighlight %}



{% highlight text %}
##             Estimate Std. Error z value Pr(>|z|)
## (Intercept) -1.2e+01    4.3e-01   -26.5 3.0e-155
## income       2.1e-05    5.0e-06     4.2  3.0e-05
## balance      5.6e-03    2.3e-04    24.8 3.6e-136
{% endhighlight %}



{% highlight r %}
coef(glmout)
{% endhighlight %}



{% highlight text %}
## (Intercept)      income     balance 
##    -1.2e+01     2.1e-05     5.6e-03
{% endhighlight %}



{% highlight r %}
boot.fn=function(data,index)
 return(coef(glm(default~income+balance,data=data,family=binomial,subset=index)))
set.seed(298)
# boot(Default,boot.fn,1000)
# 
# ORDINARY NONPARAMETRIC BOOTSTRAP
# 
# 
# Call:
# boot(data = Default, statistic = boot.fn, R = 1000)
# 
# 
# Bootstrap Statistics :
#          original        bias     std. error
# t1* -1.154047e+01 -2.227518e-02 4.364461e-01
# t2*  2.080898e-05  4.609849e-08 4.774216e-06
# t3*  5.647103e-03  1.223872e-05 2.299849e-04
{% endhighlight %}
 
## Bài 7
 

{% highlight r %}
library(ISLR)
attach(Weekly)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Weekly (pos = 8):
## 
##     Direction, Lag1, Lag2, Lag3, Lag4, Lag5, Today, Volume, Year
## 
## The following objects are masked from Smarket:
## 
##     Direction, Lag1, Lag2, Lag3, Lag4, Lag5, Today, Volume, Year
{% endhighlight %}



{% highlight r %}
glmout=glm(Direction~Lag1+Lag2,data=Weekly,family=binomial)
glmout1=glm(Direction~Lag1+Lag2,data=Weekly,family=binomial,subset=(2:1089))
glmpre=if(predict.glm(glmout1,Weekly[1,],type="response")>0.5) "Up" else "Down"
glmpre
{% endhighlight %}



{% highlight text %}
## [1] "Up"
{% endhighlight %}



{% highlight r %}
Weekly[i,]$Direction
{% endhighlight %}



{% highlight text %}
## [1] Down
## Levels: Down Up
{% endhighlight %}



{% highlight r %}
glmpre==as.character(Weekly[i,]$Direction)
{% endhighlight %}



{% highlight text %}
## [1] FALSE
{% endhighlight %}
 
Thực hiện lặp và dùng công thức để tính LOOCV error. Bỏ dấu # để chạy lệnh.
 

{% highlight r %}
# n=1089
# err=rep(0,n)
# for (i in 1:n) {
#   glmouti=glm(Direction~Lag1+Lag2,data=Weekly,family=binomial,subset=(1:1089)!=i)
#   glmproi=predict.glm(glmouti,Weekly[i,],type="response")
#   glmprei=if (glmproi>.5) "Up" else "Down"
#   err[i]=ifelse(glmprei==as.character(Weekly[i,]$Direction),0,1)
#   }
# mean(err)
# [1] 0.4499541
 
# library(boot)
# cost <- function(r, pi = 0) mean(abs(r-pi) > 0.5)
# cv.glm(Weekly,glmout,cost, K=1089)$delta[1]
# [1] 0.4499541
{% endhighlight %}
 
Chú ý khi gọi hàm `cv.glm()` với phân phối `binomial` của `glm()` phải có hàm cost như sau:
 
```r
cost <- function(r, pi = 0) mean(abs(r-pi) > 0.5)
```
 
## Bài 8
 

{% highlight r %}
set.seed (1)
y=rnorm(100)
x=rnorm(100)
y=x-2*x^2+rnorm(100)
plot(x,y)
{% endhighlight %}

![plot of chunk cv](../../figures/ISL-chapter-5/cv-1.png) 

{% highlight r %}
xy=data.frame(x,y)
set.seed(777)
library(boot)
glm.fit=glm(y~x,data=xy)
cv.err=cv.glm(xy,glm.fit)
cv.err$delta
{% endhighlight %}



{% highlight text %}
## [1] 5.9 5.9
{% endhighlight %}



{% highlight r %}
for (i in 1:4) {
glm.fit=glm(y~poly(x,i),data=xy)
cv.err=cv.glm(xy,glm.fit)
print(paste("delta for i =",i,": ",cv.err$delta[1]))
}
{% endhighlight %}



{% highlight text %}
## [1] "delta for i = 1 :  5.89097855988843"
## [1] "delta for i = 2 :  1.0865955642745"
## [1] "delta for i = 3 :  1.10258509387339"
## [1] "delta for i = 4 :  1.11477226814508"
{% endhighlight %}
