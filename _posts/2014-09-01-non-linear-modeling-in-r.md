---
layout: post
title: Non-linear Modeling
converted: yes
---
 
## Hồi quy đa thức và Hàm bậc thang
 

{% highlight r %}
library(ISLR)
attach(Wage)
{% endhighlight %}



{% highlight text %}
## The following object is masked from Auto (pos = 11):
## 
##     year
## 
## The following object is masked from auto01:
## 
##     year
## 
## The following object is masked from Boston (pos = 20):
## 
##     age
## 
## The following object is masked from Boston (pos = 22):
## 
##     age
## 
## The following object is masked from Auto (pos = 25):
## 
##     year
{% endhighlight %}



{% highlight r %}
fit=lm(wage~poly(age,4),data=Wage)
coef(summary(fit))
{% endhighlight %}



{% highlight text %}
##               Estimate Std. Error t value Pr(>|t|)
## (Intercept)        112       0.73   153.3  0.0e+00
## poly(age, 4)1      447      39.91    11.2  1.5e-28
## poly(age, 4)2     -478      39.91   -12.0  2.4e-32
## poly(age, 4)3      126      39.91     3.1  1.7e-03
## poly(age, 4)4      -78      39.91    -2.0  5.1e-02
{% endhighlight %}



{% highlight r %}
fit2=lm(wage~poly(age,4,raw=T),data=Wage)
coef(summary(fit2))
{% endhighlight %}



{% highlight text %}
##                        Estimate Std. Error t value Pr(>|t|)
## (Intercept)            -1.8e+02    6.0e+01    -3.1  0.00218
## poly(age, 4, raw = T)1  2.1e+01    5.9e+00     3.6  0.00031
## poly(age, 4, raw = T)2 -5.6e-01    2.1e-01    -2.7  0.00626
## poly(age, 4, raw = T)3  6.8e-03    3.1e-03     2.2  0.02640
## poly(age, 4, raw = T)4 -3.2e-05    1.6e-05    -2.0  0.05104
{% endhighlight %}



{% highlight r %}
fit2a=lm(wage~age+I(age^2)+I(age^3)+I(age^4),data=Wage)
coef(fit2a)
{% endhighlight %}



{% highlight text %}
## (Intercept)         age    I(age^2)    I(age^3)    I(age^4) 
##    -1.8e+02     2.1e+01    -5.6e-01     6.8e-03    -3.2e-05
{% endhighlight %}



{% highlight r %}
fit2b=lm(wage~cbind(age,age^2,age^3,age^4),data=Wage)
agelims=range(age)
age.grid=seq(from=agelims[1],to=agelims[2])
preds=predict(fit,newdata=list(age=age.grid),se=TRUE)
se.bands=cbind(preds$fit+2*preds$se.fit,preds$fit-2*preds$se.fit)
par(mfrow=c(1,2),mar=c(4.5,4.5,1,1),oma=c(0,0,4,0))
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Degree-4 Polynomial",outer=T)
lines(age.grid,preds$fit,lwd=2,col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)
preds2=predict(fit2,newdata=list(age=age.grid),se=TRUE)
max(abs(preds$fit-preds2$fit))
{% endhighlight %}



{% highlight text %}
## [1] 7.8e-11
{% endhighlight %}



{% highlight r %}
fit.1=lm(wage~age,data=Wage)
fit.2=lm(wage~poly(age,2),data=Wage)
fit.3=lm(wage~poly(age,3),data=Wage)
fit.4=lm(wage~poly(age,4),data=Wage)
fit.5=lm(wage~poly(age,5),data=Wage)
anova(fit.1,fit.2,fit.3,fit.4,fit.5)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Model 1: wage ~ age
## Model 2: wage ~ poly(age, 2)
## Model 3: wage ~ poly(age, 3)
## Model 4: wage ~ poly(age, 4)
## Model 5: wage ~ poly(age, 5)
##   Res.Df     RSS Df Sum of Sq      F Pr(>F)    
## 1   2998 5022216                               
## 2   2997 4793430  1    228786 143.59 <2e-16 ***
## 3   2996 4777674  1     15756   9.89 0.0017 ** 
## 4   2995 4771604  1      6070   3.81 0.0510 .  
## 5   2994 4770322  1      1283   0.80 0.3697    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
coef(summary(fit.5))
{% endhighlight %}



