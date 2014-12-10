---
layout: post
title: "R Markdown + Kramdown + Jekyll = R blog"
math: true
---
 
## 1. R Markdown
 
- Chỉ cần nhập hàm trong R, quá trình tính toán cùng kết quả sẽ được in ra lúc trích xuất sang Markdown (hoặc HTML, PDF, Word), đây là một trong những công cụ hỗ trợ việc tái lặp nghiên cứu.
 
- Tích hợp với R Studio, vừa làm trên R, vừa viết blog. Hehe.
 
## 2. Kramdown
 
- Hỗ trợ $LaTeX$, footnotes, thích hợp với việc chèn công thức toán hay trích dẫn.
 
- Vài thứ hay ho nữa. Xem [test post](../test-post)
 
## 3. Jekyll
 
- Blog tĩnh, không lo bảo trì dữ liệu, thiết kế website chỉ cần HTML, CSS.
 
- Cài sẵn trên GitHub pages.
 
## 4. My blog
 
- Tôi tạo thư mục `_knitr` trong trang chính Jekyll để soạn thảo và chứa các tệp `.Rmd`.
 
- Cấu trúc tệp `.Rmd` của tôi có dạng:

{% highlight text %} 
---
layout: post
title: "R Markdown + Kramdown + Jekyll = R blog"
math: true
published: true
---
{% endhighlight %} 
 
- Sau khi soạn thảo xong, thôi chạy đoạn mã R sau[^1]:
 
<script src="https://gist.github.com/manhtai/66544c778dd5d817a673.js"></script>
 
Đoạn mã này chuyển tệp `.Rmd`ở thư mục `_knitr` sang tệp `.md` ở thư mục `_posts`, nếu có hình ảnh thì đặt vào thư mục `figures`.
 
Ban đầu thuộc tính `published:` của bài đăng R Markdown là `true`, sau khi chuyển đổi sẽ thành `false`, ngăn không cho ghi đè tệp Markdown ở những lần chuyển đổi sau.
 
- Cuối cùng là `add`, `commit` và `push` lên GitHub.
 
Xem mã nguồn blog này [tại đây](http://github.com/hochanh/rblog).
 
[^1]: <http://jason.bryer.org/posts/2012-12-10/Markdown_Jekyll_R_for_Blogging.html>
