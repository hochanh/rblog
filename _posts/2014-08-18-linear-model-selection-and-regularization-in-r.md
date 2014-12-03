---
layout: post
title: Linear Model Selection and Regularization
converted: yes
---
 
# Các phương pháp lựa chọn tập con
 
## Lựa chọn tập con tốt nhất
 

{% highlight r %}
library(ISLR)
names(Hitters)
{% endhighlight %}



{% highlight text %}
##  [1] "AtBat"     "Hits"      "HmRun"     "Runs"      "RBI"      
##  [6] "Walks"     "Years"     "CAtBat"    "CHits"     "CHmRun"   
## [11] "CRuns"     "CRBI"      "CWalks"    "League"    "Division" 
## [16] "PutOuts"   "Assists"   "Errors"    "Salary"    "NewLeague"
{% endhighlight %}



{% highlight r %}
dim(Hitters)
{% endhighlight %}



{% highlight text %}
## [1] 322  20
{% endhighlight %}



{% highlight r %}
sum(is.na(Hitters$Salary))
{% endhighlight %}



{% highlight text %}
## [1] 59
{% endhighlight %}



{% highlight r %}
Hitters=na.omit(Hitters)
dim(Hitters)
{% endhighlight %}



{% highlight text %}
## [1] 263  20
{% endhighlight %}



{% highlight r %}
sum(is.na(Hitters))
{% endhighlight %}



{% highlight text %}
## [1] 0
{% endhighlight %}



{% highlight r %}
library(leaps)
regfit.full=regsubsets(Salary~.,Hitters)
summary(regfit.full)
{% endhighlight %}



{% highlight text %}
## Subset selection object
## Call: jekyll_it()
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 8
## Selection Algorithm: exhaustive
##          AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns
## 1  ( 1 ) " "   " "  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 2  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 3  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 4  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 5  ( 1 ) "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 6  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "  
## 7  ( 1 ) " "   "*"  " "   " "  " " "*"   " "   "*"    "*"   "*"    " "  
## 8  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   " "    " "   "*"    "*"  
##          CRBI CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 ) "*"  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 ) "*"  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 ) "*"  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 ) "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 5  ( 1 ) "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 6  ( 1 ) "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 ) " "  " "    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 ) " "  "*"    " "     "*"       "*"     " "     " "    " "
{% endhighlight %}



{% highlight r %}
regfit.full=regsubsets(Salary~.,data=Hitters,nvmax=19)
reg.summary=summary(regfit.full)
names(reg.summary)
{% endhighlight %}



{% highlight text %}
## [1] "which"  "rsq"    "rss"    "adjr2"  "cp"     "bic"    "outmat" "obj"
{% endhighlight %}



{% highlight r %}
reg.summary$rsq
{% endhighlight %}



{% highlight text %}
##  [1] 0.32 0.43 0.45 0.48 0.49 0.51 0.51 0.53 0.53 0.54 0.54 0.54 0.54 0.55
## [15] 0.55 0.55 0.55 0.55 0.55
{% endhighlight %}



{% highlight r %}
par(mfrow=c(2,2))
par(mar=rep(1,4))
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
which.max(reg.summary$adjr2)
{% endhighlight %}



{% highlight text %}
## [1] 11
{% endhighlight %}



{% highlight r %}
points(11,reg.summary$adjr2[11], col="red",cex=2,pch=20)
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp",type='l')
which.min(reg.summary$cp)
{% endhighlight %}



{% highlight text %}
## [1] 10
{% endhighlight %}



{% highlight r %}
points(10,reg.summary$cp[10],col="red",cex=2,pch=20)
which.min(reg.summary$bic)
{% endhighlight %}



{% highlight text %}
## [1] 6
{% endhighlight %}



{% highlight r %}
plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type='l')
points(6,reg.summary$bic[6],col="red",cex=2,pch=20)
{% endhighlight %}

![plot of chunk Best Subset Selection](../../figures/linear-model-selection-and-regularization-in-r/Best Subset Selection-1.png) 

{% highlight r %}
par(mfrow=c(1,1))
plot(regfit.full,scale="r2")
{% endhighlight %}

![plot of chunk Best Subset Selection](../../figures/linear-model-selection-and-regularization-in-r/Best Subset Selection-2.png) 

