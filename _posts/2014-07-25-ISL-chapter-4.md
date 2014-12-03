---
layout: post
title: "ISL: Chapter 4"
converted: yes
---
 
## Bài 10
 

{% highlight r %}
library(ISLR)
names(Weekly)
{% endhighlight %}



{% highlight text %}
## [1] "Year"      "Lag1"      "Lag2"      "Lag3"      "Lag4"      "Lag5"     
## [7] "Volume"    "Today"     "Direction"
{% endhighlight %}



{% highlight r %}
dim(Weekly)
{% endhighlight %}



{% highlight text %}
## [1] 1089    9
{% endhighlight %}



{% highlight r %}
summary(Weekly)
{% endhighlight %}



{% highlight text %}
##       Year           Lag1            Lag2            Lag3      
##  Min.   :1990   Min.   :-18.2   Min.   :-18.2   Min.   :-18.2  
##  1st Qu.:1995   1st Qu.: -1.2   1st Qu.: -1.2   1st Qu.: -1.2  
##  Median :2000   Median :  0.2   Median :  0.2   Median :  0.2  
##  Mean   :2000   Mean   :  0.2   Mean   :  0.2   Mean   :  0.1  
##  3rd Qu.:2005   3rd Qu.:  1.4   3rd Qu.:  1.4   3rd Qu.:  1.4  
##  Max.   :2010   Max.   : 12.0   Max.   : 12.0   Max.   : 12.0  
##       Lag4            Lag5           Volume        Today       Direction 
##  Min.   :-18.2   Min.   :-18.2   Min.   :0.1   Min.   :-18.2   Down:484  
##  1st Qu.: -1.2   1st Qu.: -1.2   1st Qu.:0.3   1st Qu.: -1.2   Up  :605  
##  Median :  0.2   Median :  0.2   Median :1.0   Median :  0.2             
##  Mean   :  0.1   Mean   :  0.1   Mean   :1.6   Mean   :  0.1             
##  3rd Qu.:  1.4   3rd Qu.:  1.4   3rd Qu.:2.1   3rd Qu.:  1.4             
##  Max.   : 12.0   Max.   : 12.0   Max.   :9.3   Max.   : 12.0
{% endhighlight %}



{% highlight r %}
pairs(Weekly)
{% endhighlight %}

![plot of chunk 10](../../figures/ISL-chapter-4/10-1.png) 

{% highlight r %}
cor(Weekly[,-9])
{% endhighlight %}



{% highlight text %}
##          Year    Lag1   Lag2   Lag3    Lag4    Lag5 Volume   Today
## Year    1.000 -0.0323 -0.033 -0.030 -0.0311 -0.0305  0.842 -0.0325
## Lag1   -0.032  1.0000 -0.075  0.059 -0.0713 -0.0082 -0.065 -0.0750
## Lag2   -0.033 -0.0749  1.000 -0.076  0.0584 -0.0725 -0.086  0.0592
## Lag3   -0.030  0.0586 -0.076  1.000 -0.0754  0.0607 -0.069 -0.0712
## Lag4   -0.031 -0.0713  0.058 -0.075  1.0000 -0.0757 -0.061 -0.0078
## Lag5   -0.031 -0.0082 -0.072  0.061 -0.0757  1.0000 -0.059  0.0110
## Volume  0.842 -0.0650 -0.086 -0.069 -0.0611 -0.0585  1.000 -0.0331
## Today  -0.032 -0.0750  0.059 -0.071 -0.0078  0.0110 -0.033  1.0000
{% endhighlight %}



{% highlight r %}
attach(Weekly)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Smarket:
## 
##     Direction, Lag1, Lag2, Lag3, Lag4, Lag5, Today, Volume, Year
{% endhighlight %}



{% highlight r %}
plot(Volume)
{% endhighlight %}

![plot of chunk 10](../../figures/ISL-chapter-4/10-2.png) 

{% highlight r %}
# Logistic regression
glmout=glm(Direction~.-Year-Today,data=Weekly,family=binomial)
summary(glmout)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## glm(formula = Direction ~ . - Year - Today, family = binomial, 
##     data = Weekly)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.695  -1.256   0.991   1.085   1.458  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)   
## (Intercept)   0.2669     0.0859    3.11   0.0019 **
## Lag1         -0.0413     0.0264   -1.56   0.1181   
## Lag2          0.0584     0.0269    2.18   0.0296 * 
## Lag3         -0.0161     0.0267   -0.60   0.5469   
## Lag4         -0.0278     0.0265   -1.05   0.2937   
## Lag5         -0.0145     0.0264   -0.55   0.5833   
## Volume       -0.0227     0.0369   -0.62   0.5377   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 1496.2  on 1088  degrees of freedom
## Residual deviance: 1486.4  on 1082  degrees of freedom
## AIC: 1500
## 
## Number of Fisher Scoring iterations: 4
{% endhighlight %}



