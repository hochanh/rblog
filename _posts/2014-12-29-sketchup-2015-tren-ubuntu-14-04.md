---
layout: post
title: "SketchUp 2015 trên Ubuntu 14.04"
---

## Cài Wine

~~~bash
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install wine1.7
~~~

## Tải SketchUp 2015

~~~bash
http://www.sketchup.com/download
~~~

## Tải thư viện `mfc100u`

- Tải tệp [tại đây](http://raw.githubusercontent.com/hochanh/rblog/gh-pages/_knitr/files/mfc100u.dll).

- Copy vào `system32`.

## Chạy SketchUp

~~~bash
wine "C:\Program Files (x86)\SketchUp\SketchUp 2015\SketchUp.exe"
~~~

nếu vẫn lỗi, thử:

~~~bash
wine "C:\Program Files (x86)\SketchUp\SketchUp 2015\SketchUp.exe" "/DisableRubyAPI"
~~~
