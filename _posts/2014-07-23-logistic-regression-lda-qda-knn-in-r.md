---
layout: post
title: Classification in R
converted: yes
---
 
## Dữ liệu thị trường chứng khoán
 

{% highlight r %}
library(ISLR)
names(Smarket)
{% endhighlight %}



{% highlight text %}
## [1] "Year"      "Lag1"      "Lag2"      "Lag3"      "Lag4"      "Lag5"     
## [7] "Volume"    "Today"     "Direction"
{% endhighlight %}



{% highlight r %}
dim(Smarket)
{% endhighlight %}



{% highlight text %}
## [1] 1250    9
{% endhighlight %}



{% highlight r %}
summary(Smarket)
{% endhighlight %}



{% highlight text %}
##       Year           Lag1           Lag2           Lag3     
##  Min.   :2001   Min.   :-4.9   Min.   :-4.9   Min.   :-4.9  
##  1st Qu.:2002   1st Qu.:-0.6   1st Qu.:-0.6   1st Qu.:-0.6  
##  Median :2003   Median : 0.0   Median : 0.0   Median : 0.0  
##  Mean   :2003   Mean   : 0.0   Mean   : 0.0   Mean   : 0.0  
##  3rd Qu.:2004   3rd Qu.: 0.6   3rd Qu.: 0.6   3rd Qu.: 0.6  
##  Max.   :2005   Max.   : 5.7   Max.   : 5.7   Max.   : 5.7  
##       Lag4           Lag5          Volume         Today      Direction 
##  Min.   :-4.9   Min.   :-4.9   Min.   :0.36   Min.   :-4.9   Down:602  
##  1st Qu.:-0.6   1st Qu.:-0.6   1st Qu.:1.26   1st Qu.:-0.6   Up  :648  
##  Median : 0.0   Median : 0.0   Median :1.42   Median : 0.0             
##  Mean   : 0.0   Mean   : 0.0   Mean   :1.48   Mean   : 0.0             
##  3rd Qu.: 0.6   3rd Qu.: 0.6   3rd Qu.:1.64   3rd Qu.: 0.6             
##  Max.   : 5.7   Max.   : 5.7   Max.   :3.15   Max.   : 5.7
{% endhighlight %}



{% highlight r %}
pairs(Smarket)
{% endhighlight %}

![plot of chunk The Stock Market Data](../../figures/logistic-regression-lda-qda-knn-in-r/The Stock Market Data-1.png) 

{% highlight r %}
cor(Smarket[,-9])
{% endhighlight %}



{% highlight text %}
##         Year    Lag1    Lag2    Lag3    Lag4    Lag5 Volume   Today
## Year   1.000  0.0297  0.0306  0.0332  0.0357  0.0298  0.539  0.0301
## Lag1   0.030  1.0000 -0.0263 -0.0108 -0.0030 -0.0057  0.041 -0.0262
## Lag2   0.031 -0.0263  1.0000 -0.0259 -0.0109 -0.0036 -0.043 -0.0103
## Lag3   0.033 -0.0108 -0.0259  1.0000 -0.0241 -0.0188 -0.042 -0.0024
## Lag4   0.036 -0.0030 -0.0109 -0.0241  1.0000 -0.0271 -0.048 -0.0069
## Lag5   0.030 -0.0057 -0.0036 -0.0188 -0.0271  1.0000 -0.022 -0.0349
## Volume 0.539  0.0409 -0.0434 -0.0418 -0.0484 -0.0220  1.000  0.0146
## Today  0.030 -0.0262 -0.0103 -0.0024 -0.0069 -0.0349  0.015  1.0000
{% endhighlight %}



{% highlight r %}
attach(Smarket)
plot(Volume)
{% endhighlight %}

![plot of chunk The Stock Market Data](../../figures/logistic-regression-lda-qda-knn-in-r/The Stock Market Data-2.png) 
 
## Hồi quy logistic 

