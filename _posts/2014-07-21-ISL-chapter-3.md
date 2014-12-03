---
layout: post
title: "ISL: Chaper 3"
converted: yes
---
 
## Bài 8
 

{% highlight r %}
# fileUrl <- "http://www-bcf.usc.edu/~gareth/ISL/Auto.csv"
# download.file(fileUrl,destfile="./ISL/Auto.csv")
auto=read.csv("./ISL/Auto.csv")
auto=na.omit(auto)
names(auto)
{% endhighlight %}



{% highlight text %}
## [1] "mpg"          "cylinders"    "displacement" "horsepower"  
## [5] "weight"       "acceleration" "year"         "origin"      
## [9] "name"
{% endhighlight %}



{% highlight r %}
auto$horsepower=as.numeric(auto$horsepower)
lmout=lm(mpg ~ horsepower,data=auto)
summary(lmout)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = mpg ~ horsepower, data = auto)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -13.351  -6.004  -0.391   4.952  22.982 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  17.8076     0.7113   25.04   <2e-16 ***
## horsepower    0.1108     0.0119    9.27   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.1 on 395 degrees of freedom
## Multiple R-squared:  0.179,	Adjusted R-squared:  0.177 
## F-statistic:   86 on 1 and 395 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
predict(lmout,data.frame(horsepower=98))
{% endhighlight %}



{% highlight text %}
##  1 
## 29
{% endhighlight %}



{% highlight r %}
predict(lmout,data.frame(horsepower=98),interval="confidence")
{% endhighlight %}



{% highlight text %}
##   fit lwr upr
## 1  29  27  30
{% endhighlight %}



{% highlight r %}
predict(lmout,data.frame(horsepower=98),interval="prediction")
{% endhighlight %}



{% highlight text %}
##   fit lwr upr
## 1  29  15  43
{% endhighlight %}



{% highlight r %}
plot(auto$horsepower,auto$mpg,col=3)
abline(lmout,lwd=3,col=2)
{% endhighlight %}

![plot of chunk mpg vs horsepower](../../figures/ISL-chapter-3/mpg vs horsepower-1.png) 

{% highlight r %}
plot(predict(lmout), residuals(lmout))
{% endhighlight %}

![plot of chunk mpg vs horsepower](../../figures/ISL-chapter-3/mpg vs horsepower-2.png) 

{% highlight r %}
plot(predict(lmout), rstudent(lmout))
{% endhighlight %}

![plot of chunk mpg vs horsepower](../../figures/ISL-chapter-3/mpg vs horsepower-3.png) 

{% highlight r %}
par(mfrow=c(2,2))
plot(lmout)
{% endhighlight %}

![plot of chunk mpg vs horsepower](../../figures/ISL-chapter-3/mpg vs horsepower-4.png) 
 
## Bài 9
 

{% highlight r %}
pairs(auto)
{% endhighlight %}

![plot of chunk mul](../../figures/ISL-chapter-3/mul-1.png) 

{% highlight r %}
str(auto)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	397 obs. of  9 variables:
##  $ mpg         : num  18 15 18 16 17 15 14 14 14 15 ...
##  $ cylinders   : int  8 8 8 8 8 8 8 8 8 8 ...
##  $ displacement: num  307 350 318 304 302 429 454 440 455 390 ...
##  $ horsepower  : num  17 35 29 29 24 42 47 46 48 40 ...
##  $ weight      : int  3504 3693 3436 3433 3449 4341 4354 4312 4425 3850 ...
##  $ acceleration: num  12 11.5 11 12 10.5 10 9 8.5 10 8.5 ...
##  $ year        : int  70 70 70 70 70 70 70 70 70 70 ...
##  $ origin      : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ name        : Factor w/ 304 levels "amc ambassador brougham",..: 49 36 231 14 161 141 54 223 241 2 ...
{% endhighlight %}



{% highlight r %}
pairs(auto[c(1:6)])
{% endhighlight %}

