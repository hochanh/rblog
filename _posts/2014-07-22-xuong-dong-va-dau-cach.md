---
layout: post
title: "Chuyển đổi xuống dòng thành khoảng trắng"
description: "Chuyển đổi xuống dòng thành khoảng trắng"
tags: [javascript]
comments: true
share: true
---

Mã javascript:

{% highlight html %}
<html>
<head>
<script type="text/javascript">
function encode() {
var obj = document.getElementById('dencoder');
var unencoded = obj.value;
obj.value = unencoded.split("  ").join("\n")
};
function decode() {
 var obj = document.getElementById('dencoder');
 var encoded = obj.value;
 obj.value = encoded.replace(/\n/g," ");}
</script>
</head>
<body>
<form onsubmit="return false;">
<textarea cols="70" id="dencoder" rows="20"></textarea>
<div>
<input onclick="decode()" type="button" value="Step 1" /><input onclick="encode()" type="button" value="Step 2" />
</div>
</form>
</body>
</html>

{% endhighlight %}

<script type="text/javascript">
function encode() {
var obj = document.getElementById('dencoder');
var unencoded = obj.value;
obj.value = unencoded.split("  ").join("\n")
};
function decode() {
 var obj = document.getElementById('dencoder');
 var encoded = obj.value;
 obj.value = encoded.replace(/\n/g," ");}
</script>
<form onsubmit="return false;">
<textarea cols="70" id="dencoder" rows="20"></textarea>    <div>
<input onclick="decode()" type="button" value="Step 1" /><input onclick="encode()" type="button" value="Step 2" /></div>
</form>