{% highlight r %}
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial)
summary(glm.fit)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + 
##     Volume, family = binomial, data = Smarket)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
##  -1.45   -1.20    1.07    1.15    1.33  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)
## (Intercept) -0.12600    0.24074   -0.52     0.60
## Lag1        -0.07307    0.05017   -1.46     0.15
## Lag2        -0.04230    0.05009   -0.84     0.40
## Lag3         0.01109    0.04994    0.22     0.82
## Lag4         0.00936    0.04997    0.19     0.85
## Lag5         0.01031    0.04951    0.21     0.83
## Volume       0.13544    0.15836    0.86     0.39
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 1731.2  on 1249  degrees of freedom
## Residual deviance: 1727.6  on 1243  degrees of freedom
## AIC: 1742
## 
## Number of Fisher Scoring iterations: 3
{% endhighlight %}



{% highlight r %}
coef(glm.fit)
{% endhighlight %}



{% highlight text %}
## (Intercept)        Lag1        Lag2        Lag3        Lag4        Lag5 
##     -0.1260     -0.0731     -0.0423      0.0111      0.0094      0.0103 
##      Volume 
##      0.1354
{% endhighlight %}



{% highlight r %}
summary(glm.fit)$coef
{% endhighlight %}



{% highlight text %}
##             Estimate Std. Error z value Pr(>|z|)
## (Intercept)  -0.1260       0.24   -0.52     0.60
## Lag1         -0.0731       0.05   -1.46     0.15
## Lag2         -0.0423       0.05   -0.84     0.40
## Lag3          0.0111       0.05    0.22     0.82
## Lag4          0.0094       0.05    0.19     0.85
## Lag5          0.0103       0.05    0.21     0.83
## Volume        0.1354       0.16    0.86     0.39
{% endhighlight %}



{% highlight r %}
summary(glm.fit)$coef[,4]
{% endhighlight %}



{% highlight text %}
## (Intercept)        Lag1        Lag2        Lag3        Lag4        Lag5 
##        0.60        0.15        0.40        0.82        0.85        0.83 
##      Volume 
##        0.39
{% endhighlight %}



{% highlight r %}
glm.probs=predict(glm.fit,type="response")
glm.probs[1:10]
{% endhighlight %}



{% highlight text %}
##    1    2    3    4    5    6    7    8    9   10 
## 0.51 0.48 0.48 0.52 0.51 0.51 0.49 0.51 0.52 0.49
{% endhighlight %}



{% highlight r %}
contrasts(Direction)
{% endhighlight %}



{% highlight text %}
##      Up
## Down  0
## Up    1
{% endhighlight %}



{% highlight r %}
glm.pred=rep("Down",1250)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction)
{% endhighlight %}



{% highlight text %}
##         Direction
## glm.pred Down  Up
##     Down  145 141
##     Up    457 507
{% endhighlight %}



{% highlight r %}
(507+145)/1250
{% endhighlight %}



{% highlight text %}
## [1] 0.52
{% endhighlight %}



{% highlight r %}
mean(glm.pred==Direction)
{% endhighlight %}



{% highlight text %}
## [1] 0.52
{% endhighlight %}



{% highlight r %}
train=(Year<2005)
Smarket.2005=Smarket[!train,]
dim(Smarket.2005)
{% endhighlight %}



{% highlight text %}
## [1] 252   9
{% endhighlight %}



{% highlight r %}
Direction.2005=Direction[!train]
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial,subset=train)
glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction.2005)
{% endhighlight %}



{% highlight text %}
##         Direction.2005
## glm.pred Down Up
##     Down   77 97
##     Up     34 44
{% endhighlight %}



