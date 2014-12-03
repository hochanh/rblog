---
layout: post
title: "Maximum Likelihood 2"
math: true
converted: yes
---
 
Maximizing a Normal Likelihood
 
## Công thức[^1]
 
Hàm 'log likelihood' của một phân phối chuẩn có dạng như sau:
 
$$l(\mu, \sigma)=-n \text{log}(2 \pi {\sigma}^2) - \frac{\sum_i (X_i-\mu)^2}{2 {\sigma}^2}$$
 
## Hàm chứa [^2]
 
Dựa vào công thức trên ta viết hàm chứa hàm 'log likelihood' như sau:
 

{% highlight r %}
make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
        params <- fixed
        function(p) {
                params[!fixed] <- p
                mu <- params[1]
                sigma <- params[2]
                a <- -0.5*length(data)*log(2*pi*sigma^2)
                b <- -0.5*sum((data-mu)^2) / (sigma^2)
                -(a + b)
        } 
}
{% endhighlight %}
 
Giống như [bài trước](../maximum-likelihood), chúng ta tạo một mẫu có phân phối chuẩn với các tham số định trước và "giả vờ" không biết những giá trị này để đi tìm chúng.
 

{% highlight r %}
set.seed(1); normals <- rnorm(100, 1, 2)
{% endhighlight %}
 
Chạy hàm chứa ở trên với đối số là mẫu vừa tạo.
 

{% highlight r %}
nLL <- make.NegLogLik(normals)
nLL
{% endhighlight %}



{% highlight text %}
## function(p) {
##                 params[!fixed] <- p
##                 mu <- params[1]
##                 sigma <- params[2]
##                 a <- -0.5*length(data)*log(2*pi*sigma^2)
##                 b <- -0.5*sum((data-mu)^2) / (sigma^2)
##                 -(a + b)
##         }
## <environment: 0xe35af40>
{% endhighlight %}



{% highlight r %}
ls(environment(nLL))
{% endhighlight %}



{% highlight text %}
## [1] "data"   "fixed"  "params"
{% endhighlight %}
 
Ước tính các tham số bằng hàm `optim()`
 

{% highlight r %}
optim(c(mu = 0, sigma = 1), nLL)$par
{% endhighlight %}



{% highlight text %}
##    mu sigma 
##   1.2   1.8
{% endhighlight %}
 
Cố định một tham số, tìm tham số còn lại
 
- Cố định $\sigma = 2$
 

{% highlight r %}
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum
{% endhighlight %}



{% highlight text %}
## [1] 1.2
{% endhighlight %}
 
- Cố định $\mu = 1$
 

{% highlight r %}
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum
{% endhighlight %}



{% highlight text %}
## [1] 1.8
{% endhighlight %}
 
Vẽ đồ thị biểu diễn 
 

{% highlight r %}
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
{% endhighlight %}

![plot of chunk unnamed-chunk-7](../../figures/maximum-likelihood-2/unnamed-chunk-7-1.png) 
 

{% highlight r %}
nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
{% endhighlight %}

![plot of chunk unnamed-chunk-8](../../figures/maximum-likelihood-2/unnamed-chunk-8-1.png) 
 
## Thư viện `stats4`
 

{% highlight r %}
library(stats4)
set.seed(1); normals <- rnorm(100, 1, 2)
nll <- function(sigma, mu) {
                a <- -0.5*length(normals)*log(2*pi*sigma^2)
                b <- -0.5*sum((normals-mu)^2) / (sigma^2)
                return(-(a + b))
        } 
 
mleout <- mle(minuslogl=nll,start=list(sigma=2,mu=2))
summary(mleout)
{% endhighlight %}



{% highlight text %}
## Maximum likelihood estimation
## 
## Call:
## mle(minuslogl = nll, start = list(sigma = 2, mu = 2))
## 
## Coefficients:
##       Estimate Std. Error
## sigma      1.8       0.13
## mu         1.2       0.18
## 
## -2 log L: 400
{% endhighlight %}
 
- Cố định $\sigma$
 

{% highlight r %}
nll <- function(sigma, mu) {
                a <- -0.5*length(normals)*log(2*pi*sigma^2)
                b <- -0.5*sum((normals-mu)^2) / (sigma^2)
                return(-(a + b))
        } 
mleout <- mle(minuslogl=nll,start=list(sigma=2,mu=2),fixed=list(sigma=2))
summary(mleout)
{% endhighlight %}



{% highlight text %}
## Maximum likelihood estimation
## 
## Call:
## mle(minuslogl = nll, start = list(sigma = 2, mu = 2), fixed = list(sigma = 2))
## 
## Coefficients:
##    Estimate Std. Error
## mu      1.2        0.2
## 
## -2 log L: 402
{% endhighlight %}
 
- Cố định $\mu$
 

{% highlight r %}
nll <- function(sigma, mu) {
                a <- -0.5*length(normals)*log(2*pi*sigma^2)
                b <- -0.5*sum((normals-mu)^2) / (sigma^2)
                return(-(a + b))
        } 
mleout <- mle(minuslogl=nll,start=list(sigma=2,mu=2),fixed=list(mu=1))
summary(mleout)
{% endhighlight %}



{% highlight text %}
## Maximum likelihood estimation
## 
## Call:
## mle(minuslogl = nll, start = list(sigma = 2, mu = 2), fixed = list(mu = 1))
## 
## Coefficients:
##       Estimate Std. Error
## sigma      1.8       0.13
## 
## -2 log L: 401
{% endhighlight %}
 
[^1]: Thạm khảo tại Larry Wasserman (2003), "All of Statistics"
 
[^2]: Xem thêm khóa R Programming, <https://www.coursera.org/course/rprog>
