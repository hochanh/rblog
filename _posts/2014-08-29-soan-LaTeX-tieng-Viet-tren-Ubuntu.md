---
layout: post
title: "Soạn LaTeX tiếng Việt trên Ubuntu"
description: "Soạn LaTeX tiếng Việt trên Ubuntu"
tags: [ubuntu, LaTeX]
comments: true
share: true
---

Một số phần mềm soạn LaTeX trên Ubuntu phải kể đến như là Texmaker, Kile, Gummi,...

Tôi thì thích Gummi vì sự đơn giản của nó (đây cũng là lý do tôi chuyển sang Xubuntu cách đây không lâu).

Để cài đặt Texmaker dùng lệnh

{% highlight text %}
sudo apt-get install texmaker
{% endhighlight %}

Mặc định Texmaker không cài sẵn gói tiếng Việt, bạn phải cài thêm vào:

{% highlight text %}
sudo apt-get install texlive-lang-vietnamese
{% endhighlight %}

Tất nhiên, để gõ được tiếng Việt, tôi mặc định bạn đã có ibus-unikey.

{% highlight text %}
sudo apt-get install ibus-unikey
{% endhighlight %}


Tôi cũng khuyến cáo cài thêm bộ phông "được khuyến cáo":

{% highlight text %}
sudo apt-get install texlive-fonts-recommended
{% endhighlight %}

Đây là nội dung một tệp tex bằng tiếng Việt đơn giản:

{% highlight tex %}
\documentclass[11pt]{article}
\usepackage[utf8]{vietnam}
\begin{document}

Tiếng Việt

\end{document}

{% endhighlight %}