{% highlight r %}
mean(glm.pred==Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.48
{% endhighlight %}



{% highlight r %}
mean(glm.pred!=Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.52
{% endhighlight %}



{% highlight r %}
glm.fit=glm(Direction~Lag1+Lag2,data=Smarket,family=binomial,subset=train)
glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction.2005)
{% endhighlight %}



{% highlight text %}
##         Direction.2005
## glm.pred Down  Up
##     Down   35  35
##     Up     76 106
{% endhighlight %}



{% highlight r %}
mean(glm.pred==Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.56
{% endhighlight %}



{% highlight r %}
106/(106+76)
{% endhighlight %}



{% highlight text %}
## [1] 0.58
{% endhighlight %}



{% highlight r %}
predict(glm.fit,newdata=data.frame(Lag1=c(1.2,1.5),Lag2=c(1.1,-0.8)),type="response")
{% endhighlight %}



{% highlight text %}
##    1    2 
## 0.48 0.50
{% endhighlight %}
 
## Phân tích biệt thức tuyến tính

{% highlight r %}
library(MASS)
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=train)
lda.fit
{% endhighlight %}



{% highlight text %}
## Call:
## lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
## 
## Prior probabilities of groups:
## Down   Up 
## 0.49 0.51 
## 
## Group means:
##        Lag1   Lag2
## Down  0.043  0.034
## Up   -0.040 -0.031
## 
## Coefficients of linear discriminants:
##        LD1
## Lag1 -0.64
## Lag2 -0.51
{% endhighlight %}



{% highlight r %}
plot(lda.fit)
{% endhighlight %}

![plot of chunk Linear Discriminant Analysis](../../figures/logistic-regression-lda-qda-knn-in-r/Linear Discriminant Analysis-1.png) 

{% highlight r %}
lda.pred=predict(lda.fit, Smarket.2005)
names(lda.pred)
{% endhighlight %}



{% highlight text %}
## [1] "class"     "posterior" "x"
{% endhighlight %}



{% highlight r %}
lda.class=lda.pred$class
table(lda.class,Direction.2005)
{% endhighlight %}



{% highlight text %}
##          Direction.2005
## lda.class Down  Up
##      Down   35  35
##      Up     76 106
{% endhighlight %}



{% highlight r %}
mean(lda.class==Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.56
{% endhighlight %}



{% highlight r %}
sum(lda.pred$posterior[,1]>=.5)
{% endhighlight %}



{% highlight text %}
## [1] 70
{% endhighlight %}



{% highlight r %}
sum(lda.pred$posterior[,1]<.5)
{% endhighlight %}



{% highlight text %}
## [1] 182
{% endhighlight %}



{% highlight r %}
lda.pred$posterior[1:20,1]
{% endhighlight %}



{% highlight text %}
##  999 1000 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 1011 1012 1013 
## 0.49 0.48 0.47 0.47 0.49 0.49 0.50 0.49 0.49 0.48 0.49 0.51 0.49 0.47 0.47 
## 1014 1015 1016 1017 1018 
## 0.48 0.49 0.50 0.50 0.49
{% endhighlight %}



{% highlight r %}
lda.class[1:20]
{% endhighlight %}



{% highlight text %}
##  [1] Up   Up   Up   Up   Up   Up   Up   Up   Up   Up   Up   Down Up   Up  
## [15] Up   Up   Up   Down Up   Up  
## Levels: Down Up
{% endhighlight %}



{% highlight r %}
sum(lda.pred$posterior[,1]>.9)
{% endhighlight %}



{% highlight text %}
## [1] 0
{% endhighlight %}
 
 
## Phân tích biệt thức toàn phương
 

{% highlight r %}
qda.fit=qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit
{% endhighlight %}



{% highlight text %}
## Call:
## qda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
## 
## Prior probabilities of groups:
## Down   Up 
## 0.49 0.51 
## 
## Group means:
##        Lag1   Lag2
## Down  0.043  0.034
## Up   -0.040 -0.031
{% endhighlight %}



{% highlight r %}
qda.class=predict(qda.fit,Smarket.2005)$class
table(qda.class,Direction.2005)
{% endhighlight %}



{% highlight text %}
##          Direction.2005
## qda.class Down  Up
##      Down   30  20
##      Up     81 121
{% endhighlight %}



{% highlight r %}
mean(qda.class==Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.6
{% endhighlight %}
 
## K-Nearest Neighbors (K láng giềng gần nhất)
 

{% highlight r %}
library(class)
train.X=cbind(Lag1,Lag2)[train,]
test.X=cbind(Lag1,Lag2)[!train,]
train.Direction=Direction[train]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction,k=1)
table(knn.pred,Direction.2005)
{% endhighlight %}



{% highlight text %}
##         Direction.2005
## knn.pred Down Up
##     Down   43 58
##     Up     68 83
{% endhighlight %}



{% highlight r %}
(83+43)/252
{% endhighlight %}



{% highlight text %}
## [1] 0.5
{% endhighlight %}



{% highlight r %}
knn.pred=knn(train.X,test.X,train.Direction,k=3)
table(knn.pred,Direction.2005)
{% endhighlight %}



{% highlight text %}
##         Direction.2005
## knn.pred Down Up
##     Down   48 54
##     Up     63 87
{% endhighlight %}



{% highlight r %}
mean(knn.pred==Direction.2005)
{% endhighlight %}



{% highlight text %}
## [1] 0.54
{% endhighlight %}
 
## Một ứng dụng trong ngành bảo hiểm
 

{% highlight r %}
dim(Caravan)
{% endhighlight %}



{% highlight text %}
## [1] 5822   86
{% endhighlight %}



{% highlight r %}
attach(Caravan)
summary(Purchase)
{% endhighlight %}



{% highlight text %}
##   No  Yes 
## 5474  348
{% endhighlight %}



{% highlight r %}
348/5822
{% endhighlight %}



{% highlight text %}
## [1] 0.06
{% endhighlight %}



{% highlight r %}
standardized.X=scale(Caravan[,-86])
var(Caravan[,1])
{% endhighlight %}



{% highlight text %}
## [1] 165
{% endhighlight %}



{% highlight r %}
var(Caravan[,2])
{% endhighlight %}



{% highlight text %}
## [1] 0.16
{% endhighlight %}



{% highlight r %}
var(standardized.X[,1])
{% endhighlight %}



{% highlight text %}
## [1] 1
{% endhighlight %}



{% highlight r %}
var(standardized.X[,2])
{% endhighlight %}



{% highlight text %}
## [1] 1
{% endhighlight %}



{% highlight r %}
test=1:1000
train.X=standardized.X[-test,]
test.X=standardized.X[test,]
train.Y=Purchase[-test]
test.Y=Purchase[test]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Y,k=1)
mean(test.Y!=knn.pred)
{% endhighlight %}



{% highlight text %}
## [1] 0.12
{% endhighlight %}



{% highlight r %}
mean(test.Y!="No")
{% endhighlight %}



{% highlight text %}
## [1] 0.059
{% endhighlight %}



{% highlight r %}
table(knn.pred,test.Y)
{% endhighlight %}



{% highlight text %}
##         test.Y
## knn.pred  No Yes
##      No  873  50
##      Yes  68   9
{% endhighlight %}



{% highlight r %}
9/(68+9)
{% endhighlight %}



{% highlight text %}
## [1] 0.12
{% endhighlight %}



{% highlight r %}
knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
{% endhighlight %}



{% highlight text %}
##         test.Y
## knn.pred  No Yes
##      No  920  54
##      Yes  21   5
{% endhighlight %}



{% highlight r %}
5/26
{% endhighlight %}



{% highlight text %}
## [1] 0.19
{% endhighlight %}



{% highlight r %}
knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
{% endhighlight %}



{% highlight text %}
##         test.Y
## knn.pred  No Yes
##      No  930  55
##      Yes  11   4
{% endhighlight %}



{% highlight r %}
4/15
{% endhighlight %}



{% highlight text %}
## [1] 0.27
{% endhighlight %}



{% highlight r %}
# Comparision to logistic regression
glm.fit=glm(Purchase~.,data=Caravan,family=binomial,subset=-test)
{% endhighlight %}



{% highlight text %}
## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
{% endhighlight %}



{% highlight r %}
glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000)
glm.pred[glm.probs>.5]="Yes"
table(glm.pred,test.Y)
{% endhighlight %}



{% highlight text %}
##         test.Y
## glm.pred  No Yes
##      No  934  59
##      Yes   7   0
{% endhighlight %}



{% highlight r %}
glm.pred=rep("No",1000)
glm.pred[glm.probs>.25]="Yes"
table(glm.pred,test.Y)
{% endhighlight %}



{% highlight text %}
##         test.Y
## glm.pred  No Yes
##      No  919  48
##      Yes  22  11
{% endhighlight %}



{% highlight r %}
11/(22+11)
{% endhighlight %}



{% highlight text %}
## [1] 0.33
{% endhighlight %}
