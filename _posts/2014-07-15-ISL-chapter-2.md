---
layout: post
title: "ISL: Chapter 2"
converted: yes
---
 
## `College`
 

{% highlight r %}
# fileUrl <- "http://www-bcf.usc.edu/~gareth/ISL/College.csv"
# download.file(fileUrl,destfile="./ISL/College.csv")
 
college <- read.csv('./ISL/College.csv')
rownames(college)=college[,1]
college=college[,-1]
summary(college)
{% endhighlight %}



{% highlight text %}
##  Private        Apps           Accept          Enroll       Top10perc 
##  No :212   Min.   :   81   Min.   :   72   Min.   :  35   Min.   : 1  
##  Yes:565   1st Qu.:  776   1st Qu.:  604   1st Qu.: 242   1st Qu.:15  
##            Median : 1558   Median : 1110   Median : 434   Median :23  
##            Mean   : 3002   Mean   : 2019   Mean   : 780   Mean   :28  
##            3rd Qu.: 3624   3rd Qu.: 2424   3rd Qu.: 902   3rd Qu.:35  
##            Max.   :48094   Max.   :26330   Max.   :6392   Max.   :96  
##    Top25perc    F.Undergrad     P.Undergrad       Outstate    
##  Min.   :  9   Min.   :  139   Min.   :    1   Min.   : 2340  
##  1st Qu.: 41   1st Qu.:  992   1st Qu.:   95   1st Qu.: 7320  
##  Median : 54   Median : 1707   Median :  353   Median : 9990  
##  Mean   : 56   Mean   : 3700   Mean   :  855   Mean   :10441  
##  3rd Qu.: 69   3rd Qu.: 4005   3rd Qu.:  967   3rd Qu.:12925  
##  Max.   :100   Max.   :31643   Max.   :21836   Max.   :21700  
##    Room.Board       Books         Personal         PhD         Terminal  
##  Min.   :1780   Min.   :  96   Min.   : 250   Min.   :  8   Min.   : 24  
##  1st Qu.:3597   1st Qu.: 470   1st Qu.: 850   1st Qu.: 62   1st Qu.: 71  
##  Median :4200   Median : 500   Median :1200   Median : 75   Median : 82  
##  Mean   :4358   Mean   : 549   Mean   :1341   Mean   : 73   Mean   : 80  
##  3rd Qu.:5050   3rd Qu.: 600   3rd Qu.:1700   3rd Qu.: 85   3rd Qu.: 92  
##  Max.   :8124   Max.   :2340   Max.   :6800   Max.   :103   Max.   :100  
##    S.F.Ratio   perc.alumni     Expend        Grad.Rate  
##  Min.   : 2   Min.   : 0   Min.   : 3186   Min.   : 10  
##  1st Qu.:12   1st Qu.:13   1st Qu.: 6751   1st Qu.: 53  
##  Median :14   Median :21   Median : 8377   Median : 65  
##  Mean   :14   Mean   :23   Mean   : 9660   Mean   : 65  
##  3rd Qu.:16   3rd Qu.:31   3rd Qu.:10830   3rd Qu.: 78  
##  Max.   :40   Max.   :64   Max.   :56233   Max.   :118
{% endhighlight %}



{% highlight r %}
# pairs(college)
pairs(college[,1:10])
{% endhighlight %}

![plot of chunk download and read data](../../figures/ISL-chapter-2/download and read data-1.png) 

{% highlight r %}
pairs(college[,1:5])
{% endhighlight %}

![plot of chunk download and read data](../../figures/ISL-chapter-2/download and read data-2.png) 

{% highlight r %}
attach(college)
Private <- as.factor(Private)
plot(Private,Outstate,xlab="Private",ylab="Outstate",varwidth=T)
{% endhighlight %}

![plot of chunk download and read data](../../figures/ISL-chapter-2/download and read data-3.png) 
 

