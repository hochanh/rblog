---
layout: post
title: 'Maximum Likelihood'
math: true
converted: yes
---
 
Giả sử chúng ta có một mẫu ngẫu nhiên $X_1,\ldots,X_n$ có phân phối Gamma:
 
$$f_X(t)=\frac{1}{\Gamma(c)}\lambda^ct^{c-1}e^{-\lambda t}, \quad t>0$$
 
với c và $\lambda$ chưa biết. Làm thế nào để ước tính c và $\lambda$ từ $X_i$?
 
## Theo "Method of Moments"
 
Chúng ta có 2 tham số tổng thể cần ước tính là c và $\lambda$, vì vậy chúng ta cần 2 "moments" của X. Ở trường hợp này chúng ta chọn EX và Var(X). Phân phối Gamma có tính chất:
 
$$EX = \frac{c}{\lambda}$$
 
$$Var(X) = \frac{c}{\lambda^2}$$
 
Theo 'method of moments':
 
$$\frac{\hat{c}}{\hat{\lambda}}=\overline{X}$$
 
$$\frac{\hat{c}}{\hat{\lambda}^2}=s^2$$
 
Chia phương trình trên cho phương trình dưới ta được:
 
$$\hat{\lambda} = \frac{\overline{X}}{s^2}$$
 
$$\hat{c}=\frac{\overline{X}^2}{s^2}$$
 
 
## Theo "Maximum Likelihood"
 
Hàm 'likehood' là tích của các giá trị mật độ:
 
$$\begin{eqnarray} 
L & = & \prod_{i=1}^n\left[\frac{1}{\Gamma(c)} \lambda^c X_i^{c-1} e^{-\lambda X_i}\right] \\
  & = & [\lambda^c/\Gamma(c)]^n \left(\prod_{i=1}^n X_i\right)^{c-1} e^{-\lambda \sum_{i=1}^n X_i} \end{eqnarray}$$
 
Nói chung việc 'maximize likelihood' ở trên thường được thay bằng việc 'maximize the log likelihood', như dưới đây:
 
$$l = (c-1) \sum_{i=1}^n ln(X_i) - \lambda \sum_{i=1}^n X_i + nc \text{ln}(\lambda) - n \text{ln}(\Gamma(c))$$
 
Lời giải thuần túy toán học của việc tìm giá trị lớn nhất của $l$ ở trên là đạo hàm 2 vế theo c và $\lambda$ rồi cho bằng 0 để giải. 
 
Tuy nhiên chúng ta sẽ giải bằng R.
 
### Thư viện `stats4`
 
Đầu tiên chúng ta sẽ mô phỏng một mẫu có phân phối gamma với những tham số định trước, và "giả vờ" không biết những tham số này để đi tìm chúng.
 

{% highlight r %}
library(stats4)
 
set.seed(1);
x <- rgamma(100,shape=2) # Erlang, r = 2
n <- length(x)
 
ll <- function(c,lambda) {
loglik <- (c-1) * sum(log(x)) - sum(x)*lambda + n*c*log(lambda) -
n*log(gamma(c))
return(-loglik)
}
 
mleout <- mle(minuslogl=ll,start=list(c=2,lambda=2))
{% endhighlight %}



{% highlight text %}
## Warning in log(lambda): NaNs produced
{% endhighlight %}



{% highlight text %}
## Warning in log(lambda): NaNs produced
{% endhighlight %}



{% highlight text %}
## Warning in log(lambda): NaNs produced
{% endhighlight %}



{% highlight r %}
summary(mleout)
{% endhighlight %}



{% highlight text %}
## Maximum likelihood estimation
## 
## Call:
## mle(minuslogl = ll, start = list(c = 2, lambda = 2))
## 
## Coefficients:
##        Estimate Std. Error
## c           2.5       0.33
## lambda      1.3       0.19
## 
## -2 log L: 289
{% endhighlight %}
 
 
Ở đây chúng ta viết một hàm tính 'negative the log likelihood' có đối số là những tham số chúng ta cần nước tính. (Chú ý trong R log() là phép toán ln). 
 
`start=list(c=2,lambda=2)` là phép gán ước đoán ban đầu cho đối số.
 
Sai số chuẩn và các tham số sau khi ước tính được tính ra như trên.
 
Nếu muốn lấy thêm ma trận hiệp biến:
 

{% highlight r %}
solve(mleout@details$hessian)
{% endhighlight %}



{% highlight text %}
##            c lambda
## c      0.108  0.057
## lambda 0.057  0.038
{% endhighlight %}
 
Ngoài ra chúng ta còn có thể tự viết hàm dựa trên  các hàm tối ưu có sẵn trong thư viện `stats` như `optim()` hay `optimize()`.
