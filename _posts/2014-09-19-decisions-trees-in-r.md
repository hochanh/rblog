---
layout: post
title: Decision trees
converted: yes
---
 
## Cây phân loại
 

{% highlight r %}
library(tree)
library(ISLR)
attach(Carseats)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Carseats (pos = 21):
## 
##     Advertising, Age, CompPrice, Education, Income, Population,
##     Price, Sales, ShelveLoc, Urban, US
## 
## The following objects are masked from Carseats (pos = 22):
## 
##     Advertising, Age, CompPrice, Education, Income, Population,
##     Price, Sales, ShelveLoc, Urban, US
{% endhighlight %}



{% highlight r %}
High=ifelse(Sales<=8,"No","Yes")
Carseats=data.frame(Carseats,High)
tree.carseats=tree(High~.-Sales,Carseats)
summary(tree.carseats)
{% endhighlight %}



{% highlight text %}
## 
## Classification tree:
## tree(formula = High ~ . - Sales, data = Carseats)
## Variables actually used in tree construction:
## [1] "ShelveLoc"   "Price"       "Income"      "CompPrice"   "Population" 
## [6] "Advertising" "Age"         "US"         
## Number of terminal nodes:  27 
## Residual mean deviance:  0.46 = 171 / 373 
## Misclassification error rate: 0.09 = 36 / 400
{% endhighlight %}



{% highlight r %}
plot(tree.carseats)
text(tree.carseats,pretty=0)
{% endhighlight %}

![plot of chunk Fitting Classification Trees](../../figures/decisions-trees-in-r/Fitting Classification Trees-1.png) 

{% highlight r %}
tree.carseats
{% endhighlight %}



{% highlight text %}
## node), split, n, deviance, yval, (yprob)
##       * denotes terminal node
{% endhighlight %}



{% highlight text %}
## Error in prettyNum(.Internal(format(x, trim, digits, nsmall, width, 3L, : invalid 'digits' argument
{% endhighlight %}



{% highlight r %}
set.seed(2)
train=sample(1:nrow(Carseats), 200)
Carseats.test=Carseats[-train,]
High.test=High[-train]
tree.carseats=tree(High~.-Sales,Carseats,subset=train)
tree.pred=predict(tree.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
{% endhighlight %}



{% highlight text %}
##          High.test
## tree.pred No Yes
##       No  86  27
##       Yes 30  57
{% endhighlight %}



{% highlight r %}
(86+57)/200
{% endhighlight %}



{% highlight text %}
## [1] 0.71
{% endhighlight %}



{% highlight r %}
set.seed(3)
cv.carseats=cv.tree(tree.carseats,FUN=prune.misclass)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'High' not found
{% endhighlight %}



{% highlight r %}
names(cv.carseats)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'cv.carseats' not found
{% endhighlight %}



{% highlight r %}
cv.carseats
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'cv.carseats' not found
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,2))
plot(cv.carseats$size,cv.carseats$dev,type="b")
{% endhighlight %}



{% highlight text %}
## Error in plot(cv.carseats$size, cv.carseats$dev, type = "b"): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'cv.carseats' not found
{% endhighlight %}



{% highlight r %}
plot(cv.carseats$k,cv.carseats$dev,type="b")
{% endhighlight %}



{% highlight text %}
## Error in plot(cv.carseats$k, cv.carseats$dev, type = "b"): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'cv.carseats' not found
{% endhighlight %}



