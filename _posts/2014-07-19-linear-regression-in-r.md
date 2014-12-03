---
layout: post
title: Linear Regression in R
converted: yes
---
 
Hồi quy tuyến tính trên R
 

{% highlight r %}
library(MASS)
library(ISLR)
{% endhighlight %}
 
## Hồi quy tuyến tính giản đơn

{% highlight r %}
names(Boston)
{% endhighlight %}



{% highlight text %}
##  [1] "crim"    "zn"      "indus"   "chas"    "nox"     "rm"      "age"    
##  [8] "dis"     "rad"     "tax"     "ptratio" "black"   "lstat"   "medv"
{% endhighlight %}



{% highlight r %}
attach(Boston)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Boston (pos = 4):
## 
##     age, black, chas, crim, dis, indus, lstat, medv, nox, ptratio,
##     rad, rm, tax, zn
{% endhighlight %}



{% highlight r %}
lm.fit=lm(medv~lstat)
lm.fit
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ lstat)
## 
## Coefficients:
## (Intercept)        lstat  
##       34.55        -0.95
{% endhighlight %}



{% highlight r %}
summary(lm.fit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ lstat)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -15.17  -3.99  -1.32   2.03  24.50 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  34.5538     0.5626    61.4   <2e-16 ***
## lstat        -0.9500     0.0387   -24.5   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.2 on 504 degrees of freedom
## Multiple R-squared:  0.544,	Adjusted R-squared:  0.543 
## F-statistic:  602 on 1 and 504 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
names(lm.fit)
{% endhighlight %}



{% highlight text %}
##  [1] "coefficients"  "residuals"     "effects"       "rank"         
##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
##  [9] "xlevels"       "call"          "terms"         "model"
{% endhighlight %}



{% highlight r %}
coef(lm.fit)
{% endhighlight %}



{% highlight text %}
## (Intercept)       lstat 
##       34.55       -0.95
{% endhighlight %}



{% highlight r %}
confint(lm.fit)
{% endhighlight %}



{% highlight text %}
##             2.5 % 97.5 %
## (Intercept)    33  35.66
## lstat          -1  -0.87
{% endhighlight %}



{% highlight r %}
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
{% endhighlight %}



{% highlight text %}
##   fit lwr upr
## 1  30  29  31
## 2  25  24  26
## 3  20  20  21
{% endhighlight %}



{% highlight r %}
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")
{% endhighlight %}



{% highlight text %}
##   fit  lwr upr
## 1  30 17.6  42
## 2  25 12.8  37
## 3  20  8.1  33
{% endhighlight %}



{% highlight r %}
plot(lstat,medv)
abline(lm.fit)
abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-1.png) 

{% highlight r %}
plot(lstat,medv,col="red")
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-2.png) 

{% highlight r %}
plot(lstat,medv,pch=20)
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-3.png) 

{% highlight r %}
plot(lstat,medv,pch="+")
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-4.png) 

{% highlight r %}
plot(1:20,1:20,pch=1:20)
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-5.png) 

{% highlight r %}
par(mfrow=c(2,2))
plot(lm.fit)
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-6.png) 

{% highlight r %}
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))
{% endhighlight %}



{% highlight text %}
## 375 
## 375
{% endhighlight %}

![plot of chunk simple linear regression](../../figures/linear-regression-in-r/simple linear regression-7.png) 
 
## Hồi quy tuyến tính nhiều biến
 

