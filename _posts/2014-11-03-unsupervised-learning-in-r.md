---
layout: post
title: Unsupervised Learning
converted: yes
---
 
## Principal Components Analysis

{% highlight r %}
states=row.names(USArrests)
states
{% endhighlight %}



{% highlight text %}
##  [1] "Alabama"        "Alaska"         "Arizona"        "Arkansas"      
##  [5] "California"     "Colorado"       "Connecticut"    "Delaware"      
##  [9] "Florida"        "Georgia"        "Hawaii"         "Idaho"         
## [13] "Illinois"       "Indiana"        "Iowa"           "Kansas"        
## [17] "Kentucky"       "Louisiana"      "Maine"          "Maryland"      
## [21] "Massachusetts"  "Michigan"       "Minnesota"      "Mississippi"   
## [25] "Missouri"       "Montana"        "Nebraska"       "Nevada"        
## [29] "New Hampshire"  "New Jersey"     "New Mexico"     "New York"      
## [33] "North Carolina" "North Dakota"   "Ohio"           "Oklahoma"      
## [37] "Oregon"         "Pennsylvania"   "Rhode Island"   "South Carolina"
## [41] "South Dakota"   "Tennessee"      "Texas"          "Utah"          
## [45] "Vermont"        "Virginia"       "Washington"     "West Virginia" 
## [49] "Wisconsin"      "Wyoming"
{% endhighlight %}



{% highlight r %}
names(USArrests)
{% endhighlight %}



{% highlight text %}
## [1] "Murder"   "Assault"  "UrbanPop" "Rape"
{% endhighlight %}



{% highlight r %}
apply(USArrests, 2, mean)
{% endhighlight %}



{% highlight text %}
##   Murder  Assault UrbanPop     Rape 
##      7.8    170.8     65.5     21.2
{% endhighlight %}



{% highlight r %}
apply(USArrests, 2, var)
{% endhighlight %}



{% highlight text %}
##   Murder  Assault UrbanPop     Rape 
##       19     6945      210       88
{% endhighlight %}



{% highlight r %}
pr.out=prcomp(USArrests, scale=TRUE)
names(pr.out)
{% endhighlight %}



{% highlight text %}
## [1] "sdev"     "rotation" "center"   "scale"    "x"
{% endhighlight %}



{% highlight r %}
pr.out$center
{% endhighlight %}



{% highlight text %}
##   Murder  Assault UrbanPop     Rape 
##      7.8    170.8     65.5     21.2
{% endhighlight %}



{% highlight r %}
pr.out$scale
{% endhighlight %}



{% highlight text %}
##   Murder  Assault UrbanPop     Rape 
##      4.4     83.3     14.5      9.4
{% endhighlight %}



{% highlight r %}
pr.out$rotation
{% endhighlight %}



{% highlight text %}
##            PC1   PC2   PC3    PC4
## Murder   -0.54  0.42 -0.34  0.649
## Assault  -0.58  0.19 -0.27 -0.743
## UrbanPop -0.28 -0.87 -0.38  0.134
## Rape     -0.54 -0.17  0.82  0.089
{% endhighlight %}



{% highlight r %}
dim(pr.out$x)
{% endhighlight %}



{% highlight text %}
## [1] 50  4
{% endhighlight %}



{% highlight r %}
biplot(pr.out, scale=0)
{% endhighlight %}

![plot of chunk pca](../../figures/unsupervised-learning-in-r/pca-1.png) 

{% highlight r %}
pr.out$rotation=-pr.out$rotation
pr.out$x=-pr.out$x
biplot(pr.out, scale=0)
{% endhighlight %}

![plot of chunk pca](../../figures/unsupervised-learning-in-r/pca-2.png) 

{% highlight r %}
pr.out$sdev
{% endhighlight %}



{% highlight text %}
## [1] 1.57 0.99 0.60 0.42
{% endhighlight %}



{% highlight r %}
pr.var=pr.out$sdev^2
pr.var
{% endhighlight %}



{% highlight text %}
## [1] 2.48 0.99 0.36 0.17
{% endhighlight %}



{% highlight r %}
pve=pr.var/sum(pr.var)
pve
{% endhighlight %}



{% highlight text %}
## [1] 0.620 0.247 0.089 0.043
{% endhighlight %}



{% highlight r %}
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')
{% endhighlight %}

![plot of chunk pca](../../figures/unsupervised-learning-in-r/pca-3.png) 

