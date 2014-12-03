---
layout: post
title: "ISL: Chapter 6"
converted: yes
---
 
## Bài 8
 

{% highlight r %}
set.seed(123)
x=rnorm(100,mean=10)
set.seed(124)
ep=rnorm(100)
 
y=1+2*x+3*x^2+4*x^3+ep
 
plot(x,y)
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-1.png) 

{% highlight r %}
xy=data.frame(x,y)
library(leaps)
reg.full=regsubsets(y~poly(x,10),data=xy,nvmax=10)
reg.sum=summary(reg.full)
 
par(mfrow=c(2,2))
par(mar=rep(4,4))
 
plot(reg.sum$rss,xlab="Number of Variables",ylab="RSS",type="l")
 
plot(reg.sum$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
m=which.max(reg.sum$adjr2)
points(m,reg.sum$adjr2[m], col="red",cex=2,pch=20)
 
plot(reg.sum$cp,xlab="Number of Variables",ylab="Cp",type='l')
m=which.min(reg.sum$cp)
points(m,reg.sum$cp[m], col="red",cex=2,pch=20)
 
plot(reg.sum$bic,xlab="Number of Variables",ylab="BIC",type='l')
m=which.min(reg.sum$bic)
points(m,reg.sum$bic[m], col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-2.png) 

{% highlight r %}
par(mfrow=c(1,1))
plot(reg.full,scale="r2")
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-3.png) 

{% highlight r %}
plot(reg.full,scale="adjr2")
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-4.png) 

{% highlight r %}
plot(reg.full,scale="Cp")
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-5.png) 

{% highlight r %}
plot(reg.full,scale="bic")
{% endhighlight %}

![plot of chunk SubsetSelection](../../figures/ISL-chapter-6/SubsetSelection-6.png) 

{% highlight r %}
coef(reg.full,3)
{% endhighlight %}



{% highlight text %}
##  (Intercept) poly(x, 10)1 poly(x, 10)2 poly(x, 10)3 
##         4539        11813         1380           60
{% endhighlight %}



{% highlight r %}
# Code lines below are wrong in term of using here
# but the syntax is correct,
# so I keep it here for latter uses.
 
# z=sapply(x,function(z) coef(reg.full,3)*c(1,z,z^2,z^3))
# plot(x,apply(z,2,sum),col="red")
# lines(x,y,col="green")
{% endhighlight %}
 
 

{% highlight r %}
reg.fwd=regsubsets(y~poly(x,10),data=xy,nvmax=10,method="forward")
reg.sum=summary(reg.fwd)
 
par(mfrow=c(2,2))
par(mar=rep(4,4))
 
plot(reg.sum$rss,xlab="Number of Variables",ylab="RSS",type="l")
 