{% highlight r %}
lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ lstat + age, data = Boston)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -15.98  -3.98  -1.28   1.97  23.16 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  33.2228     0.7308   45.46   <2e-16 ***
## lstat        -1.0321     0.0482  -21.42   <2e-16 ***
## age           0.0345     0.0122    2.83   0.0049 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.2 on 503 degrees of freedom
## Multiple R-squared:  0.551,	Adjusted R-squared:  0.549 
## F-statistic:  309 on 2 and 503 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
lm.fit=lm(medv~.,data=Boston)
summary(lm.fit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ ., data = Boston)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -15.594  -2.730  -0.518   1.777  26.199 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  3.65e+01   5.10e+00    7.14  3.3e-12 ***
## crim        -1.08e-01   3.29e-02   -3.29  0.00109 ** 
## zn           4.64e-02   1.37e-02    3.38  0.00078 ***
## indus        2.06e-02   6.15e-02    0.33  0.73829    
## chas         2.69e+00   8.62e-01    3.12  0.00193 ** 
## nox         -1.78e+01   3.82e+00   -4.65  4.2e-06 ***
## rm           3.81e+00   4.18e-01    9.12  < 2e-16 ***
## age          6.92e-04   1.32e-02    0.05  0.95823    
## dis         -1.48e+00   1.99e-01   -7.40  6.0e-13 ***
## rad          3.06e-01   6.63e-02    4.61  5.1e-06 ***
## tax         -1.23e-02   3.76e-03   -3.28  0.00111 ** 
## ptratio     -9.53e-01   1.31e-01   -7.28  1.3e-12 ***
## black        9.31e-03   2.69e-03    3.47  0.00057 ***
## lstat       -5.25e-01   5.07e-02  -10.35  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.8 on 492 degrees of freedom
## Multiple R-squared:  0.741,	Adjusted R-squared:  0.734 
## F-statistic:  108 on 13 and 492 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
?summary.lm
summary(lm.fit)$r.sq
{% endhighlight %}



{% highlight text %}
## [1] 0.74
{% endhighlight %}



{% highlight r %}
summary(lm.fit)$sigma
{% endhighlight %}



{% highlight text %}
## [1] 4.7
{% endhighlight %}
 

{% highlight r %}
# install.packages("car")
library(car)
vif(lm.fit)
{% endhighlight %}



{% highlight text %}
##    crim      zn   indus    chas     nox      rm     age     dis     rad 
##     1.8     2.3     4.0     1.1     4.4     1.9     3.1     4.0     7.5 
##     tax ptratio   black   lstat 
##     9.0     1.8     1.3     2.9
{% endhighlight %}



{% highlight r %}
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ . - age, data = Boston)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -15.605  -2.731  -0.519   1.760  26.224 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  36.43693    5.08012    7.17  2.7e-12 ***
## crim         -0.10801    0.03283   -3.29  0.00107 ** 
## zn            0.04633    0.01361    3.40  0.00072 ***
## indus         0.02056    0.06143    0.33  0.73799    
## chas          2.68903    0.85960    3.13  0.00186 ** 
## nox         -17.71354    3.67931   -4.81  2.0e-06 ***
## rm            3.81439    0.40848    9.34  < 2e-16 ***
## dis          -1.47861    0.19061   -7.76  5.0e-14 ***
## rad           0.30579    0.06609    4.63  4.8e-06 ***
## tax          -0.01233    0.00376   -3.28  0.00110 ** 
## ptratio      -0.95221    0.13029   -7.31  1.1e-12 ***
## black         0.00932    0.00268    3.48  0.00054 ***
## lstat        -0.52385    0.04763  -11.00  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.7 on 493 degrees of freedom
## Multiple R-squared:  0.741,	Adjusted R-squared:  0.734 
## F-statistic:  117 on 12 and 493 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
# lm.fit1=update(lm.fit, ~.-age)
{% endhighlight %}
 
## Tương tác giữa các biến
 

{% highlight r %}
summary(lm(medv~lstat*age,data=Boston))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ lstat * age, data = Boston)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -15.81  -4.04  -1.33   2.08  27.55 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 36.088536   1.469835   24.55  < 2e-16 ***
## lstat       -1.392117   0.167456   -8.31  8.8e-16 ***
## age         -0.000721   0.019879   -0.04    0.971    
## lstat:age    0.004156   0.001852    2.24    0.025 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.2 on 502 degrees of freedom
## Multiple R-squared:  0.556,	Adjusted R-squared:  0.553 
## F-statistic:  209 on 3 and 502 DF,  p-value: <2e-16
{% endhighlight %}
 
## Chuyển đổi phi tuyến các biến dự báo
 