{% highlight r %}
glmpro=predict(glmout,type="response")
contrasts(Direction)
{% endhighlight %}



{% highlight text %}
##      Up
## Down  0
## Up    1
{% endhighlight %}



{% highlight r %}
glmpre=rep("Down",1089)
glmpre[glmpro>.5]="Up"
table(glmpre,Direction)
{% endhighlight %}



{% highlight text %}
##       Direction
## glmpre Down  Up
##   Down   54  48
##   Up    430 557
{% endhighlight %}



{% highlight r %}
mean(glmpre==Direction)
{% endhighlight %}



{% highlight text %}
## [1] 0.56
{% endhighlight %}



{% highlight r %}
(172+427)/1089
{% endhighlight %}



{% highlight text %}
## [1] 0.55
{% endhighlight %}



{% highlight r %}
427/(427+312)
{% endhighlight %}



{% highlight text %}
## [1] 0.58
{% endhighlight %}



{% highlight r %}
# split training data
train=(Year<2008)
Weekly0810=Weekly[!train,]
dim(Weekly0810)
{% endhighlight %}



{% highlight text %}
## [1] 156   9
{% endhighlight %}



{% highlight r %}
Direction0810=Direction[!train]
 
# using Logistic Regression
glmout2=glm(Direction~Lag2,data=Weekly,family=binomial,subset=train)
glmpro2=predict(glmout2,Weekly0810,type="response")
glmpre2=rep("Down",156)
glmpre2[glmpro2>.5]="Up"
table(glmpre2,Direction0810)
{% endhighlight %}



{% highlight text %}
##        Direction0810
## glmpre2 Down Up
##    Down    7  5
##    Up     65 79
{% endhighlight %}