{% highlight r %}
plot(regfit.full,scale="adjr2")
{% endhighlight %}

![plot of chunk Best Subset Selection](../../figures/linear-model-selection-and-regularization-in-r/Best Subset Selection-3.png) 

{% highlight r %}
plot(regfit.full,scale="Cp")
{% endhighlight %}

![plot of chunk Best Subset Selection](../../figures/linear-model-selection-and-regularization-in-r/Best Subset Selection-4.png) 

{% highlight r %}
plot(regfit.full,scale="bic")
{% endhighlight %}

![plot of chunk Best Subset Selection](../../figures/linear-model-selection-and-regularization-in-r/Best Subset Selection-5.png) 

{% highlight r %}
coef(regfit.full,6)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks        CRBI   DivisionW 
##       91.51       -1.87        7.60        3.70        0.64     -122.95 
##     PutOuts 
##        0.26
{% endhighlight %}
 
## Lựa chọn bậc thang: thuận và nghịch
 

{% highlight r %}
regfit.fwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)
{% endhighlight %}



{% highlight text %}
## Subset selection object
## Call: jekyll_it()
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 19
## Selection Algorithm: forward
##           AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns
## 1  ( 1 )  " "   " "  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 2  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 3  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 4  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 5  ( 1 )  "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "  
## 6  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "  
## 7  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "  
## 8  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"  
## 9  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 10  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 11  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 12  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 13  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 14  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 15  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    "*"   " "    "*"  
## 16  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"  
## 17  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"  
## 18  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   " "    "*"  
## 19  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   "*"    "*"  
##           CRBI CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 )  "*"  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 )  "*"  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 )  "*"  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 )  "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 5  ( 1 )  "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 6  ( 1 )  "*"  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 )  "*"  "*"    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 )  "*"  "*"    " "     "*"       "*"     " "     " "    " "       
## 9  ( 1 )  "*"  "*"    " "     "*"       "*"     " "     " "    " "       
## 10  ( 1 ) "*"  "*"    " "     "*"       "*"     "*"     " "    " "       
## 11  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     " "    " "       
## 12  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     " "    " "       
## 13  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 14  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 15  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 16  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 17  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 18  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 19  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"
{% endhighlight %}



{% highlight r %}
regfit.bwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)
{% endhighlight %}



{% highlight text %}
## Subset selection object
## Call: jekyll_it()
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 19
## Selection Algorithm: backward
##           AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns
## 1  ( 1 )  " "   " "  " "   " "  " " " "   " "   " "    " "   " "    "*"  
## 2  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"  
## 3  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"  
## 4  ( 1 )  "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"  
## 5  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"  
## 6  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"  
## 7  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"  
## 8  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"  
## 9  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 10  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 11  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"  
## 12  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 13  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 14  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    " "   " "    "*"  
## 15  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    "*"   " "    "*"  
## 16  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"  
## 17  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"  
## 18  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   " "    "*"  
## 19  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   "*"    "*"  
##           CRBI CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 )  " "  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 )  " "  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 )  " "  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 )  " "  " "    " "     " "       "*"     " "     " "    " "       
## 5  ( 1 )  " "  " "    " "     " "       "*"     " "     " "    " "       
## 6  ( 1 )  " "  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 )  " "  "*"    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 )  "*"  "*"    " "     "*"       "*"     " "     " "    " "       
## 9  ( 1 )  "*"  "*"    " "     "*"       "*"     " "     " "    " "       
## 10  ( 1 ) "*"  "*"    " "     "*"       "*"     "*"     " "    " "       
## 11  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     " "    " "       
## 12  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     " "    " "       
## 13  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 14  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 15  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 16  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 17  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 18  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 19  ( 1 ) "*"  "*"    "*"     "*"       "*"     "*"     "*"    "*"
{% endhighlight %}



{% highlight r %}
coef(regfit.full,7)
{% endhighlight %}



{% highlight text %}
## (Intercept)        Hits       Walks      CAtBat       CHits      CHmRun 
##       79.45        1.28        3.23       -0.38        1.50        1.44 
##   DivisionW     PutOuts 
##     -129.99        0.24
{% endhighlight %}



{% highlight r %}
coef(regfit.fwd,7)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks        CRBI      CWalks 
##      109.79       -1.96        7.45        4.91        0.85       -0.31 
##   DivisionW     PutOuts 
##     -127.12        0.25
{% endhighlight %}