![plot of chunk mul](../../figures/ISL-chapter-3/mul-2.png) 

{% highlight r %}
cor(auto[c(1:6)])
{% endhighlight %}



{% highlight text %}
##                mpg cylinders displacement horsepower weight acceleration
## mpg           1.00     -0.78        -0.80       0.42  -0.83         0.42
## cylinders    -0.78      1.00         0.95      -0.55   0.90        -0.50
## displacement -0.80      0.95         1.00      -0.48   0.93        -0.54
## horsepower    0.42     -0.55        -0.48       1.00  -0.48         0.27
## weight       -0.83      0.90         0.93      -0.48   1.00        -0.42
## acceleration  0.42     -0.50        -0.54       0.27  -0.42         1.00
{% endhighlight %}



{% highlight r %}
lmout2=lm(mpg~.-name,data=auto)
summary(lmout2)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = mpg ~ . - name, data = auto)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -9.629 -2.034 -0.046  1.801 13.010 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -21.28440    4.25878   -5.00  8.8e-07 ***
## cylinders     -0.29265    0.33819   -0.87    0.387    
## displacement   0.01603    0.00728    2.20    0.028 *  
## horsepower     0.00794    0.00681    1.17    0.244    
## weight        -0.00687    0.00058  -11.85  < 2e-16 ***
## acceleration   0.15391    0.07750    1.99    0.048 *  
## year           0.77344    0.04939   15.66  < 2e-16 ***
## origin         1.34644    0.26907    5.00  8.5e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.3 on 389 degrees of freedom
## Multiple R-squared:  0.822,	Adjusted R-squared:  0.819 
## F-statistic:  257 on 7 and 389 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
par(mfrow=c(2,2))
plot(lmout2)
{% endhighlight %}

![plot of chunk mul](../../figures/ISL-chapter-3/mul-3.png) 
 
## Bài 10
 

{% highlight r %}
library(ISLR)
names(Carseats)
{% endhighlight %}



{% highlight text %}
##  [1] "Sales"       "CompPrice"   "Income"      "Advertising" "Population" 
##  [6] "Price"       "ShelveLoc"   "Age"         "Education"   "Urban"      
## [11] "US"
{% endhighlight %}



{% highlight r %}
attach(Carseats)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Carseats (pos = 3):
## 
##     Advertising, Age, CompPrice, Education, Income, Population,
##     Price, Sales, ShelveLoc, Urban, US
{% endhighlight %}



{% highlight r %}
lmsales=lm(Sales~Price+Urban+US)
summary(lmsales)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = Sales ~ Price + Urban + US)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -6.921 -1.622 -0.056  1.579  7.058 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.04347    0.65101   20.04  < 2e-16 ***
## Price       -0.05446    0.00524  -10.39  < 2e-16 ***
## UrbanYes    -0.02192    0.27165   -0.08     0.94    
## USYes        1.20057    0.25904    4.63  4.9e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.5 on 396 degrees of freedom
## Multiple R-squared:  0.239,	Adjusted R-squared:  0.234 
## F-statistic: 41.5 on 3 and 396 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
contrasts(Urban)
{% endhighlight %}



{% highlight text %}
##     Yes
## No    0
## Yes   1
{% endhighlight %}



{% highlight r %}
summary(lm(Sales~Urban))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = Sales ~ Urban)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -7.564 -2.111 -0.011  1.791  8.802 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   7.5636     0.2603   29.06   <2e-16 ***
## UrbanYes     -0.0954     0.3100   -0.31     0.76    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.8 on 398 degrees of freedom
## Multiple R-squared:  0.000238,	Adjusted R-squared:  -0.00227 
## F-statistic: 0.0947 on 1 and 398 DF,  p-value: 0.759
{% endhighlight %}



