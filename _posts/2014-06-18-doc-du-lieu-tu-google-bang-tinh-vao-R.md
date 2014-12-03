---
layout: post
title: "Đọc dữ liệu từ Google bảng tính vào R"
description: "Đọc dữ liệu từ Google bảng tính vào R"
tags: [dịch, google bảng tính, R, ứng dụng]
modified: 2014-06-18
comments: true
share: true
---

Các công cụ bảng tính hiện tại vẫn đang là cách thức phổ biến nhất trong việc chia sẻ và làm việc với dữ liệu. Không nằm ngoài xu hướng này, Google cũng đã cung cấp một dịch vụ bảng tính trực tuyến (Google Sheets hay Google bảng tính) miễn phí tại địa chỉ <a href="http://docs.google.com/">http://docs.google.com</a>.

Vào năm 2009, David Smith có một <a href="http://blog.revolutionanalytics.com/2009/09/how-to-use-a-google-spreadsheet-as-data-in-r.html" rel="nofollow" target="_blank">bài viết </a>về cách sử dụng R để nhập dữ liệu từ Google bảng tính. Phương pháp này sử dụng khoảng 2 dòng lệnh để nhập dữ liệu vào một khung dữ liệu (data frame) từ một tài liệu Google bảng tính.


##Song mọi thứ đã thay đổi


Thời gian gần đây, có vẻ như Google đã chú trọng vào phát triển công cụ bảng tính của họ nhiều hơn. Danh sách những thay đổi được liệt kê bởi Google tại <a href="https://support.google.com/docs/answer/3541068?rd=2" rel="nofollow" target="_blank">đây</a> cũng đề cập đến vài thay đổi đã diễn ra, nhưng không phải là tất cả. Trong phiên bản trước, người dùng có thể lựa chọn xuất bản một bảng tính ra định dạng csv, nhưng trong phiên bản mới này không còn tùy chọn xuất bản ra tệp csv nữa.

Vào ngày 05/4/2014, một vài người đã đặt câu hỏi trên <a href="http://stackoverflow.com/questions/22873602/importing-data-into-r-from-google-spreadsheet" rel="nofollow" target="_blank">StackOverflow</a> về thay đổi này.

Chính vì bản thân tôi cũng có nhu cầu nhập dữ liệu từ một bảng tính được chia sẻ bởi những thành viên trong nhóm của mình, tôi đã tự mày mò và tìm ra được giải pháp.

##Tổng quan về việc xuất bản bảng tính trên phiên bản mới của Google tài liệu

Để xuất bản một bảng tính Google, bạn chỉ cần làm theo những bước sau:

* Tạo một bảng tính
* Xuất bản lên web
* Sao chép liên kết tới tài liệu vừa xuất bản

<img alt="" src="http://revolution-computing.typepad.com/.a/6a010534b1db25970b01a3fd1599f2970b-pi" />

##R code dùng để đọc dữ liệu từ Google

Đây là mã lệnh. Bạn cần cài đặt và gọi thư viện XML trước khi sử dụng.
Lệnh 
{% highlight s %}readGoogleSheet(){% endhighlight %}
trả về một danh sách các khung dữ liệu, mỗi khung tương ứng với một bảng tìm thấy trên Google bảng tính.

{% highlight s %}library(XML)

readGoogleSheet <- function(url, na.string="", header=TRUE){

  stopifnot(require(XML))

  # Suppress warnings because Google docs seems to have incomplete final line

  suppressWarnings({

    doc <- paste(readLines(url), collapse=" ")

  })

  if(nchar(doc) == 0) stop("No content found")

  htmlTable <- gsub("^.*?(<table.*</table).*$", "\\1>", doc)

  ret <- readHTMLTable(htmlTable, header=header, stringsAsFactors=FALSE, as.data.frame=TRUE)

  lapply(ret, function(x){ x[ x == na.string] <- NA; x})

}{% endhighlight %}