plot(reg.sum$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
m=which.max(reg.sum$adjr2)
points(m,reg.sum$adjr2[m], col="red",cex=2,pch=20)
 
plot(reg.sum$cp,xlab="Number of Variables",ylab="Cp",type='l')
m=which.min(reg.sum$cp)
points(m,reg.sum$cp[m], col="red",cex=2,pch=20)
 
plot(reg.sum$bic,xlab="Number of Variables",ylab="BIC",type='l')
m=which.min(reg.sum$bic)
points(m,reg.sum$bic[m], col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk ForwardSelection](../../figures/ISL-chapter-6/ForwardSelection-1.png) 

{% highlight r %}
coef(reg.fwd,3)
{% endhighlight %}



{% highlight text %}
##  (Intercept) poly(x, 10)1 poly(x, 10)2 poly(x, 10)3 
##         4539        11813         1380           60
{% endhighlight %}
 

{% highlight r %}
reg.bwd=regsubsets(y~poly(x,10),data=xy,nvmax=10,method="backward")
reg.sum=summary(reg.bwd)
 
plot(reg.sum$rss,xlab="Number of Variables",ylab="RSS",type="l")
{% endhighlight %}

![plot of chunk BackwardSelection](../../figures/ISL-chapter-6/BackwardSelection-1.png) 

{% highlight r %}
plot(reg.sum$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
m=which.max(reg.sum$adjr2)
points(m,reg.sum$adjr2[m], col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk BackwardSelection](../../figures/ISL-chapter-6/BackwardSelection-2.png) 

{% highlight r %}
plot(reg.sum$cp,xlab="Number of Variables",ylab="Cp",type='l')
m=which.min(reg.sum$cp)
points(m,reg.sum$cp[m], col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk BackwardSelection](../../figures/ISL-chapter-6/BackwardSelection-3.png) 

{% highlight r %}
plot(reg.sum$bic,xlab="Number of Variables",ylab="BIC",type='l')
m=which.min(reg.sum$bic)
points(m,reg.sum$bic[m], col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk BackwardSelection](../../figures/ISL-chapter-6/BackwardSelection-4.png) 

{% highlight r %}
coef(reg.bwd,3)
{% endhighlight %}



{% highlight text %}
##  (Intercept) poly(x, 10)1 poly(x, 10)2 poly(x, 10)3 
##         4539        11813         1380           60
{% endhighlight %}
 

{% highlight r %}
library(glmnet)
set.seed(123)
train=sample(c(TRUE,FALSE), 100, replace=T)
test=!train
 
xm=model.matrix(y~poly(x,10))[,-1]
y.test=y[test]
 
grid=10^seq(10,-2,length=100)
 
# RIDGE for compare
ridge.mod=glmnet(xm[train,],y[train],alpha=0,lambda=grid, thresh=1e-13)
# lambda=1 MSE (arbitrarily lamda)
ridge.pred=predict(ridge.mod,s=1,newx=xm[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 141136
{% endhighlight %}



{% highlight r %}
# C-V ridge MSE
set.seed(123)
cv.out=cv.glmnet(xm[train,],y[train],alpha=0)
bestlam=cv.out$lambda.min
ridge.pred=predict(ridge.mod,s=bestlam,newx=xm[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 2e+05
{% endhighlight %}



{% highlight r %}
# vs. lm() function
# What's wrong here?
lm(y~xm,subset=train)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ xm, subset = train)
## 
## Coefficients:
##     (Intercept)   xmpoly(x, 10)1   xmpoly(x, 10)2   xmpoly(x, 10)3  
##        4.54e+03         1.18e+04         1.37e+03         7.18e+01  
##  xmpoly(x, 10)4   xmpoly(x, 10)5   xmpoly(x, 10)6   xmpoly(x, 10)7  
##       -1.07e+01         7.85e+00        -7.38e+00         3.88e+00  
##  xmpoly(x, 10)8   xmpoly(x, 10)9  xmpoly(x, 10)10  
##       -2.31e+00         7.05e-01        -5.16e-02
{% endhighlight %}



{% highlight r %}
predict(ridge.mod,s=0,exact=T,type="coefficients")[1:11,]
{% endhighlight %}



{% highlight text %}
## Error in drop(y): error in evaluating the argument 'x' in selecting a method for function 'drop': Error: object 'y' not found
{% endhighlight %}



{% highlight r %}
# linear again
ridge.pred=predict(ridge.mod,s=0,newx=xm[test,],exact=T)
{% endhighlight %}



{% highlight text %}
## Error in drop(y): error in evaluating the argument 'x' in selecting a method for function 'drop': Error: object 'y' not found
{% endhighlight %}



{% highlight r %}
summary(ridge.pred)
{% endhighlight %}



{% highlight text %}
##        1       
##  Min.   :2629  
##  1st Qu.:3805  
##  Median :4484  
##  Mean   :4509  
##  3rd Qu.:5004  
##  Max.   :7353
{% endhighlight %}



{% highlight r %}
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 2e+05
{% endhighlight %}



{% highlight r %}
# LASSO
lasso.mod=glmnet(xm[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
{% endhighlight %}

![plot of chunk TheLasso](../../figures/ISL-chapter-6/TheLasso-1.png) 

{% highlight r %}
# C-V lasso MSE
set.seed(123)
cv.out=cv.glmnet(xm[train,],y[train],alpha=1)
plot(cv.out)
{% endhighlight %}

![plot of chunk TheLasso](../../figures/ISL-chapter-6/TheLasso-2.png) 

{% highlight r %}
bestlam=cv.out$lambda.min
lasso.pred=predict(lasso.mod,s=bestlam,newx=xm[test,])
mean((lasso.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 994
{% endhighlight %}



{% highlight r %}
out=glmnet(xm,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:11,]
lasso.coef
{% endhighlight %}



{% highlight text %}
##   (Intercept)  poly(x, 10)1  poly(x, 10)2  poly(x, 10)3  poly(x, 10)4 
##          4539         11512          1079             0             0 
##  poly(x, 10)5  poly(x, 10)6  poly(x, 10)7  poly(x, 10)8  poly(x, 10)9 
##             0             0             0             0             0 
## poly(x, 10)10 
##             0
{% endhighlight %}



{% highlight r %}
lasso.coef[lasso.coef!=0]
{% endhighlight %}



{% highlight text %}
##  (Intercept) poly(x, 10)1 poly(x, 10)2 
##         4539        11512         1079
{% endhighlight %}
 
 
## Bài 9
 

{% highlight r %}
college=read.csv("./ISL/College.csv")
 
# Extremely notice for row name of data
rownames(college)=college[,1]
college=college[,-1]
 
set.seed(234)
train=sample(c(TRUE,FALSE),nrow(college),replace=TRUE)
test=!train
x=model.matrix(Apps~.,data=college)[,-1]
y=college$Apps
y.test=y[test]
 
# Linear regression
reg.lm=lm(Apps~.,data=college,subset=train)
pred.lm=predict(reg.lm,college[test,])
mean((pred.lm-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 957560
{% endhighlight %}



{% highlight r %}
# Ridge regression
library(glmnet)
grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x[train,],y[train],alpha=0,lambda=grid, thresh=1e-12)
set.seed(123)
cv.out=cv.glmnet(x[train,],y[train],alpha=0)
bestlam=cv.out$lambda.min
ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 9e+05
{% endhighlight %}



{% highlight r %}
out=glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:17,]
{% endhighlight %}



{% highlight text %}
## (Intercept)  PrivateYes      Accept      Enroll   Top10perc   Top25perc 
##    -1.5e+03    -5.3e+02     9.8e-01     4.7e-01     2.5e+01     1.0e+00 
## F.Undergrad P.Undergrad    Outstate  Room.Board       Books    Personal 
##     7.7e-02     2.4e-02    -2.1e-02     2.0e-01     1.4e-01    -9.0e-03 
##         PhD    Terminal   S.F.Ratio perc.alumni      Expend 
##    -3.8e+00    -4.7e+00     1.3e+01    -8.8e+00     7.5e-02
{% endhighlight %}



{% highlight r %}
# Lasso model
lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
{% endhighlight %}

![plot of chunk Collge](../../figures/ISL-chapter-6/Collge-1.png) 

{% highlight r %}
set.seed(456)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
{% endhighlight %}

![plot of chunk Collge](../../figures/ISL-chapter-6/Collge-2.png) 

{% highlight r %}
bestlam=cv.out$lambda.min
lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 950941
{% endhighlight %}



{% highlight r %}
out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:17,]
lasso.coef
{% endhighlight %}



{% highlight text %}
## (Intercept)  PrivateYes      Accept      Enroll   Top10perc   Top25perc 
##    -471.885    -491.011       1.569      -0.751      47.983     -12.735 
## F.Undergrad P.Undergrad    Outstate  Room.Board       Books    Personal 
##       0.041       0.044      -0.083       0.149       0.015       0.029 
##         PhD    Terminal   S.F.Ratio perc.alumni      Expend 
##      -8.379      -3.253      14.450      -0.052       0.077
{% endhighlight %}



{% highlight r %}
lasso.coef[lasso.coef!=0]
{% endhighlight %}



{% highlight text %}
## (Intercept)  PrivateYes      Accept      Enroll   Top10perc   Top25perc 
##    -471.885    -491.011       1.569      -0.751      47.983     -12.735 
## F.Undergrad P.Undergrad    Outstate  Room.Board       Books    Personal 
##       0.041       0.044      -0.083       0.149       0.015       0.029 
##         PhD    Terminal   S.F.Ratio perc.alumni      Expend 
##      -8.379      -3.253      14.450      -0.052       0.077
{% endhighlight %}



{% highlight r %}
# PCR model
library(pls)
set.seed(789)
pcr.fit=pcr(Apps~., data=College,subset=train,scale=TRUE,validation="CV")
validationplot(pcr.fit,val.type="MSEP")
{% endhighlight %}

![plot of chunk Collge](../../figures/ISL-chapter-6/Collge-3.png) 

{% highlight r %}
pcr.pred=predict(pcr.fit,x[test,],ncomp=5)
mean((pcr.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 2197160
{% endhighlight %}



{% highlight r %}
pcr.fit=pcr(y~x,scale=TRUE,ncomp=5)
summary(pcr.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 777 17 
## 	Y dimension: 777 1
## Fit method: svdpc
## Number of components considered: 5
## TRAINING: % variance explained
##    1 comps  2 comps  3 comps  4 comps  5 comps
## X   31.670    57.30    64.30    69.90    75.39
## y    2.316    73.06    73.07    82.08    84.08
{% endhighlight %}



{% highlight r %}
# PLS model
set.seed(101112)
pls.fit=plsr(Apps~.,data=College,subset=train,scale=TRUE,validation="CV")
summary(pls.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 385 17 
## 	Y dimension: 385 1
## Fit method: kernelpls
## Number of components considered: 17
## 
## VALIDATION: RMSEP
## Cross-validated using 10 random segments.
##        (Intercept)  1 comps  2 comps  3 comps  4 comps  5 comps  6 comps
## CV            4263     2216     1826     1767     1663     1480     1350
## adjCV         4263     2208     1811     1759     1638     1455     1336
##        7 comps  8 comps  9 comps  10 comps  11 comps  12 comps  13 comps
## CV        1319     1311     1317      1322      1325      1327      1326
## adjCV     1308     1300     1305      1310      1313      1314      1314
##        14 comps  15 comps  16 comps  17 comps
## CV         1326      1325      1325      1325
## adjCV      1314      1313      1313      1313
## 
## TRAINING: % variance explained
##       1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps
## X       25.60    34.60    63.20    66.60    70.13    74.39    78.71
## Apps    75.49    84.93    86.42    90.32    92.50    92.88    92.94
##       8 comps  9 comps  10 comps  11 comps  12 comps  13 comps  14 comps
## X       81.41    83.63     85.74     89.24     91.44     93.37     95.19
## Apps    93.00    93.05     93.09     93.10     93.10     93.11     93.11
##       15 comps  16 comps  17 comps
## X        96.94     98.00    100.00
## Apps     93.11     93.11     93.11
{% endhighlight %}



{% highlight r %}
validationplot(pls.fit,val.type="MSEP")
{% endhighlight %}

![plot of chunk Collge](../../figures/ISL-chapter-6/Collge-4.png) 

{% highlight r %}
pls.pred=predict(pls.fit,x[test,],ncomp=5)
mean((pls.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 1e+06
{% endhighlight %}



{% highlight r %}
pls.fit=plsr(Apps~.,data=College,scale=TRUE,ncomp=5)
summary(pls.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 777 17 
## 	Y dimension: 777 1
## Fit method: kernelpls
## Number of components considered: 5
## TRAINING: % variance explained
##       1 comps  2 comps  3 comps  4 comps  5 comps
## X       25.76    40.33    62.59    64.97    66.87
## Apps    78.01    85.14    87.67    90.73    92.63
{% endhighlight %}
 