{% highlight r %}
lmsales2=lm(Sales~Price+US)
summary(lmsales2)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = Sales ~ Price + US)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -6.927 -1.629 -0.057  1.577  7.052 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.03079    0.63098   20.65  < 2e-16 ***
## Price       -0.05448    0.00523  -10.42  < 2e-16 ***
## USYes        1.19964    0.25846    4.64  4.7e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.5 on 397 degrees of freedom
## Multiple R-squared:  0.239,	Adjusted R-squared:  0.235 
## F-statistic: 62.4 on 2 and 397 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
coef(summary(lmsales2))
{% endhighlight %}



{% highlight text %}
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)   13.031     0.6310    20.7  7.0e-65
## Price         -0.054     0.0052   -10.4  1.3e-22
## USYes          1.200     0.2585     4.6  4.7e-06
{% endhighlight %}
 
## Bài 11
 

{% highlight r %}
set.seed(1)
x=rnorm(100)
y=2*x+rnorm(100)
lmyx=lm(y~x-1)
# or lmxy=lm(y~x+0)
summary(lmyx)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x - 1)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -1.915 -0.647 -0.177  0.506  2.311 
## 
## Coefficients:
##   Estimate Std. Error t value Pr(>|t|)    
## x    1.994      0.106    18.7   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.96 on 99 degrees of freedom
## Multiple R-squared:  0.78,	Adjusted R-squared:  0.778 
## F-statistic:  351 on 1 and 99 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
lmxy=lm(x~y-1)
summary(lmxy)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = x ~ y - 1)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -0.870 -0.237  0.103  0.286  0.894 
## 
## Coefficients:
##   Estimate Std. Error t value Pr(>|t|)    
## y   0.3911     0.0209    18.7   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.42 on 99 degrees of freedom
## Multiple R-squared:  0.78,	Adjusted R-squared:  0.778 
## F-statistic:  351 on 1 and 99 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
summary(lm(x~y))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = x ~ y)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -0.9085 -0.2810  0.0627  0.2457  0.8574 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   0.0388     0.0427    0.91     0.37    
## y             0.3894     0.0210   18.56   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.42 on 98 degrees of freedom
## Multiple R-squared:  0.778,	Adjusted R-squared:  0.776 
## F-statistic:  344 on 1 and 98 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
summary(lm(y~x))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -1.877 -0.614 -0.140  0.539  2.346 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.0377     0.0970   -0.39      0.7    
## x             1.9989     0.1077   18.56   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.96 on 98 degrees of freedom
## Multiple R-squared:  0.778,	Adjusted R-squared:  0.776 
## F-statistic:  344 on 1 and 98 DF,  p-value: <2e-16
{% endhighlight %}
 
## Bài 13
 

{% highlight r %}
set.seed(28)
x=rnorm(100)
eps=rnorm(100,sd=0.25)
y=-1+0.5*x+eps
lm13=lm(y~x)
summary(lm13)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -0.6328 -0.1530  0.0172  0.1745  0.5443 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -1.0563     0.0261   -40.5   <2e-16 ***
## x             0.4644     0.0259    17.9   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.26 on 98 degrees of freedom
## Multiple R-squared:  0.766,	Adjusted R-squared:  0.764 
## F-statistic:  321 on 1 and 98 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
plot(x,y)
abline(lm13,col=2,lwd=2)
abline(-1,0.5,col=3,lwd=2)
legend(-2.5,0.3,c("Least square lines","Population regression line"),col=c(2,3),lwd=2)
{% endhighlight %}

![plot of chunk noise](../../figures/ISL-chapter-3/noise-1.png) 

{% highlight r %}
lmx2=lm(y~x+I(x^2))
anova(lmx2,lm13)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Model 1: y ~ x + I(x^2)
## Model 2: y ~ x
##   Res.Df  RSS Df Sum of Sq    F Pr(>F)
## 1     97 6.65                         
## 2     98 6.66 -1  -0.00114 0.02    0.9
{% endhighlight %}
 
## Bài 14
 

