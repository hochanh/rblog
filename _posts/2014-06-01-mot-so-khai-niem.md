---
layout: post
title: Một số khái niệm
math: true
---

Ôn bài.[^1]

## 1. expected value

giá trị kì vọng

## 2. variance

phương sai

## 3. distribution

phân phối
	
### 3.1 cdf

"cumulative distribution function": hàm phân phối lũy kế

Với biến ngẫu nhiên X bất kỳ,

> $$F_W(t) = P(W \le t), \qquad -\infty <t< \infty$$

### 3.2 pmf

"probability mass function": hàm khối lượng xác suất

Với X là biến ngẫu nhiên rời rạc,

> $$p_V(k) = P(V=k)$$

### 3.3 density function

hàm mật độ xác suất

Với X là biến ngẫu nhiên liên tục,

> $$f_X(t) = \frac{d}{dt}F_X(t), \qquad -\infty <t< \infty$$

> $$P(X \text{ in } A) = \int_A f_X(s)ds $$

## 4. famous parametric families of distributions:

các hàm phân phối quen thuộc

### 4.1 discrete: rời rạc

- geometric: hình học

> $$p_N(k) = (1-p)^{k}p$$

- binomial: nhị phân

> $$p_N(k) = {n \choose k}p^k(1-p)^{n-k}$$

- Poisson

> $$p_N(k) = {e^\lambda\lambda^k \over k!}, \quad k=0,1,2,\ldots $$

- negative binomial: đối nhị phân (?)

> $$p_N(k) = {k-1 \choose r-1}(1-p)^{k-r}p^r, \quad k = r,r+1, \ldots$$

### 4.2 continuous: liên tục

- uniform: đều

> $$f_X(t) = \frac{1}{r-q}, \qquad q<t<r$$

- normal (Gaussian):[^2] chuẩn

> $$f_X(t) = \frac{1}{\sqrt{2\pi}\sigma} e^{-0.5\left(t-\mu \over \sigma\right)^2} ,\qquad -\infty<t<\infty$$

- exponential:[^3] mũ

> $$ f_X(t) = \lambda e^{-\lambda t}, \quad 0<t<\infty$$

- gamma

> $$f_X(t) = \frac{1}{\Gamma(r)}\lambda^rt^{r-1}e^{-\lambda}, \; t>0$$

## 5. iterated expected values

hàm kỳ vọng lặp

- Với U rời rạc

> $$E(V) = \sum_cP(U=c)E(V \vert U=c)$$

- Với V liên tục

> $$E(W) = \int_{-\infty}^{\infty}f_V(t)E(W \vert V=t)dt$$

[^1]: <http://heather.cs.ucdavis.edu/~matloff/probstatbook.html>

[^2]: "Bell-shaped curves"

[^3]: Memoryless!