{% highlight r %}
coef(regfit.bwd,7)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks       CRuns      CWalks 
##      105.65       -1.98        6.76        6.06        1.13       -0.72 
##   DivisionW     PutOuts 
##     -116.17        0.30
{% endhighlight %}
 
## Chọn lựa mô hình
 

{% highlight r %}
set.seed(1)
train=sample(c(TRUE,FALSE), nrow(Hitters),rep=TRUE)
test=(!train)
regfit.best=regsubsets(Salary~.,data=Hitters[train,],nvmax=19)
test.mat=model.matrix(Salary~.,data=Hitters[test,])
val.errors=rep(NA,19)
for(i in 1:19){
   coefi=coef(regfit.best,id=i)
   pred=test.mat[,names(coefi)]%*%coefi
   val.errors[i]=mean((Hitters$Salary[test]-pred)^2)
}
val.errors
{% endhighlight %}



{% highlight text %}
##  [1] 220968 169157 178518 163426 168418 171271 162377 157909 154056 148162
## [11] 151156 151742 152214 157359 158541 158743 159973 159860 160106
{% endhighlight %}



{% highlight r %}
which.min(val.errors)
{% endhighlight %}



{% highlight text %}
## [1] 10
{% endhighlight %}



{% highlight r %}
coef(regfit.best,10)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks      CAtBat       CHits 
##      -80.28       -1.47        7.16        3.64       -0.19        1.11 
##      CHmRun      CWalks     LeagueN   DivisionW     PutOuts 
##        1.38       -0.75       84.56      -53.03        0.24
{% endhighlight %}



{% highlight r %}
# Writing function for latter uses
predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
  }
regfit.best=regsubsets(Salary~.,data=Hitters,nvmax=19)
coef(regfit.best,10)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks      CAtBat       CRuns 
##      162.54       -2.17        6.92        5.77       -0.13        1.41 
##        CRBI      CWalks   DivisionW     PutOuts     Assists 
##        0.77       -0.83     -112.38        0.30        0.28
{% endhighlight %}



{% highlight r %}
k=10
set.seed(1)
folds=sample(1:k,nrow(Hitters),replace=TRUE)
cv.errors=matrix(NA,k,19, dimnames=list(NULL, paste(1:19)))
for(j in 1:k){
  best.fit=regsubsets(Salary~.,data=Hitters[folds!=j,],nvmax=19)
  for(i in 1:19){
    pred=predict(best.fit,Hitters[folds==j,],id=i)
    cv.errors[j,i]=mean( (Hitters$Salary[folds==j]-pred)^2)
    }
  }
{% endhighlight %}



{% highlight text %}
## Error in object$call[[2]]: subscript out of bounds
{% endhighlight %}



{% highlight r %}
mean.cv.errors=apply(cv.errors,2,mean)
mean.cv.errors
{% endhighlight %}



{% highlight text %}
##  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 
## NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
{% endhighlight %}



{% highlight r %}
which.min(mean.cv.errors)
{% endhighlight %}



{% highlight text %}
## integer(0)
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,1))
plot(mean.cv.errors,type='b')
{% endhighlight %}



{% highlight text %}
## Warning in min(x): no non-missing arguments to min; returning Inf
{% endhighlight %}



{% highlight text %}
## Warning in max(x): no non-missing arguments to max; returning -Inf
{% endhighlight %}



{% highlight text %}
## Error in plot.window(...): need finite 'ylim' values
{% endhighlight %}

![plot of chunk Choosing Among Models](../../figures/linear-model-selection-and-regularization-in-r/Choosing Among Models-1.png) 

{% highlight r %}
reg.best=regsubsets(Salary~.,data=Hitters, nvmax=19)
coef(reg.best,11)
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       Walks      CAtBat       CRuns 
##      135.75       -2.13        6.92        5.62       -0.14        1.46 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##        0.79       -0.82       43.11     -111.15        0.29        0.27
{% endhighlight %}
 
# Ridge Regression and the Lasso

{% highlight r %}
x=model.matrix(Salary~.,Hitters)[,-1]
y=Hitters$Salary
{% endhighlight %}
 
## Ridge Regression
 

{% highlight r %}
library(glmnet)
{% endhighlight %}