{% highlight r %}
plot(cumsum(pve), xlab="Principal Component", ylab="Cumulative Proportion of Variance Explained", ylim=c(0,1),type='b')
{% endhighlight %}

![plot of chunk pca](../../figures/unsupervised-learning-in-r/pca-4.png) 

{% highlight r %}
a=c(1,2,8,-3)
cumsum(a)
{% endhighlight %}



{% highlight text %}
## [1]  1  3 11  8
{% endhighlight %}
 
## Clustering
 
### K-Means Clustering

{% highlight r %}
set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
km.out=kmeans(x,2,nstart=20)
km.out$cluster
{% endhighlight %}



{% highlight text %}
##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
{% endhighlight %}



{% highlight r %}
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=2", xlab="", ylab="", pch=20, cex=2)
{% endhighlight %}

![plot of chunk kmc](../../figures/unsupervised-learning-in-r/kmc-1.png) 

{% highlight r %}
set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out
{% endhighlight %}



{% highlight text %}
## K-means clustering with 3 clusters of sizes 10, 23, 17
## 
## Cluster means:
##    [,1]   [,2]
## 1  2.30 -2.696
## 2 -0.38 -0.087
## 3  3.78 -4.562
## 
## Clustering vector:
##  [1] 3 1 3 1 3 3 3 1 3 1 3 1 3 1 3 1 3 3 3 3 3 1 3 3 3 2 2 2 2 2 2 2 2 2 2
## [36] 2 2 2 2 2 2 2 2 1 2 1 2 2 2 2
## 
## Within cluster sum of squares by cluster:
## [1] 20 53 26
##  (between_SS / total_SS =  79.3 %)
## 
## Available components:
## 
## [1] "cluster"      "centers"      "totss"        "withinss"    
## [5] "tot.withinss" "betweenss"    "size"         "iter"        
## [9] "ifault"
{% endhighlight %}



{% highlight r %}
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)
{% endhighlight %}

![plot of chunk kmc](../../figures/unsupervised-learning-in-r/kmc-2.png) 

{% highlight r %}
set.seed(3)
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
{% endhighlight %}



{% highlight text %}
## [1] 104
{% endhighlight %}



{% highlight r %}
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss
{% endhighlight %}



{% highlight text %}
## [1] 98
{% endhighlight %}
 
### Hierarchical Clustering

{% highlight r %}
hc.complete=hclust(dist(x), method="complete")
hc.average=hclust(dist(x), method="average")
hc.single=hclust(dist(x), method="single")
par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)
{% endhighlight %}

![plot of chunk hc](../../figures/unsupervised-learning-in-r/hc-1.png) 

{% highlight r %}
cutree(hc.complete, 2)
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2
## [36] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
{% endhighlight %}



{% highlight r %}
cutree(hc.average, 2)
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 1 2 2
## [36] 2 2 2 2 2 2 2 2 1 2 1 2 2 2 2
{% endhighlight %}



{% highlight r %}
cutree(hc.single, 2)
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
{% endhighlight %}



{% highlight r %}
cutree(hc.single, 4)
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3
## [36] 3 3 3 3 3 3 4 3 3 3 3 3 3 3 3
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,1))
xsc=scale(x)
plot(hclust(dist(xsc), method="complete"), main="Hierarchical Clustering with Scaled Features")
{% endhighlight %}

![plot of chunk hc](../../figures/unsupervised-learning-in-r/hc-2.png) 

{% highlight r %}
x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))
plot(hclust(dd, method="complete"), main="Complete Linkage with Correlation-Based Distance", xlab="", sub="")
{% endhighlight %}

![plot of chunk hc](../../figures/unsupervised-learning-in-r/hc-3.png) 
 
## Ví dụ: Số liệu NCI60
 
### The NCI60 data

{% highlight r %}
library(ISLR)
nci.labs=NCI60$labs
nci.data=NCI60$data
dim(nci.data)
{% endhighlight %}



{% highlight text %}
## [1]   64 6830
{% endhighlight %}



{% highlight r %}
nci.labs[1:4]
{% endhighlight %}



{% highlight text %}
## [1] "CNS"   "CNS"   "CNS"   "RENAL"
{% endhighlight %}



{% highlight r %}
table(nci.labs)
{% endhighlight %}



{% highlight text %}
## nci.labs
##      BREAST         CNS       COLON K562A-repro K562B-repro    LEUKEMIA 
##           7           5           7           1           1           6 
## MCF7A-repro MCF7D-repro    MELANOMA       NSCLC     OVARIAN    PROSTATE 
##           1           1           8           9           6           2 
##       RENAL     UNKNOWN 
##           9           1
{% endhighlight %}
 
