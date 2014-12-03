---
layout: post
title: Support Vector Machines
converted: yes
---
 
 
## Support Vector Classifier

{% highlight r %}
set.seed(1)
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
plot(x, col=(3-y))
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-1.png) 

{% highlight r %}
dat=data.frame(x=x, y=as.factor(y))
library(e1071)
svmfit=svm(y~., data=dat, kernel="linear", cost=10,scale=FALSE)
plot(svmfit, dat)
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-2.png) 

{% highlight r %}
svmfit$index
{% endhighlight %}



{% highlight text %}
## [1]  1  2  5  7 14 16 17
{% endhighlight %}



{% highlight r %}
summary(svmfit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## svm(formula = y ~ ., data = dat, kernel = "linear", cost = 10, 
##     scale = FALSE)
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  linear 
##        cost:  10 
##       gamma:  0.5 
## 
## Number of Support Vectors:  7
## 
##  ( 4 3 )
## 
## 
## Number of Classes:  2 
## 
## Levels: 
##  -1 1
{% endhighlight %}



{% highlight r %}
svmfit=svm(y~., data=dat, kernel="linear", cost=0.1,scale=FALSE)
plot(svmfit, dat)
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-3.png) 

{% highlight r %}
svmfit$index
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  7  9 10 12 13 14 15 16 17 18 20
{% endhighlight %}



{% highlight r %}
set.seed(1)
tune.out=tune(svm,y~.,data=dat,kernel="linear",ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))
summary(tune.out)
{% endhighlight %}



{% highlight text %}
## 
## Parameter tuning of 'svm':
## 
## - sampling method: 10-fold cross validation 
## 
## - best parameters:
##  cost
##   0.1
## 
## - best performance: 0.1 
## 
## - Detailed performance results:
##    cost error dispersion
## 1 1e-03  0.70       0.42
## 2 1e-02  0.70       0.42
## 3 1e-01  0.10       0.21
## 4 1e+00  0.15       0.24
## 5 5e+00  0.15       0.24
## 6 1e+01  0.15       0.24
## 7 1e+02  0.15       0.24
{% endhighlight %}



{% highlight r %}
bestmod=tune.out$best.model
summary(bestmod)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## best.tune(method = svm, train.x = y ~ ., data = dat, ranges = list(cost = c(0.001, 
##     0.01, 0.1, 1, 5, 10, 100)), kernel = "linear")
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  linear 
##        cost:  0.1 
##       gamma:  0.5 
## 
## Number of Support Vectors:  16
## 
##  ( 8 8 )
## 
## 
## Number of Classes:  2 
## 
## Levels: 
##  -1 1
{% endhighlight %}



{% highlight r %}
xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,] + 1
testdat=data.frame(x=xtest, y=as.factor(ytest))
ypred=predict(bestmod,testdat)
table(predict=ypred, truth=testdat$y)
{% endhighlight %}



{% highlight text %}
##        truth
## predict -1  1
##      -1 11  1
##      1   0  8
{% endhighlight %}



{% highlight r %}
svmfit=svm(y~., data=dat, kernel="linear", cost=.01,scale=FALSE)
ypred=predict(svmfit,testdat)
table(predict=ypred, truth=testdat$y)
{% endhighlight %}



{% highlight text %}
##        truth
## predict -1  1
##      -1 11  2
##      1   0  7
{% endhighlight %}



{% highlight r %}
x[y==1,]=x[y==1,]+0.5
plot(x, col=(y+5)/2, pch=19)
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-4.png) 

{% highlight r %}
dat=data.frame(x=x,y=as.factor(y))
svmfit=svm(y~., data=dat, kernel="linear", cost=1e5)
summary(svmfit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## svm(formula = y ~ ., data = dat, kernel = "linear", cost = 1e+05)
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  linear 
##        cost:  1e+05 
##       gamma:  0.5 
## 
## Number of Support Vectors:  3
## 
##  ( 1 2 )
## 
## 
## Number of Classes:  2 
## 
## Levels: 
##  -1 1
{% endhighlight %}



{% highlight r %}
plot(svmfit, dat)
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-5.png) 