{% highlight r %}
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ lstat + I(lstat^2))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -15.28  -3.83  -0.53   2.31  25.41 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 42.86201    0.87208    49.1   <2e-16 ***
## lstat       -2.33282    0.12380   -18.8   <2e-16 ***
## I(lstat^2)   0.04355    0.00375    11.6   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.5 on 503 degrees of freedom
## Multiple R-squared:  0.641,	Adjusted R-squared:  0.639 
## F-statistic:  449 on 2 and 503 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
lm.fit=lm(medv~lstat)
anova(lm.fit,lm.fit2)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Model 1: medv ~ lstat
## Model 2: medv ~ lstat + I(lstat^2)
##   Res.Df   RSS Df Sum of Sq   F Pr(>F)    
## 1    504 19472                            
## 2    503 15347  1      4125 135 <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
par(mfrow=c(2,2))
plot(lm.fit2)
{% endhighlight %}

![plot of chunk Non-linear Transformations of the Predictors](../../figures/linear-regression-in-r/Non-linear Transformations of the Predictors-1.png) 

{% highlight r %}
lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ poly(lstat, 5))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -13.543  -3.104  -0.705   2.084  27.115 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)       22.533      0.232   97.20  < 2e-16 ***
## poly(lstat, 5)1 -152.460      5.215  -29.24  < 2e-16 ***
## poly(lstat, 5)2   64.227      5.215   12.32  < 2e-16 ***
## poly(lstat, 5)3  -27.051      5.215   -5.19  3.1e-07 ***
## poly(lstat, 5)4   25.452      5.215    4.88  1.4e-06 ***
## poly(lstat, 5)5  -19.252      5.215   -3.69  0.00025 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.2 on 500 degrees of freedom
## Multiple R-squared:  0.682,	Adjusted R-squared:  0.679 
## F-statistic:  214 on 5 and 500 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
summary(lm(medv~log(rm),data=Boston))
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = medv ~ log(rm), data = Boston)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -19.49  -2.87  -0.10   2.84  39.82 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   -76.49       5.03   -15.2   <2e-16 ***
## log(rm)        54.05       2.74    19.7   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.9 on 504 degrees of freedom
## Multiple R-squared:  0.436,	Adjusted R-squared:  0.435 
## F-statistic:  389 on 1 and 504 DF,  p-value: <2e-16
{% endhighlight %}
 
## Các biến dự báo định tính

{% highlight r %}
# fix(Carseats)
names(Carseats)
{% endhighlight %}



{% highlight text %}
##  [1] "Sales"       "CompPrice"   "Income"      "Advertising" "Population" 
##  [6] "Price"       "ShelveLoc"   "Age"         "Education"   "Urban"      
## [11] "US"
{% endhighlight %}



{% highlight r %}
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -2.921 -0.750  0.018  0.675  3.341 
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         6.575565   1.008747    6.52  2.2e-10 ***
## CompPrice           0.092937   0.004118   22.57  < 2e-16 ***
## Income              0.010894   0.002604    4.18  3.6e-05 ***
## Advertising         0.070246   0.022609    3.11  0.00203 ** 
## Population          0.000159   0.000368    0.43  0.66533    
## Price              -0.100806   0.007440  -13.55  < 2e-16 ***
## ShelveLocGood       4.848676   0.152838   31.72  < 2e-16 ***
## ShelveLocMedium     1.953262   0.125768   15.53  < 2e-16 ***
## Age                -0.057947   0.015951   -3.63  0.00032 ***
## Education          -0.020852   0.019613   -1.06  0.28836    
## UrbanYes            0.140160   0.112402    1.25  0.21317    
## USYes              -0.157557   0.148923   -1.06  0.29073    
## Income:Advertising  0.000751   0.000278    2.70  0.00729 ** 
## Price:Age           0.000107   0.000133    0.80  0.42381    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1 on 386 degrees of freedom
## Multiple R-squared:  0.876,	Adjusted R-squared:  0.872 
## F-statistic:  210 on 13 and 386 DF,  p-value: <2e-16
{% endhighlight %}



{% highlight r %}
attach(Carseats)
contrasts(ShelveLoc)
{% endhighlight %}



{% highlight text %}
##        Good Medium
## Bad       0      0
## Good      1      0
## Medium    0      1
{% endhighlight %}
 