#### PCA on the NCI60 Data

{% highlight r %}
pr.out=prcomp(nci.data, scale=TRUE)
Cols=function(vec){
    cols=rainbow(length(unique(vec)))
    return(cols[as.numeric(as.factor(vec))])
  }
par(mfrow=c(1,2))
plot(pr.out$x[,1:2], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z2")
plot(pr.out$x[,c(1,3)], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z3")
{% endhighlight %}

![plot of chunk pca nci60](../../figures/unsupervised-learning-in-r/pca nci60-1.png) 

{% highlight r %}
summary(pr.out)
{% endhighlight %}



{% highlight text %}
## Importance of components:
##                           PC1     PC2     PC3     PC4     PC5     PC6
## Standard deviation     27.853 21.4814 19.8205 17.0326 15.9718 15.7211
## Proportion of Variance  0.114  0.0676  0.0575  0.0425  0.0374  0.0362
## Cumulative Proportion   0.114  0.1812  0.2387  0.2812  0.3185  0.3547
##                            PC7     PC8     PC9    PC10    PC11    PC12
## Standard deviation     14.4715 13.5443 13.1440 12.7386 12.6867 12.1577
## Proportion of Variance  0.0307  0.0269  0.0253  0.0238  0.0236  0.0216
## Cumulative Proportion   0.3853  0.4122  0.4375  0.4613  0.4848  0.5065
##                           PC13    PC14    PC15    PC16    PC17    PC18
## Standard deviation     11.8302 11.6255 11.4378 11.0005 10.6567 10.4888
## Proportion of Variance  0.0205  0.0198  0.0192  0.0177  0.0166  0.0161
## Cumulative Proportion   0.5270  0.5467  0.5659  0.5836  0.6002  0.6163
##                           PC19    PC20    PC21    PC22   PC23   PC24
## Standard deviation     10.4352 10.3219 10.1461 10.0544 9.9027 9.6477
## Proportion of Variance  0.0159  0.0156  0.0151  0.0148 0.0144 0.0136
## Cumulative Proportion   0.6323  0.6479  0.6630  0.6778 0.6921 0.7057
##                          PC25   PC26   PC27   PC28   PC29   PC30   PC31
## Standard deviation     9.5076 9.3325 9.2732 9.0900 8.9812 8.7500 8.5996
## Proportion of Variance 0.0132 0.0127 0.0126 0.0121 0.0118 0.0112 0.0108
## Cumulative Proportion  0.7190 0.7317 0.7443 0.7564 0.7682 0.7794 0.7903
##                          PC32   PC33    PC34    PC35    PC36    PC37
## Standard deviation     8.4474 8.3730 8.21579 8.15731 7.97465 7.90446
## Proportion of Variance 0.0104 0.0103 0.00988 0.00974 0.00931 0.00915
## Cumulative Proportion  0.8007 0.8110 0.82087 0.83061 0.83992 0.84907
##                           PC38    PC39    PC40    PC41   PC42    PC43
## Standard deviation     7.82127 7.72156 7.58603 7.45619 7.3444 7.10449
## Proportion of Variance 0.00896 0.00873 0.00843 0.00814 0.0079 0.00739
## Cumulative Proportion  0.85803 0.86676 0.87518 0.88332 0.8912 0.89861
##                          PC44    PC45   PC46    PC47    PC48    PC49
## Standard deviation     7.0131 6.95839 6.8663 6.80744 6.64763 6.61607
## Proportion of Variance 0.0072 0.00709 0.0069 0.00678 0.00647 0.00641
## Cumulative Proportion  0.9058 0.91290 0.9198 0.92659 0.93306 0.93947
##                           PC50    PC51    PC52    PC53    PC54    PC55
## Standard deviation     6.40793 6.21984 6.20326 6.06706 5.91805 5.91233
## Proportion of Variance 0.00601 0.00566 0.00563 0.00539 0.00513 0.00512
## Cumulative Proportion  0.94548 0.95114 0.95678 0.96216 0.96729 0.97241
##                           PC56    PC57   PC58    PC59    PC60    PC61
## Standard deviation     5.73539 5.47261 5.2921 5.02117 4.68398 4.17567
## Proportion of Variance 0.00482 0.00438 0.0041 0.00369 0.00321 0.00255
## Cumulative Proportion  0.97723 0.98161 0.9857 0.98940 0.99262 0.99517
##                           PC62    PC63     PC64
## Standard deviation     4.08212 4.04124 2.15e-14
## Proportion of Variance 0.00244 0.00239 0.00e+00
## Cumulative Proportion  0.99761 1.00000 1.00e+00
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,1))
plot(pr.out)
{% endhighlight %}