{% highlight text %}
##               Estimate Std. Error t value Pr(>|t|)
## (Intercept)        112       0.73   153.3  0.0e+00
## poly(age, 5)1      447      39.92    11.2  1.5e-28
## poly(age, 5)2     -478      39.92   -12.0  2.4e-32
## poly(age, 5)3      126      39.92     3.1  1.7e-03
## poly(age, 5)4      -78      39.92    -2.0  5.1e-02
## poly(age, 5)5      -36      39.92    -0.9  3.7e-01
{% endhighlight %}



{% highlight r %}
(-11.983)^2
{% endhighlight %}



{% highlight text %}
## [1] 144
{% endhighlight %}



{% highlight r %}
fit.1=lm(wage~education+age,data=Wage)
fit.2=lm(wage~education+poly(age,2),data=Wage)
fit.3=lm(wage~education+poly(age,3),data=Wage)
anova(fit.1,fit.2,fit.3)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Model 1: wage ~ education + age
## Model 2: wage ~ education + poly(age, 2)
## Model 3: wage ~ education + poly(age, 3)
##   Res.Df     RSS Df Sum of Sq      F Pr(>F)    
## 1   2994 3867992                               
## 2   2993 3725395  1    142597 114.70 <2e-16 ***
## 3   2992 3719809  1      5587   4.49  0.034 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
fit=glm(I(wage>250)~poly(age,4),data=Wage,family=binomial)
preds=predict(fit,newdata=list(age=age.grid),se=T)
pfit=exp(preds$fit)/(1+exp(preds$fit))
se.bands.logit = cbind(preds$fit+2*preds$se.fit, preds$fit-2*preds$se.fit)
se.bands = exp(se.bands.logit)/(1+exp(se.bands.logit))
preds=predict(fit,newdata=list(age=age.grid),type="response",se=T)
plot(age,I(wage>250),xlim=agelims,type="n",ylim=c(0,.2))
points(jitter(age), I((wage>250)/5),cex=.5,pch="|",col="darkgrey")
lines(age.grid,pfit,lwd=2, col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)
{% endhighlight %}

![plot of chunk Polynomial Regression and Step Functions](../../figures/non-linear-modeling-in-r/Polynomial Regression and Step Functions-1.png) 

{% highlight r %}
table(cut(age,4))
{% endhighlight %}



{% highlight text %}
## 
## (17.9,33.5]   (33.5,49]   (49,64.5] (64.5,80.1] 
##         750        1399         779          72
{% endhighlight %}



{% highlight r %}
fit=lm(wage~cut(age,4),data=Wage)
coef(summary(fit))
{% endhighlight %}



{% highlight text %}
##                        Estimate Std. Error t value Pr(>|t|)
## (Intercept)                94.2        1.5    63.8  0.0e+00
## cut(age, 4)(33.5,49]       24.1        1.8    13.1  2.0e-38
## cut(age, 4)(49,64.5]       23.7        2.1    11.4  1.0e-29
## cut(age, 4)(64.5,80.1]      7.6        5.0     1.5  1.3e-01
{% endhighlight %}
 
##  Splines
 

{% highlight r %}
library(splines)
fit=lm(wage~bs(age,knots=c(25,40,60)),data=Wage)
pred=predict(fit,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
lines(age.grid,pred$fit+2*pred$se,lty="dashed")
lines(age.grid,pred$fit-2*pred$se,lty="dashed")
dim(bs(age,knots=c(25,40,60)))
{% endhighlight %}



{% highlight text %}
## [1] 3000    6
{% endhighlight %}



{% highlight r %}
dim(bs(age,df=6))
{% endhighlight %}



{% highlight text %}
## [1] 3000    6
{% endhighlight %}



{% highlight r %}
attr(bs(age,df=6),"knots")
{% endhighlight %}



{% highlight text %}
## 25% 50% 75% 
##  34  42  51
{% endhighlight %}



{% highlight r %}
fit2=lm(wage~ns(age,df=4),data=Wage)
pred2=predict(fit2,newdata=list(age=age.grid),se=T)
lines(age.grid, pred2$fit,col="red",lwd=2)
{% endhighlight %}

![plot of chunk Splines](../../figures/non-linear-modeling-in-r/Splines-1.png) 

{% highlight r %}
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Smoothing Spline")
fit=smooth.spline(age,wage,df=16)
fit2=smooth.spline(age,wage,cv=TRUE)
{% endhighlight %}



{% highlight text %}
## Warning in smooth.spline(age, wage, cv = TRUE): cross-validation with
## non-unique 'x' values seems doubtful
{% endhighlight %}



{% highlight r %}
fit2$df
{% endhighlight %}



{% highlight text %}
## [1] 6.8
{% endhighlight %}



{% highlight r %}
lines(fit,col="red",lwd=2)
lines(fit2,col="blue",lwd=2)
legend("topright",legend=c("16 DF","6.8 DF"),col=c("red","blue"),lty=1,lwd=2,cex=.8)
{% endhighlight %}

![plot of chunk Splines](../../figures/non-linear-modeling-in-r/Splines-2.png) 

{% highlight r %}
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Local Regression")
fit=loess(wage~age,span=.2,data=Wage)
fit2=loess(wage~age,span=.5,data=Wage)
lines(age.grid,predict(fit,data.frame(age=age.grid)),col="red",lwd=2)
lines(age.grid,predict(fit2,data.frame(age=age.grid)),col="blue",lwd=2)
legend("topright",legend=c("Span=0.2","Span=0.5"),col=c("red","blue"),lty=1,lwd=2,cex=.8)
{% endhighlight %}

![plot of chunk Splines](../../figures/non-linear-modeling-in-r/Splines-3.png) 
 
## GAMs
 

{% highlight r %}
gam1=lm(wage~ns(year,4)+ns(age,5)+education,data=Wage)
library(gam)
{% endhighlight %}



{% highlight text %}
## Loaded gam 1.09.1
{% endhighlight %}



{% highlight r %}
gam.m3=gam(wage~s(year,4)+s(age,5)+education,data=Wage)
par(mfrow=c(1,3))
plot(gam.m3, se=TRUE,col="blue")
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-1.png) 

