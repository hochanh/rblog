---
layout: post
title: "Simpson's Paradox"
math: true
converted: yes
---
 
Một ví dụ về Nghịch lý Simpson là số liệu về UC Berkeley Graduate Admission[^1].
 
## Bài toán số học:
 
Dữ liệu về số hồ sơ được chấp nhận vào học và số hồ sơ bị từ chối tại trường UC Berkeley được cho như sau:
 

{% highlight r %}
ucb <- UCBAdmissions
apply(ucb, c(1,2), sum)
{% endhighlight %}



{% highlight text %}
##           Gender
## Admit      Male Female
##   Admitted 1198    557
##   Rejected 1493   1278
{% endhighlight %}
 
Đã có một vụ kiện do nghi vấn có sự phân biệt đối xử với phụ nữ với lí do tỉ lệ chấp nhận hồ sơ trên tổng số hồ sơ đăng ký đối với nam và nữ lần lượt là 44% và 30%.
 

{% highlight r %}
apply(ucb, 2, function(x) sum(x[1,]) / sum(x[1:12]) * 100)
{% endhighlight %}



{% highlight text %}
##   Male Female 
##     45     30
{% endhighlight %}
 
Tuy nhiên nghi vấn này đã bị bác bỏ khi đưa thêm biến số "Department" vào phân tích.
 
Tỉ lệ chấp nhận hồ sơ tính theo khoa đối với nam và nữ bây giờ là:
 

{% highlight r %}
apply(ucb, 3, function(x) c(Male=x[1] / sum(x[1:2]),
                            Female=x[3] / sum(x[3:4])))
{% endhighlight %}



{% highlight text %}
##         Dept
##             A    B    C    D    E     F
##   Male   0.62 0.63 0.37 0.33 0.28 0.059
##   Female 0.82 0.68 0.34 0.35 0.24 0.070
{% endhighlight %}
 
Dễ thấy chỉ có 2/6 khoa trong trường (khoa C và khoa E) là có tỉ lệ chấp nhận nữ ít hơn nam. Điều này có thể dễ dàng lý giải qua số hồ sơ đăng ký vào từng khoa như sau:
 

{% highlight r %}
apply(ucb, c(2,3), sum)
{% endhighlight %}



{% highlight text %}
##         Dept
## Gender     A   B   C   D   E   F
##   Male   825 560 325 417 191 373
##   Female 108  25 593 375 393 341
{% endhighlight %}
Lý giải nôm na, nghịch lý Simpson thực ra là nghịch lý số học đơn giản:
 
Có 
 
$$a/b < c/d$$ 
 
và 
 
$$e/f < g/h$$ 
 
nhưng lại có:
 
$$(a+e)/(b+f) > (c+g)/(d+h)$$
 
Chẳng hạn, ta có 
 
$$1/10 = 100/1000 < 100/910$$ 
 
và 
 
$$700/1000 = 70/100 < 71/100$$ 
 
nhưng:
 
$$(1+700)/(10+1000)=701/1010 > 171/1010 = (100+71)/(910+100)$$
 
Trong ví dụ này, mặc dù theo hầu hết các khoa, tỉ lệ nhận hồ sơ của phụ nữ lớn hơn nam giới, nhưng tổng cộng toàn trường thì xu hướng đã đảo ngược.
 
## Bài toán thống kê:
 
Chúng ta xét tiếp ví dụ trên với đao to búa lớn hơn: Phân tích "log-linear".
 
Ta áp dụng mô hình gồm tất cả các quan hệ 2 chiều vào dữ liệu ở trên như sau:
 

{% highlight r %}
llm <- loglin(ucb, list(1:2, c(1,3), 2:3), param=T)
{% endhighlight %}



{% highlight text %}
## 9 iterations: deviation 0.049
{% endhighlight %}



{% highlight r %}
llm$param
{% endhighlight %}



{% highlight text %}
## $`(Intercept)`
## [1] 4.8
## 
## $Admit
## Admitted Rejected 
##    -0.32     0.32 
## 
## $Gender
##   Male Female 
##   0.33  -0.33 
## 
## $Dept
##      A      B      C      D      E      F 
##  0.154 -0.765  0.540  0.430 -0.029 -0.330 
## 
## $Admit.Gender
##           Gender
## Admit        Male Female
##   Admitted -0.025  0.025
##   Rejected  0.025 -0.025
## 
## $Admit.Dept
##           Dept
## Admit          A     B       C     D     E  F
##   Admitted  0.64  0.62  0.0059 -0.01 -0.23 -1
##   Rejected -0.64 -0.62 -0.0059  0.01  0.23  1
## 
## $Gender.Dept
##         Dept
## Gender      A    B     C     D    E     F
##   Male    0.7  1.2 -0.64 -0.28 -0.7 -0.31
##   Female -0.7 -1.2  0.64  0.28  0.7  0.31
{% endhighlight %}
 
Ảnh hưởng cơ sở của giới tính là $\pm 0.3287569$, tương đối nhỏ so với ảnh hưởng cơ sở của một số khoa. Chứng tỏ rằng một số khoa thu hút nhiều hồ sơ đăng ký, đáng chú ý như khoa C, trong lúc một số khoa khác như F thu hút ít hồ sơ hơn. Điều này cho thấy cần phải đưa biến số Dept vào phân tích.
 
Đối với các mối quan hệ 2 chiều, xem xét ảnh hưởng giữa Admit và Dept. Số hồ sơ đăng ký Admit có ảnh hưởng mạnh theo chiều thuận (+) với khoa A, B, ảnh hưởng nhỏ với khoa C, D và ảnh hưởng nghịch từ trung bình đến mạnh đối với các khoa E, F. Nói cách khác, các khoa A, B rất dễ xin vào trong lúc 2 khoa E, F thì đặc biệt khó.
 
Xem xét ảnh hưởng giữa Gender và Dept, ta thấy được những Khoa mà mỗi Giới đăng kí vào. Nam giới có vẻ như rất thích đăng ký vào khoa A, B, trong lúc đó nữ giới thích khoa C, D, E, F. Nói cách khác, nam giới thường đăng ký vào khoa dễ trong lúc nữ giới lại thích những khoa khó hơn! Chả trách tổng cộng lại tỉ lệ nữ được nhận vào học lại thấp hơn nam (!).
 
**Kết luận:** Nói chung, khả năng được nhận vào học của nữ giới là nhỉnh hơn nam giới.
 
[^1]: <http://en.wikipedia.org/wiki/Simpson's_paradox>