{% highlight r %}
set.seed(1)
x1=runif(100)
x2=0.5*x1+rnorm(100)/10
y=2+2*x1+0.3*x2+rnorm(100)
cor(x1,x2)
{% endhighlight %}



{% highlight text %}
## [1] 0.84
{% endhighlight %}



{% highlight r %}
pairs(data.frame(x1,x2,y),col=2)
{% endhighlight %}

![plot of chunk collinearity](../../figures/ISL-chapter-3/collinearity-1.png) 

{% highlight r %}
summary(lm(y~x1+x2))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x1 + x2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.8311 -0.7273 -0.0537  0.6338  2.3359 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.130      0.232    9.19  7.6e-15 ***
## x1             1.440      0.721    2.00    0.049 *  
## x2             1.010      1.134    0.89    0.375    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 97 degrees of freedom
## Multiple R-squared:  0.209,	Adjusted R-squared:  0.193 
## F-statistic: 12.8 on 2 and 97 DF,  p-value: 1.16e-05
{% endhighlight %}



{% highlight r %}
summary(lm(y~x1))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.8950 -0.6687 -0.0779  0.5922  2.4556 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.112      0.231    9.15  8.3e-15 ***
## x1             1.976      0.396    4.99  2.7e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 98 degrees of freedom
## Multiple R-squared:  0.202,	Adjusted R-squared:  0.194 
## F-statistic: 24.9 on 1 and 98 DF,  p-value: 2.66e-06
{% endhighlight %}



{% highlight r %}
summary(lm(y~x2))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x2)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -2.627 -0.752 -0.036  0.724  2.449 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.390      0.195   12.26  < 2e-16 ***
## x2             2.900      0.633    4.58  1.4e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 98 degrees of freedom
## Multiple R-squared:  0.176,	Adjusted R-squared:  0.168 
## F-statistic:   21 on 1 and 98 DF,  p-value: 1.37e-05
{% endhighlight %}



{% highlight r %}
x1=c(x1,0.1)
x2=c(x2,0.8)
y=c(y,6)
summary(lm(y~x1+x2))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x1 + x2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.7335 -0.6932 -0.0526  0.6638  2.3062 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.227      0.231    9.62  7.9e-16 ***
## x1             0.539      0.592    0.91   0.3646    
## x2             2.515      0.898    2.80   0.0061 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 98 degrees of freedom
## Multiple R-squared:  0.219,	Adjusted R-squared:  0.203 
## F-statistic: 13.7 on 2 and 98 DF,  p-value: 5.56e-06
{% endhighlight %}



{% highlight r %}
summary(lm(y~x1))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x1)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -2.890 -0.656 -0.091  0.568  3.567 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.257      0.239    9.44  1.8e-15 ***
## x1             1.766      0.412    4.28  4.3e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 99 degrees of freedom
## Multiple R-squared:  0.156,	Adjusted R-squared:  0.148 
## F-statistic: 18.3 on 1 and 99 DF,  p-value: 4.29e-05
{% endhighlight %}



{% highlight r %}
summary(lm(y~x2))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x2)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -2.647 -0.710 -0.069  0.727  2.381 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.345      0.191   12.26  < 2e-16 ***
## x2             3.119      0.604    5.16  1.3e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.1 on 99 degrees of freedom
## Multiple R-squared:  0.212,	Adjusted R-squared:  0.204 
## F-statistic: 26.7 on 1 and 99 DF,  p-value: 1.25e-06
{% endhighlight %}



{% highlight r %}
par(mfrow=c(2,2))
plot(lm(y~x1+x2))
{% endhighlight %}

![plot of chunk collinearity](../../figures/ISL-chapter-3/collinearity-2.png) 

{% highlight r %}
plot(lm(y~x1))
{% endhighlight %}

![plot of chunk collinearity](../../figures/ISL-chapter-3/collinearity-3.png) 

{% highlight r %}
plot(lm(y~x2))
{% endhighlight %}

![plot of chunk collinearity](../../figures/ISL-chapter-3/collinearity-4.png) 