{% highlight r %}
prune.carseats=prune.misclass(tree.carseats,best=9)
plot(prune.carseats)
text(prune.carseats,pretty=0)
tree.pred=predict(prune.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
{% endhighlight %}



{% highlight text %}
##          High.test
## tree.pred No Yes
##       No  94  24
##       Yes 22  60
{% endhighlight %}



{% highlight r %}
(94+60)/200
{% endhighlight %}



{% highlight text %}
## [1] 0.77
{% endhighlight %}



{% highlight r %}
prune.carseats=prune.misclass(tree.carseats,best=15)
plot(prune.carseats)
text(prune.carseats,pretty=0)
{% endhighlight %}

![plot of chunk Fitting Classification Trees](../../figures/decisions-trees-in-r/Fitting Classification Trees-2.png) 

{% highlight r %}
tree.pred=predict(prune.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
{% endhighlight %}



{% highlight text %}
##          High.test
## tree.pred No Yes
##       No  86  22
##       Yes 30  62
{% endhighlight %}



{% highlight r %}
(86+62)/200
{% endhighlight %}



{% highlight text %}
## [1] 0.74
{% endhighlight %}
 
## Cây hồi quy
 

{% highlight r %}
library(MASS)
set.seed(1)
train = sample(1:nrow(Boston), nrow(Boston)/2)
tree.boston=tree(medv~.,Boston,subset=train)
summary(tree.boston)
{% endhighlight %}



{% highlight text %}
## 
## Regression tree:
## tree(formula = medv ~ ., data = Boston, subset = train)
## Variables actually used in tree construction:
## [1] "lstat" "rm"    "dis"  
## Number of terminal nodes:  8 
## Residual mean deviance:  13 = 3100 / 245 
## Distribution of residuals:
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   -14.1    -2.0    -0.1     0.0     2.0    12.6
{% endhighlight %}



{% highlight r %}
plot(tree.boston)
text(tree.boston,pretty=0)
{% endhighlight %}

![plot of chunk Fitting Regression Trees](../../figures/decisions-trees-in-r/Fitting Regression Trees-1.png) 

{% highlight r %}
cv.boston=cv.tree(tree.boston)
plot(cv.boston$size,cv.boston$dev,type='b')
{% endhighlight %}

![plot of chunk Fitting Regression Trees](../../figures/decisions-trees-in-r/Fitting Regression Trees-2.png) 

{% highlight r %}
prune.boston=prune.tree(tree.boston,best=5)
plot(prune.boston)
text(prune.boston,pretty=0)
{% endhighlight %}

![plot of chunk Fitting Regression Trees](../../figures/decisions-trees-in-r/Fitting Regression Trees-3.png) 

{% highlight r %}
yhat=predict(tree.boston,newdata=Boston[-train,])
boston.test=Boston[-train,"medv"]
plot(yhat,boston.test)
abline(0,1)
{% endhighlight %}

![plot of chunk Fitting Regression Trees](../../figures/decisions-trees-in-r/Fitting Regression Trees-4.png) 

{% highlight r %}
mean((yhat-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 25
{% endhighlight %}
 
## Bagging và Random Forests
 

{% highlight r %}
library(randomForest)
{% endhighlight %}



{% highlight text %}
## randomForest 4.6-10
## Type rfNews() to see new features/changes/bug fixes.
{% endhighlight %}



{% highlight r %}
set.seed(1)
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13,importance=TRUE)
bag.boston
{% endhighlight %}



{% highlight text %}
## 
## Call:
##  randomForest(formula = medv ~ ., data = Boston, mtry = 13, importance = TRUE,      subset = train) 
##                Type of random forest: regression
##                      Number of trees: 500
## No. of variables tried at each split: 13
## 
##           Mean of squared residuals: 11
##                     % Var explained: 87
{% endhighlight %}



{% highlight r %}
yhat.bag = predict(bag.boston,newdata=Boston[-train,])
plot(yhat.bag, boston.test)
abline(0,1)
{% endhighlight %}

![plot of chunk Bagging and Random Forests](../../figures/decisions-trees-in-r/Bagging and Random Forests-1.png) 

{% highlight r %}
mean((yhat.bag-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 13
{% endhighlight %}



{% highlight r %}
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13,ntree=25)
yhat.bag = predict(bag.boston,newdata=Boston[-train,])
mean((yhat.bag-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 13
{% endhighlight %}



{% highlight r %}
set.seed(1)
rf.boston=randomForest(medv~.,data=Boston,subset=train,mtry=6,importance=TRUE)
yhat.rf = predict(rf.boston,newdata=Boston[-train,])
mean((yhat.rf-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 11
{% endhighlight %}



{% highlight r %}
importance(rf.boston)
{% endhighlight %}



{% highlight text %}
##         %IncMSE IncNodePurity
## crim       12.5          1095
## zn          1.4            64
## indus       9.3          1086
## chas        2.5            76
## nox        12.8          1009
## rm         31.6          6705
## age        10.0           575
## dis        12.8          1351
## rad         3.9            94
## tax         7.6           453
## ptratio    12.0           919
## black       7.4           359
## lstat      27.7          6928
{% endhighlight %}



{% highlight r %}
varImpPlot(rf.boston)
{% endhighlight %}

![plot of chunk Bagging and Random Forests](../../figures/decisions-trees-in-r/Bagging and Random Forests-2.png) 
 
## Boosting
 

{% highlight r %}
library(gbm)
{% endhighlight %}



{% highlight text %}
## Loading required package: survival
## 
## Attaching package: 'survival'
## 
## The following object is masked from 'package:boot':
## 
##     aml
## 
## Loading required package: lattice
## 
## Attaching package: 'lattice'
## 
## The following object is masked from 'package:boot':
## 
##     melanoma
## 
## Loading required package: parallel
## Loaded gbm 2.1
{% endhighlight %}



{% highlight r %}
set.seed(1)
boost.boston=gbm(medv~.,data=Boston[train,],distribution="gaussian",n.trees=5000,interaction.depth=4)
summary(boost.boston)
{% endhighlight %}

![plot of chunk Boosting](../../figures/decisions-trees-in-r/Boosting-1.png) 

{% highlight text %}
##             var rel.inf
## lstat     lstat  45.963
## rm           rm  31.224
## dis         dis   6.809
## crim       crim   4.074
## nox         nox   2.561
## ptratio ptratio   2.275
## black     black   1.797
## age         age   1.649
## tax         tax   1.360
## indus     indus   1.271
## chas       chas   0.801
## rad         rad   0.203
## zn           zn   0.015
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,2))
plot(boost.boston,i="rm")
plot(boost.boston,i="lstat")
{% endhighlight %}

![plot of chunk Boosting](../../figures/decisions-trees-in-r/Boosting-2.png) 

{% highlight r %}
yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 12
{% endhighlight %}



{% highlight r %}
boost.boston=gbm(medv~.,data=Boston[train,],distribution="gaussian",n.trees=5000,interaction.depth=4,shrinkage=0.2,verbose=F)
yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2)
{% endhighlight %}



{% highlight text %}
## [1] 12
{% endhighlight %}