{% highlight r %}
Elite=rep("No",nrow(college))
Elite[college$Top10perc > 50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college,Elite)
summary(Elite)
{% endhighlight %}



{% highlight text %}
##  No Yes 
## 699  78
{% endhighlight %}



{% highlight r %}
plot(Elite,Outstate,xlab="Elite",ylab="Outstate",varwidth=T)
{% endhighlight %}

![plot of chunk create Elite](../../figures/ISL-chapter-2/create Elite-1.png) 
 

{% highlight r %}
par(mfrow=c(2,2))
hist(Books, breaks=30,col=1)
hist(Apps, breaks=30,col=2)
hist(Personal, breaks=30,col=3)
hist(Room.Board, breaks=30,col=4)
{% endhighlight %}

![plot of chunk histogram](../../figures/ISL-chapter-2/histogram-1.png) 
 
 
## `Boston`
 

{% highlight r %}
library(MASS)
# pairs(Boston)
pairs(Boston[,c(5:8,10:14)])
{% endhighlight %}

![plot of chunk boston](../../figures/ISL-chapter-2/boston-1.png) 

{% highlight r %}
attach(Boston)
plot(medv,lstat)
{% endhighlight %}

![plot of chunk boston](../../figures/ISL-chapter-2/boston-2.png) 

{% highlight r %}
plot(medv,rm,col=2,pch=2)
{% endhighlight %}

![plot of chunk boston](../../figures/ISL-chapter-2/boston-3.png) 

{% highlight r %}
plot(medv,nox,col=4,pch=4)
{% endhighlight %}

![plot of chunk boston](../../figures/ISL-chapter-2/boston-4.png) 

{% highlight r %}
B8 = Boston[(Boston$rm>8),]
summary(B8)
{% endhighlight %}



{% highlight text %}
##       crim           zn         indus           chas           nox      
##  Min.   :0.0   Min.   : 0   Min.   : 2.7   Min.   :0.00   Min.   :0.42  
##  1st Qu.:0.3   1st Qu.: 0   1st Qu.: 4.0   1st Qu.:0.00   1st Qu.:0.50  
##  Median :0.5   Median : 0   Median : 6.2   Median :0.00   Median :0.51  
##  Mean   :0.7   Mean   :14   Mean   : 7.1   Mean   :0.15   Mean   :0.54  
##  3rd Qu.:0.6   3rd Qu.:20   3rd Qu.: 6.2   3rd Qu.:0.00   3rd Qu.:0.60  
##  Max.   :3.5   Max.   :95   Max.   :19.6   Max.   :1.00   Max.   :0.72  
##        rm           age          dis           rad            tax     
##  Min.   :8.0   Min.   : 8   Min.   :1.8   Min.   : 2.0   Min.   :224  
##  1st Qu.:8.2   1st Qu.:70   1st Qu.:2.3   1st Qu.: 5.0   1st Qu.:264  
##  Median :8.3   Median :78   Median :2.9   Median : 7.0   Median :307  
##  Mean   :8.3   Mean   :72   Mean   :3.4   Mean   : 7.5   Mean   :325  
##  3rd Qu.:8.4   3rd Qu.:86   3rd Qu.:3.7   3rd Qu.: 8.0   3rd Qu.:307  
##  Max.   :8.8   Max.   :94   Max.   :8.9   Max.   :24.0   Max.   :666  
##     ptratio         black         lstat          medv   
##  Min.   :13.0   Min.   :355   Min.   :2.5   Min.   :22  
##  1st Qu.:14.7   1st Qu.:385   1st Qu.:3.3   1st Qu.:42  
##  Median :17.4   Median :387   Median :4.1   Median :48  
##  Mean   :16.4   Mean   :385   Mean   :4.3   Mean   :44  
##  3rd Qu.:17.4   3rd Qu.:390   3rd Qu.:5.1   3rd Qu.:50  
##  Max.   :20.2   Max.   :397   Max.   :7.4   Max.   :50
{% endhighlight %}