{% highlight text %}
## Loading required package: Matrix
## Loaded glmnet 1.9-8
{% endhighlight %}



{% highlight r %}
grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x,y,alpha=0,lambda=grid)
dim(coef(ridge.mod))
{% endhighlight %}



{% highlight text %}
## [1]  20 100
{% endhighlight %}



{% highlight r %}
ridge.mod$lambda[50]
{% endhighlight %}



{% highlight text %}
## [1] 11498
{% endhighlight %}



{% highlight r %}
coef(ridge.mod)[,50]
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       HmRun        Runs         RBI 
##    407.3561      0.0370      0.1382      0.5246      0.2307      0.2398 
##       Walks       Years      CAtBat       CHits      CHmRun       CRuns 
##      0.2896      1.1077      0.0031      0.0117      0.0875      0.0234 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##      0.0241      0.0250      0.0850     -6.2154      0.0165      0.0026 
##      Errors  NewLeagueN 
##     -0.0205      0.3014
{% endhighlight %}



{% highlight r %}
sqrt(sum(coef(ridge.mod)[-1,50]^2))
{% endhighlight %}



{% highlight text %}
## [1] 6.4
{% endhighlight %}



{% highlight r %}
ridge.mod$lambda[60]
{% endhighlight %}



{% highlight text %}
## [1] 705
{% endhighlight %}



{% highlight r %}
coef(ridge.mod)[,60]
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       HmRun        Runs         RBI 
##      54.325       0.112       0.656       1.180       0.938       0.847 
##       Walks       Years      CAtBat       CHits      CHmRun       CRuns 
##       1.320       2.596       0.011       0.047       0.338       0.094 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##       0.098       0.072      13.684     -54.659       0.119       0.016 
##      Errors  NewLeagueN 
##      -0.704       8.612
{% endhighlight %}



{% highlight r %}
sqrt(sum(coef(ridge.mod)[-1,60]^2))
{% endhighlight %}



{% highlight text %}
## [1] 57
{% endhighlight %}



{% highlight r %}
predict(ridge.mod,s=50,type="coefficients")[1:20,]
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       HmRun        Runs         RBI 
##     4.9e+01    -3.6e-01     2.0e+00    -1.3e+00     1.1e+00     8.0e-01 
##       Walks       Years      CAtBat       CHits      CHmRun       CRuns 
##     2.7e+00    -6.2e+00     5.4e-03     1.1e-01     6.2e-01     2.2e-01 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##     2.2e-01    -1.5e-01     4.6e+01    -1.2e+02     2.5e-01     1.2e-01 
##      Errors  NewLeagueN 
##    -3.3e+00    -9.5e+00
{% endhighlight %}