![plot of chunk pca nci60](../../figures/unsupervised-learning-in-r/pca nci60-2.png) 

{% highlight r %}
pve=100*pr.out$sdev^2/sum(pr.out$sdev^2)
par(mfrow=c(1,2))
plot(pve,  type="o", ylab="PVE", xlab="Principal Component", col="blue")
plot(cumsum(pve), type="o", ylab="Cumulative PVE", xlab="Principal Component", col="brown3")
{% endhighlight %}

![plot of chunk pca nci60](../../figures/unsupervised-learning-in-r/pca nci60-3.png) 
 
#### Clustering the Observations of the NCI60 Data

{% highlight r %}
sd.data=scale(nci.data)
par(mfrow=c(1,3))
data.dist=dist(sd.data)
plot(hclust(data.dist), labels=nci.labs, main="Complete Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="average"), labels=nci.labs, main="Average Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="single"), labels=nci.labs,  main="Single Linkage", xlab="", sub="",ylab="")
{% endhighlight %}

![plot of chunk clustering nci60](../../figures/unsupervised-learning-in-r/clustering nci60-1.png) 

{% highlight r %}
hc.out=hclust(dist(sd.data))
hc.clusters=cutree(hc.out,4)
table(hc.clusters,nci.labs)
{% endhighlight %}



{% highlight text %}
##            nci.labs
## hc.clusters BREAST CNS COLON K562A-repro K562B-repro LEUKEMIA MCF7A-repro
##           1      2   3     2           0           0        0           0
##           2      3   2     0           0           0        0           0
##           3      0   0     0           1           1        6           0
##           4      2   0     5           0           0        0           1
##            nci.labs
## hc.clusters MCF7D-repro MELANOMA NSCLC OVARIAN PROSTATE RENAL UNKNOWN
##           1           0        8     8       6        2     8       1
##           2           0        0     1       0        0     1       0
##           3           0        0     0       0        0     0       0
##           4           1        0     0       0        0     0       0
{% endhighlight %}



{% highlight r %}
par(mfrow=c(1,1))
plot(hc.out, labels=nci.labs)
abline(h=139, col="red")
{% endhighlight %}

![plot of chunk clustering nci60](../../figures/unsupervised-learning-in-r/clustering nci60-2.png) 

{% highlight r %}
hc.out
{% endhighlight %}



{% highlight text %}
## 
## Call:
## hclust(d = dist(sd.data))
## 
## Cluster method   : complete 
## Distance         : euclidean 
## Number of objects: 64
{% endhighlight %}



{% highlight r %}
set.seed(2)
km.out=kmeans(sd.data, 4, nstart=20)
km.clusters=km.out$cluster
table(km.clusters,hc.clusters)
{% endhighlight %}



{% highlight text %}
##            hc.clusters
## km.clusters  1  2  3  4
##           1 11  0  0  9
##           2  0  0  8  0
##           3  9  0  0  0
##           4 20  7  0  0
{% endhighlight %}



{% highlight r %}
hc.out=hclust(dist(pr.out$x[,1:5]))
plot(hc.out, labels=nci.labs, main="Hier. Clust. on First Five Score Vectors")
{% endhighlight %}

![plot of chunk clustering nci60](../../figures/unsupervised-learning-in-r/clustering nci60-3.png) 

{% highlight r %}
table(cutree(hc.out,4), nci.labs)
{% endhighlight %}



{% highlight text %}
##    nci.labs
##     BREAST CNS COLON K562A-repro K562B-repro LEUKEMIA MCF7A-repro
##   1      0   2     7           0           0        2           0
##   2      5   3     0           0           0        0           0
##   3      0   0     0           1           1        4           0
##   4      2   0     0           0           0        0           1
##    nci.labs
##     MCF7D-repro MELANOMA NSCLC OVARIAN PROSTATE RENAL UNKNOWN
##   1           0        1     8       5        2     7       0
##   2           0        7     1       1        0     2       1
##   3           0        0     0       0        0     0       0
##   4           1        0     0       0        0     0       0
{% endhighlight %}