{% highlight r %}
svmfit=svm(y~., data=dat, kernel="linear", cost=1)
summary(svmfit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## svm(formula = y ~ ., data = dat, kernel = "linear", cost = 1)
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  linear 
##        cost:  1 
##       gamma:  0.5 
## 
## Number of Support Vectors:  7
## 
##  ( 4 3 )
## 
## 
## Number of Classes:  2 
## 
## Levels: 
##  -1 1
{% endhighlight %}



{% highlight r %}
plot(svmfit,dat)
{% endhighlight %}

![plot of chunk SVC](../../figures/support-vector-machines-in-r/SVC-6.png) 
 
## Support Vector Machine

{% highlight r %}
set.seed(1)
x=matrix(rnorm(200*2), ncol=2)
x[1:100,]=x[1:100,]+2
x[101:150,]=x[101:150,]-2
y=c(rep(1,150),rep(2,50))
dat=data.frame(x=x,y=as.factor(y))
plot(x, col=y)
{% endhighlight %}

![plot of chunk SVM](../../figures/support-vector-machines-in-r/SVM-1.png) 

{% highlight r %}
train=sample(200,100)
svmfit=svm(y~., data=dat[train,], kernel="radial",  gamma=1, cost=1)
plot(svmfit, dat[train,])
{% endhighlight %}

![plot of chunk SVM](../../figures/support-vector-machines-in-r/SVM-2.png) 

{% highlight r %}
summary(svmfit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## svm(formula = y ~ ., data = dat[train, ], kernel = "radial", 
##     gamma = 1, cost = 1)
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  radial 
##        cost:  1 
##       gamma:  1 
## 
## Number of Support Vectors:  37
## 
##  ( 17 20 )
## 
## 
## Number of Classes:  2 
## 
## Levels: 
##  1 2
{% endhighlight %}



{% highlight r %}
svmfit=svm(y~., data=dat[train,], kernel="radial",gamma=1,cost=1e5)
plot(svmfit,dat[train,])
{% endhighlight %}

![plot of chunk SVM](../../figures/support-vector-machines-in-r/SVM-3.png) 

{% highlight r %}
set.seed(1)
tune.out=tune(svm, y~., data=dat[train,], kernel="radial", ranges=list(cost=c(0.1,1,10,100,1000),gamma=c(0.5,1,2,3,4)))
summary(tune.out)
{% endhighlight %}



{% highlight text %}
## 
## Parameter tuning of 'svm':
## 
## - sampling method: 10-fold cross validation 
## 
## - best parameters:
##  cost gamma
##     1     2
## 
## - best performance: 0.12 
## 
## - Detailed performance results:
##     cost gamma error dispersion
## 1  1e-01   0.5  0.27      0.116
## 2  1e+00   0.5  0.13      0.082
## 3  1e+01   0.5  0.15      0.071
## 4  1e+02   0.5  0.17      0.082
## 5  1e+03   0.5  0.21      0.099
## 6  1e-01   1.0  0.25      0.135
## 7  1e+00   1.0  0.13      0.082
## 8  1e+01   1.0  0.16      0.070
## 9  1e+02   1.0  0.20      0.094
## 10 1e+03   1.0  0.20      0.082
## 11 1e-01   2.0  0.25      0.127
## 12 1e+00   2.0  0.12      0.092
## 13 1e+01   2.0  0.17      0.095
## 14 1e+02   2.0  0.19      0.099
## 15 1e+03   2.0  0.20      0.094
## 16 1e-01   3.0  0.27      0.116
## 17 1e+00   3.0  0.13      0.095
## 18 1e+01   3.0  0.18      0.103
## 19 1e+02   3.0  0.21      0.088
## 20 1e+03   3.0  0.22      0.103
## 21 1e-01   4.0  0.27      0.116
## 22 1e+00   4.0  0.15      0.108
## 23 1e+01   4.0  0.18      0.114
## 24 1e+02   4.0  0.21      0.088
## 25 1e+03   4.0  0.24      0.107
{% endhighlight %}



{% highlight r %}
table(true=dat[-train,"y"], pred=predict(tune.out$best.model,newx=dat[-train,]))
{% endhighlight %}



{% highlight text %}
##     pred
## true  1  2
##    1 56 21
##    2 18  5
{% endhighlight %}
 
## ROC Curves

{% highlight r %}
library(ROCR)
{% endhighlight %}



{% highlight text %}
## Loading required package: gplots
## 
## Attaching package: 'gplots'
## 
## The following object is masked from 'package:stats':
## 
##     lowess
{% endhighlight %}



{% highlight r %}
rocplot=function(pred, truth, ...){
   predob = prediction(pred, truth)
   perf = performance(predob, "tpr", "fpr")
   plot(perf,...)}
svmfit.opt=svm(y~., data=dat[train,], kernel="radial",gamma=2, cost=1,decision.values=T)
fitted=attributes(predict(svmfit.opt,dat[train,],decision.values=TRUE))$decision.values
par(mfrow=c(1,2))
rocplot(fitted,dat[train,"y"],main="Training Data")
svmfit.flex=svm(y~., data=dat[train,], kernel="radial",gamma=50, cost=1, decision.values=T)
fitted=attributes(predict(svmfit.flex,dat[train,],decision.values=T))$decision.values
rocplot(fitted,dat[train,"y"],add=T,col="red")
fitted=attributes(predict(svmfit.opt,dat[-train,],decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],main="Test Data")
fitted=attributes(predict(svmfit.flex,dat[-train,],decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],add=T,col="red")
{% endhighlight %}

![plot of chunk ROCC](../../figures/support-vector-machines-in-r/ROCC-1.png) 
 
## SVM với nhiều lớp

{% highlight r %}
set.seed(1)
x=rbind(x, matrix(rnorm(50*2), ncol=2))
y=c(y, rep(0,50))
x[y==0,2]=x[y==0,2]+2
dat=data.frame(x=x, y=as.factor(y))
par(mfrow=c(1,1))
plot(x,col=(y+1))
{% endhighlight %}

![plot of chunk SVM with Multiple Classes](../../figures/support-vector-machines-in-r/SVM with Multiple Classes-1.png) 

{% highlight r %}
svmfit=svm(y~., data=dat, kernel="radial", cost=10, gamma=1)
plot(svmfit, dat)
{% endhighlight %}

![plot of chunk SVM with Multiple Classes](../../figures/support-vector-machines-in-r/SVM with Multiple Classes-2.png) 
 
## Ứng dụng vào phân tích Gen

{% highlight r %}
library(ISLR)
names(Khan)
{% endhighlight %}



{% highlight text %}
## [1] "xtrain" "xtest"  "ytrain" "ytest"
{% endhighlight %}



{% highlight r %}
dim(Khan$xtrain)
{% endhighlight %}



{% highlight text %}
## [1]   63 2308
{% endhighlight %}



{% highlight r %}
dim(Khan$xtest)
{% endhighlight %}



{% highlight text %}
## [1]   20 2308
{% endhighlight %}



{% highlight r %}
length(Khan$ytrain)
{% endhighlight %}



{% highlight text %}
## [1] 63
{% endhighlight %}



{% highlight r %}
length(Khan$ytest)
{% endhighlight %}



{% highlight text %}
## [1] 20
{% endhighlight %}



{% highlight r %}
table(Khan$ytrain)
{% endhighlight %}



{% highlight text %}
## 
##  1  2  3  4 
##  8 23 12 20
{% endhighlight %}



{% highlight r %}
table(Khan$ytest)
{% endhighlight %}



{% highlight text %}
## 
## 1 2 3 4 
## 3 6 6 5
{% endhighlight %}



{% highlight r %}
dat=data.frame(x=Khan$xtrain, y=as.factor(Khan$ytrain))
out=svm(y~., data=dat, kernel="linear",cost=10)
summary(out)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## svm(formula = y ~ ., data = dat, kernel = "linear", cost = 10)
## 
## 
## Parameters:
##    SVM-Type:  C-classification 
##  SVM-Kernel:  linear 
##        cost:  10 
##       gamma:  0.00043 
## 
## Number of Support Vectors:  58
## 
##  ( 20 20 11 7 )
## 
## 
## Number of Classes:  4 
## 
## Levels: 
##  1 2 3 4
{% endhighlight %}



{% highlight r %}
table(out$fitted, dat$y)
{% endhighlight %}



{% highlight text %}
##    
##      1  2  3  4
##   1  8  0  0  0
##   2  0 23  0  0
##   3  0  0 12  0
##   4  0  0  0 20
{% endhighlight %}



{% highlight r %}
dat.te=data.frame(x=Khan$xtest, y=as.factor(Khan$ytest))
pred.te=predict(out, newdata=dat.te)
table(pred.te, dat.te$y)
{% endhighlight %}



{% highlight text %}
##        
## pred.te 1 2 3 4
##       1 3 0 0 0
##       2 0 6 2 0
##       3 0 0 4 0
##       4 0 0 0 5
{% endhighlight %}