{% highlight r %}
mean(glmpre2==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.55
{% endhighlight %}



{% highlight r %}
# using LDA
library(MASS)
ldaout=lda(Direction~Lag2,data=Weekly,subset=train)
ldapro=predict(ldaout,Weekly0810)
ldapre=ldapro$class
table(ldapre,Direction0810)
{% endhighlight %}



{% highlight text %}
##       Direction0810
## ldapre Down Up
##   Down    6  5
##   Up     66 79
{% endhighlight %}



{% highlight r %}
mean(ldapre==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.54
{% endhighlight %}



{% highlight r %}
# using QDA
qdaout=qda(Direction~Lag2,data=Weekly,subset=train)
qdapro=predict(qdaout,Weekly0810)
qdapre=qdapro$class
table(qdapre,Direction0810)
{% endhighlight %}



{% highlight text %}
##       Direction0810
## qdapre Down Up
##   Down    0  0
##   Up     72 84
{% endhighlight %}



{% highlight r %}
mean(qdapre==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.54
{% endhighlight %}



{% highlight r %}
# using KNN, K=1
library(class)
trainK=matrix(Lag2[train])
testK=matrix(Lag2[!train])
trainD=Direction[train]
set.seed(1)
knnpre=knn(trainK,testK,trainD,k=1)
table(knnpre,Direction0810)
{% endhighlight %}



{% highlight text %}
##       Direction0810
## knnpre Down Up
##   Down   32 38
##   Up     40 46
{% endhighlight %}



{% highlight r %}
mean(knnpre==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.5
{% endhighlight %}



{% highlight r %}
# K=3
knnpre3=knn(trainK,testK,trainD,k=3)
table(knnpre3,Direction0810)
{% endhighlight %}



{% highlight text %}
##        Direction0810
## knnpre3 Down Up
##    Down   26 28
##    Up     46 56
{% endhighlight %}



{% highlight r %}
mean(knnpre3==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.53
{% endhighlight %}



{% highlight r %}
# K=7
knnpre7=knn(trainK,testK,trainD,k=7)
table(knnpre7,Direction0810)
{% endhighlight %}



{% highlight text %}
##        Direction0810
## knnpre7 Down Up
##    Down   26 25
##    Up     46 59
{% endhighlight %}



{% highlight r %}
mean(knnpre7==Direction0810)
{% endhighlight %}



{% highlight text %}
## [1] 0.54
{% endhighlight %}
 
## Bài 11

{% highlight r %}
auto=read.csv("./ISL/Auto.csv",na.strings="?")
auto=na.omit(auto)
names(auto)
{% endhighlight %}



{% highlight text %}
## [1] "mpg"          "cylinders"    "displacement" "horsepower"  
## [5] "weight"       "acceleration" "year"         "origin"      
## [9] "name"
{% endhighlight %}



{% highlight r %}
dim(auto)
{% endhighlight %}



{% highlight text %}
## [1] 392   9
{% endhighlight %}



{% highlight r %}
summary(auto)
{% endhighlight %}



{% highlight text %}
##       mpg       cylinders    displacement   horsepower      weight    
##  Min.   : 9   Min.   :3.0   Min.   : 68   Min.   : 46   Min.   :1613  
##  1st Qu.:17   1st Qu.:4.0   1st Qu.:105   1st Qu.: 75   1st Qu.:2225  
##  Median :23   Median :4.0   Median :151   Median : 94   Median :2804  
##  Mean   :23   Mean   :5.5   Mean   :194   Mean   :104   Mean   :2978  
##  3rd Qu.:29   3rd Qu.:8.0   3rd Qu.:276   3rd Qu.:126   3rd Qu.:3615  
##  Max.   :47   Max.   :8.0   Max.   :455   Max.   :230   Max.   :5140  
##                                                                       
##   acceleration       year        origin                     name    
##  Min.   : 8.0   Min.   :70   Min.   :1.00   amc matador       :  5  
##  1st Qu.:13.8   1st Qu.:73   1st Qu.:1.00   ford pinto        :  5  
##  Median :15.5   Median :76   Median :1.00   toyota corolla    :  5  
##  Mean   :15.5   Mean   :76   Mean   :1.58   amc gremlin       :  4  
##  3rd Qu.:17.0   3rd Qu.:79   3rd Qu.:2.00   amc hornet        :  4  
##  Max.   :24.8   Max.   :82   Max.   :3.00   chevrolet chevette:  4  
##                                             (Other)           :365
{% endhighlight %}



{% highlight r %}
summary(auto$mpg)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       9      17      23      23      29      47
{% endhighlight %}



{% highlight r %}
mpg.medi=summary(auto$mpg)["Median"]
mpg01=rep(0,392)
mpg01[auto$mpg>mpg.medi]=1
sum(mpg01)
{% endhighlight %}



{% highlight text %}
## [1] 196
{% endhighlight %}



{% highlight r %}
auto01=data.frame(auto,mpg01)
pairs(auto01)
{% endhighlight %}

![plot of chunk autodata](../../figures/ISL-chapter-4/autodata-1.png) 

{% highlight r %}
# split training data
trn=(auto01$year<80)
sum(trn)
{% endhighlight %}



{% highlight text %}
## [1] 307
{% endhighlight %}



{% highlight r %}
auto80=auto01[!trn,]
mpg80=auto01$mpg01[!trn]
 
# perform LDA
library(MASS)
ldaout=lda(mpg01~horsepower+weight+acceleration,data=auto01,subset=trn)
ldaout
{% endhighlight %}



{% highlight text %}
## Call:
## lda(mpg01 ~ horsepower + weight + acceleration, data = auto01, 
##     subset = trn)
## 
## Prior probabilities of groups:
##    0    1 
## 0.62 0.38 
## 
## Group means:
##   horsepower weight acceleration
## 0        131   3631           15
## 1         79   2276           16
## 
## Coefficients of linear discriminants:
##                  LD1
## horsepower    0.0030
## weight       -0.0018
## acceleration  0.0156
{% endhighlight %}



{% highlight r %}
ldapro=predict(ldaout,auto80)
ldapre=ldapro$class
table(ldapre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## ldapre  0  1
##      0  4 14
##      1  1 66
{% endhighlight %}



{% highlight r %}
mean(ldapre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.82
{% endhighlight %}



{% highlight r %}
# perform QDA
qdaout=qda(mpg01~horsepower+weight+acceleration,data=auto01,subset=trn)
qdapro=predict(qdaout,auto80)
qdapre=qdapro$class
table(qdapre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## qdapre  0  1
##      0  5 11
##      1  0 69
{% endhighlight %}



{% highlight r %}
mean(qdapre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.87
{% endhighlight %}



{% highlight r %}
# perform logistic regression
glmout=glm(mpg01~horsepower+weight+acceleration,data=auto01,subset=trn,family=binomial)
summary(glmout)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## glm(formula = mpg01 ~ horsepower + weight + acceleration, family = binomial, 
##     data = auto01, subset = trn)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -2.142  -0.253  -0.018   0.298   3.412  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  14.89861    3.33064    4.47  7.7e-06 ***
## horsepower   -0.05341    0.02402   -2.22    0.026 *  
## weight       -0.00331    0.00068   -4.87  1.1e-06 ***
## acceleration -0.06447    0.14000   -0.46    0.645    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 407.08  on 306  degrees of freedom
## Residual deviance: 150.55  on 303  degrees of freedom
## AIC: 158.5
## 
## Number of Fisher Scoring iterations: 7
{% endhighlight %}



{% highlight r %}
glmpro=predict(glmout,auto80,type="response")
glmpre=rep(0,sum(!trn))
glmpre[glmpro>.5]=1
sum(glmpre)
{% endhighlight %}



{% highlight text %}
## [1] 63
{% endhighlight %}



{% highlight r %}
table(glmpre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## glmpre  0  1
##      0  5 17
##      1  0 63
{% endhighlight %}



{% highlight r %}
mean(glmpre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.8
{% endhighlight %}



{% highlight r %}
# perform KNN
library(class)
attach(auto01)
{% endhighlight %}



{% highlight text %}
## The following objects are masked from Auto:
## 
##     acceleration, cylinders, displacement, horsepower, mpg, name,
##     origin, weight, year
## 
## The following object is masked from package:ggplot2:
## 
##     mpg
{% endhighlight %}



{% highlight r %}
trnK=cbind(horsepower,weight,acceleration)[trn,]
tstK=cbind(horsepower,weight,acceleration)[!trn,]
trnD=mpg01[trn]
set.seed(1)
 
# K=1
knnpre=knn(trnK,tstK,trnD,k=1)
table(knnpre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## knnpre  0  1
##      0  5 19
##      1  0 61
{% endhighlight %}



{% highlight r %}
mean(knnpre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.78
{% endhighlight %}



{% highlight r %}
# K=3
knnpre=knn(trnK,tstK,trnD,k=3)
table(knnpre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## knnpre  0  1
##      0  5 30
##      1  0 50
{% endhighlight %}



{% highlight r %}
mean(knnpre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.65
{% endhighlight %}



{% highlight r %}
# K=5
knnpre=knn(trnK,tstK,trnD,k=7)
table(knnpre,mpg80)
{% endhighlight %}



{% highlight text %}
##       mpg80
## knnpre  0  1
##      0  5 24
##      1  0 56
{% endhighlight %}



{% highlight r %}
mean(knnpre==mpg80)
{% endhighlight %}



{% highlight text %}
## [1] 0.72
{% endhighlight %}
 
## Bài 12

{% highlight r %}
Power2=function(x,a){
 print(x^a) 
}
Power2(2,3)
{% endhighlight %}



{% highlight text %}
## [1] 8
{% endhighlight %}



{% highlight r %}
Power3=function(x,a){
  result=x^a
  return(result)
}
 
Power2(3,8)
{% endhighlight %}



{% highlight text %}
## [1] 6561
{% endhighlight %}



{% highlight r %}
plot(1:10,y=Power3(1:10,2),col=2,xlab="x",ylab="y=x^2")
{% endhighlight %}

![plot of chunk writing functions](../../figures/ISL-chapter-4/writing functions-1.png) 

{% highlight r %}
plot(1:10,y=Power3(1:10,2),col=2,xlab="x",ylab="y=x^2",log="x")
{% endhighlight %}

![plot of chunk writing functions](../../figures/ISL-chapter-4/writing functions-2.png) 

{% highlight r %}
plot(1:10,y=Power3(1:10,2),col=2,xlab="x",ylab="y=x^2",log="y")
{% endhighlight %}

![plot of chunk writing functions](../../figures/ISL-chapter-4/writing functions-3.png) 

{% highlight r %}
plot(1:10,y=Power3(1:10,2),col=2,xlab="x",ylab="y=x^2",log="xy")
{% endhighlight %}

![plot of chunk writing functions](../../figures/ISL-chapter-4/writing functions-4.png) 

{% highlight r %}
PlotPower=function(x,a){
  plot(x,Power3(x,a),xlab="x",ylab=paste("x^",a))
}
PlotPower(1:10,1.7)
{% endhighlight %}

![plot of chunk writing functions](../../figures/ISL-chapter-4/writing functions-5.png) 