Tiếp đó, chúng ta sử dụng một hàm để làm sạch các bảng biểu:
{% highlight s %}cleanGoogleTable(){% endhighlight %}

Lệnh trên xóa bỏ các dòng được thêm bởi Google, loại bỏ tên các hàng (nếu có) và bỏ qua các dòng trống trước bảng biểu.
{% highlight s %}cleanGoogleTable <- function(dat, table=1, skip=0, ncols=NA, nrows=-1, header=TRUE, dropFirstCol=NA){

  if(!is.data.frame(dat)){

    dat <- dat[[table]]

  }

  if(is.na(dropFirstCol)) {

    firstCol <- na.omit(dat[[1]])

    if(all(firstCol == ".") || all(firstCol== as.character(seq_along(firstCol)))) {

      dat <- dat[, -1]

    }

  } else if(dropFirstCol) {

    dat <- dat[, -1]

  }

  if(skip > 0){

    dat <- dat[-seq_len(skip), ]

  }

  if(nrow(dat) == 1) return(dat)

  if(nrow(dat) >= 2){

    if(all(is.na(dat[2, ]))) dat <- dat[-2, ]

  }

  if(header &amp;&amp; nrow(dat) > 1){

    header <- as.character(dat[1, ])

    names(dat) <- header

    dat <- dat[-1, ]

  }

  # Keep only desired columns

  if(!is.na(ncols)){

    ncols <- min(ncols, ncol(dat))

    dat <- dat[, seq_len(ncols)]

  }

  # Keep only desired rows

  if(nrows > 0){

    nrows <- min(nrows, nrow(dat))

    dat <- dat[seq_len(nrows), ]

  }

  # Rename rows

  rownames(dat) <- seq_len(nrow(dat))

  dat

}
{% endhighlight %}

##Ví dụ minh họa
Tôi đã tạo một bảng tính Google với dữ liệu về bảng tuần hoàn hóa học và xuất bản một bảng tính <a href="https://docs.google.com/spreadsheets/d/1MQ50_tn76GqQAOpFigcHms4zFqkoM_JS4sOittv_vgA/pubhtml" rel="nofollow" target="_blank">tại đây</a>. Bảng tính này bao gồm 2 bảng con. Bảng Sheet1 chứa dữ liệu về bảng tuần hoàn hóa học.
Để nhập dữ liệu từ bảng này tôi sử dụng mã lệnh:
{% highlight s %}gdoc <- "https://docs.google.com/spreadsheets/d/1MQ50_tn76GqQAOpFigcHms4zFqkoM_JS4sOittv_vgA/pubhtml"

elem <- readGoogleSheet(gdoc)

m <- cleanGoogleTable(elem, table=1)

head(m)

    Atomic no          Name Symbol Group Period Block State at STP Occurrence

  1         1      Hydrogen      H     1      1     s          Gas Primordial

  2         2        Helium     He    18      1     s          Gas Primordial

  3         3       Lithium     Li     1      2     s        Solid Primordial

  4         4     Beryllium     Be     2      2     s        Solid Primordial

  5         5         Boron      B    13      2     p        Solid Primordial

  6         6        Carbon      C    14      2     p        Solid Primordial

tail(m)

    Atomic no          Name Symbol Group Period Block State at STP Occurrence

113       113   (Ununtrium)    Uut    13      7     p               Synthetic

114       114 (Ununquadium)    Uuq    14      7     p               Synthetic

115       115 (Ununpentium)    Uup    15      7     p               Synthetic

116       116  (Ununhexium)    Uuh    16      7     p               Synthetic

117       117 (Ununseptium)    Uus    17      7     p               Synthetic

118       118  (Ununoctium)    Uuo    18      7     p               Synthetic

{% endhighlight %}



Nguồn: <a href="http://blog.revolutionanalytics.com/2014/06/reading-data-from-the-new-version-of-google-spreadsheets.html" rel="nofollow" target="_blank">http://blog.revolutionanalytics.com/2014/06/reading-data-from-the-new-version-of-google-spreadsheets.html</a>