{% highlight r %}
set.seed(1)
train=sample(1:nrow(x), nrow(x)/2)
test=(-train)
y.test=y[test]
ridge.mod=glmnet(x[train,],y[train],alpha=0,lambda=grid, thresh=1e-12)
ridge.pred=predict(ridge.mod,s=4,newx=x[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 1e+05
{% endhighlight %}



{% highlight r %}
mean((mean(y[train])-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 193253
{% endhighlight %}



{% highlight r %}
ridge.pred=predict(ridge.mod,s=1e10,newx=x[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 193253
{% endhighlight %}



{% highlight r %}
ridge.pred=predict(ridge.mod,s=0,newx=x[test,],exact=T)
{% endhighlight %}



{% highlight text %}
## Error in drop(y): error in evaluating the argument 'x' in selecting a method for function 'drop': Error: object 'y' not found
{% endhighlight %}



{% highlight r %}
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 193253
{% endhighlight %}



{% highlight r %}
lm(y~x, subset=train)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = y ~ x, subset = train)
## 
## Coefficients:
## (Intercept)       xAtBat        xHits       xHmRun        xRuns  
##    299.4285      -2.5403       8.3668      11.6451      -9.0992  
##        xRBI       xWalks       xYears      xCAtBat       xCHits  
##      2.4410       9.2344     -22.9367      -0.1815      -0.1160  
##     xCHmRun       xCRuns        xCRBI      xCWalks     xLeagueN  
##     -1.3389       3.3284       0.0754      -1.0784      59.7607  
##  xDivisionW     xPutOuts     xAssists      xErrors  xNewLeagueN  
##    -98.8623       0.3409       0.3416      -0.6421      -0.6744
{% endhighlight %}



{% highlight r %}
predict(ridge.mod,s=0,exact=T,type="coefficients")[1:20,]
{% endhighlight %}



{% highlight text %}
## Error in drop(y): error in evaluating the argument 'x' in selecting a method for function 'drop': Error: object 'y' not found
{% endhighlight %}



{% highlight r %}
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=0)
plot(cv.out)
{% endhighlight %}

![plot of chunk ridge](../../figures/linear-model-selection-and-regularization-in-r/ridge-1.png) 

{% highlight r %}
bestlam=cv.out$lambda.min
bestlam
{% endhighlight %}



{% highlight text %}
## [1] 212
{% endhighlight %}



{% highlight r %}
ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,])
mean((ridge.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 96016
{% endhighlight %}



{% highlight r %}
out=glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:20,]
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       HmRun        Runs         RBI 
##       9.885       0.031       1.009       0.139       1.113       0.873 
##       Walks       Years      CAtBat       CHits      CHmRun       CRuns 
##       1.804       0.131       0.011       0.065       0.452       0.129 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##       0.137       0.029      27.182     -91.634       0.191       0.043 
##      Errors  NewLeagueN 
##      -1.812       7.212
{% endhighlight %}
 
## The Lasso

{% highlight r %}
lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
{% endhighlight %}

![plot of chunk lasso](../../figures/linear-model-selection-and-regularization-in-r/lasso-1.png) 

{% highlight r %}
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
{% endhighlight %}

![plot of chunk lasso](../../figures/linear-model-selection-and-regularization-in-r/lasso-2.png) 

{% highlight r %}
bestlam=cv.out$lambda.min
lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 1e+05
{% endhighlight %}



{% highlight r %}
out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef
{% endhighlight %}



{% highlight text %}
## (Intercept)       AtBat        Hits       HmRun        Runs         RBI 
##       18.54        0.00        1.87        0.00        0.00        0.00 
##       Walks       Years      CAtBat       CHits      CHmRun       CRuns 
##        2.22        0.00        0.00        0.00        0.00        0.21 
##        CRBI      CWalks     LeagueN   DivisionW     PutOuts     Assists 
##        0.41        0.00        3.27     -103.48        0.22        0.00 
##      Errors  NewLeagueN 
##        0.00        0.00
{% endhighlight %}



{% highlight r %}
lasso.coef[lasso.coef!=0]
{% endhighlight %}



{% highlight text %}
## (Intercept)        Hits       Walks       CRuns        CRBI     LeagueN 
##       18.54        1.87        2.22        0.21        0.41        3.27 
##   DivisionW     PutOuts 
##     -103.48        0.22
{% endhighlight %}
 
# PCR and PLS Regression
 
## Principal Components Regression

{% highlight r %}
library(pls)
{% endhighlight %}



{% highlight text %}
## 
## Attaching package: 'pls'
## 
## The following object is masked from 'package:stats':
## 
##     loadings
{% endhighlight %}



{% highlight r %}
set.seed(2)
pcr.fit=pcr(Salary~., data=Hitters,scale=TRUE,validation="CV")
summary(pcr.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 263 19 
## 	Y dimension: 263 1
## Fit method: svdpc
## Number of components considered: 19
## 
## VALIDATION: RMSEP
## Cross-validated using 10 random segments.
##        (Intercept)  1 comps  2 comps  3 comps  4 comps  5 comps  6 comps
## CV             452    348.9    352.2    353.5    352.8    350.1    349.1
## adjCV          452    348.7    351.8    352.9    352.1    349.3    348.0
##        7 comps  8 comps  9 comps  10 comps  11 comps  12 comps  13 comps
## CV       349.6    350.9    352.9     353.8     355.0     356.2     363.5
## adjCV    348.5    349.8    351.6     352.3     353.4     354.5     361.6
##        14 comps  15 comps  16 comps  17 comps  18 comps  19 comps
## CV        355.2     357.4     347.6     350.1     349.2     352.6
## adjCV     352.8     355.2     345.5     347.6     346.7     349.8
## 
## TRAINING: % variance explained
##         1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps
## X         38.31    60.16    70.84    79.03    84.29    88.63    92.26
## Salary    40.63    41.58    42.17    43.22    44.90    46.48    46.69
##         8 comps  9 comps  10 comps  11 comps  12 comps  13 comps  14 comps
## X         94.96    96.28     97.26     97.98     98.65     99.15     99.47
## Salary    46.75    46.86     47.76     47.82     47.85     48.10     50.40
##         15 comps  16 comps  17 comps  18 comps  19 comps
## X          99.75     99.89     99.97     99.99    100.00
## Salary     50.55     53.01     53.85     54.61     54.61
{% endhighlight %}



{% highlight r %}
validationplot(pcr.fit,val.type="MSEP")
{% endhighlight %}

![plot of chunk PCR](../../figures/linear-model-selection-and-regularization-in-r/PCR-1.png) 

{% highlight r %}
set.seed(1)
pcr.fit=pcr(Salary~., data=Hitters,subset=train,scale=TRUE, validation="CV")
validationplot(pcr.fit,val.type="MSEP")
{% endhighlight %}

![plot of chunk PCR](../../figures/linear-model-selection-and-regularization-in-r/PCR-2.png) 

{% highlight r %}
pcr.pred=predict(pcr.fit,x[test,],ncomp=7)
mean((pcr.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 96556
{% endhighlight %}



{% highlight r %}
pcr.fit=pcr(y~x,scale=TRUE,ncomp=7)
summary(pcr.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 263 19 
## 	Y dimension: 263 1
## Fit method: svdpc
## Number of components considered: 7
## TRAINING: % variance explained
##    1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps
## X    38.31    60.16    70.84    79.03    84.29    88.63    92.26
## y    40.63    41.58    42.17    43.22    44.90    46.48    46.69
{% endhighlight %}
 
## Partial Least Squares

{% highlight r %}
set.seed(1)
pls.fit=plsr(Salary~., data=Hitters,subset=train,scale=TRUE, validation="CV")
summary(pls.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 131 19 
## 	Y dimension: 131 1
## Fit method: kernelpls
## Number of components considered: 19
## 
## VALIDATION: RMSEP
## Cross-validated using 10 random segments.
##        (Intercept)  1 comps  2 comps  3 comps  4 comps  5 comps  6 comps
## CV           464.6    394.2    391.5    393.1    395.0    415.0    424.0
## adjCV        464.6    393.4    390.2    391.1    392.9    411.5    418.8
##        7 comps  8 comps  9 comps  10 comps  11 comps  12 comps  13 comps
## CV       424.5    415.8    404.6     407.1     412.0     414.4     410.3
## adjCV    418.9    411.4    400.7     402.2     407.2     409.3     405.6
##        14 comps  15 comps  16 comps  17 comps  18 comps  19 comps
## CV        406.2     408.6     410.5     408.8     407.8     410.2
## adjCV     401.8     403.9     405.6     404.1     403.2     405.5
## 
## TRAINING: % variance explained
##         1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps
## X         38.12    53.46    66.05    74.49    79.33    84.56    87.09
## Salary    33.58    38.96    41.57    42.43    44.04    45.59    47.05
##         8 comps  9 comps  10 comps  11 comps  12 comps  13 comps  14 comps
## X         90.74    92.55     93.94     97.23     97.88     98.35     98.85
## Salary    47.53    48.42     49.68     50.04     50.54     50.78     50.92
##         15 comps  16 comps  17 comps  18 comps  19 comps
## X          99.11     99.43     99.78     99.99    100.00
## Salary     51.04     51.11     51.15     51.16     51.18
{% endhighlight %}



{% highlight r %}
validationplot(pls.fit,val.type="MSEP")
{% endhighlight %}

![plot of chunk PLS](../../figures/linear-model-selection-and-regularization-in-r/PLS-1.png) 

{% highlight r %}
pls.pred=predict(pls.fit,x[test,],ncomp=2)
mean((pls.pred-y.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 1e+05
{% endhighlight %}



{% highlight r %}
pls.fit=plsr(Salary~., data=Hitters,scale=TRUE,ncomp=2)
summary(pls.fit)
{% endhighlight %}



{% highlight text %}
## Data: 	X dimension: 263 19 
## 	Y dimension: 263 1
## Fit method: kernelpls
## Number of components considered: 2
## TRAINING: % variance explained
##         1 comps  2 comps
## X         38.08    51.03
## Salary    43.05    46.40
{% endhighlight %}