{% highlight r %}
plot.gam(gam1, se=TRUE, col="red")
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-2.png) 

{% highlight r %}
gam.m1=gam(wage~s(age,5)+education,data=Wage)
gam.m2=gam(wage~year+s(age,5)+education,data=Wage)
anova(gam.m1,gam.m2,gam.m3,test="F")
{% endhighlight %}



{% highlight text %}
## Analysis of Deviance Table
## 
## Model 1: wage ~ s(age, 5) + education
## Model 2: wage ~ year + s(age, 5) + education
## Model 3: wage ~ s(year, 4) + s(age, 5) + education
##   Resid. Df Resid. Dev Df Deviance    F  Pr(>F)    
## 1      2990    3711731                             
## 2      2989    3693842  1    17889 14.5 0.00014 ***
## 3      2986    3689770  3     4071  1.1 0.34857    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
summary(gam.m3)
{% endhighlight %}



{% highlight text %}
## 
## Call: gam(formula = wage ~ s(year, 4) + s(age, 5) + education, data = Wage)
## Deviance Residuals:
##     Min      1Q  Median      3Q     Max 
## -119.43  -19.70   -3.33   14.17  213.48 
## 
## (Dispersion Parameter for gaussian family taken to be 1236)
## 
##     Null Deviance: 5222086 on 2999 degrees of freedom
## Residual Deviance: 3689770 on 2986 degrees of freedom
## AIC: 29888 
## 
## Number of Local Scoring Iterations: 2 
## 
## Anova for Parametric Effects
##              Df  Sum Sq Mean Sq F value  Pr(>F)    
## s(year, 4)    1   27162   27162      22 2.9e-06 ***
## s(age, 5)     1  195338  195338     158 < 2e-16 ***
## education     4 1069726  267432     216 < 2e-16 ***
## Residuals  2986 3689770    1236                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Anova for Nonparametric Effects
##             Npar Df Npar F  Pr(F)    
## (Intercept)                          
## s(year, 4)        3    1.1   0.35    
## s(age, 5)         4   32.4 <2e-16 ***
## education                            
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
preds=predict(gam.m2,newdata=Wage)
gam.lo=gam(wage~s(year,df=4)+lo(age,span=0.7)+education,data=Wage)
plot.gam(gam.lo, se=TRUE, col="green")
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-3.png) 

{% highlight r %}
gam.lo.i=gam(wage~lo(year,age,span=0.5)+education,data=Wage)
library(akima)
plot(gam.lo.i)
gam.lr=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage)
par(mfrow=c(1,3))
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-4.png) 

{% highlight r %}
plot(gam.lr,se=T,col="green")
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-5.png) 

{% highlight r %}
table(education,I(wage>250))
{% endhighlight %}



{% highlight text %}
##                     
## education            FALSE TRUE
##   1. < HS Grad         268    0
##   2. HS Grad           966    5
##   3. Some College      643    7
##   4. College Grad      663   22
##   5. Advanced Degree   381   45
{% endhighlight %}



{% highlight r %}
gam.lr.s=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage,subset=(education!="1. < HS Grad"))
plot(gam.lr.s,se=T,col="green")
{% endhighlight %}

![plot of chunk GAMs](../../figures/non-linear-modeling-in-r/GAMs-6.png) 
