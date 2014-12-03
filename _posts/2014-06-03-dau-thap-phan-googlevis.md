---
layout: post
title: "Dấu phẩy phẩy (,) hay dấu phẩy chấm (.)? Minh họa bằng googleVis"
description: "Dấu phẩy phẩy (,) hay dấu phẩy chấm (.)? Minh họa bằng googleVis"
tags: [dịch, googleVis, R, ứng dụng]
modified: 2014-06-03
comments: true
share: true
---

Dấu thập phân là một kí tự dùng để phân cách giữa phần nguyên và phần thập phân của một số thập phân. Ở Việt Nam, như các bạn đã biết, chúng ta dùng dấu phẩy (,) làm dấu thập phân. Nhưng không phải mọi nơi trên thế giới đều dùng phẩy, chẳng hạn như Mỹ dùng dấu chấm (.) làm kí hiệu thập phân.

Việc sử dụng dấu phẩy làm dấu thập phân kéo theo hai hệ quả:
- chúng ta phải sử dụng dấu chấm làm dấu phân tách giữa các hàng nghìn, chẳng hạn 1.234,56
- vì dấu phẩy chỉ được sử dụng làm dấu thập phân bởi 24% dân số thế giới, có nghĩa rằng 76% dân số còn lại sẽ sử dụng kí hiệu khác với chúng ta trong việc soạn thảo các bảng tính, tài liệu, viết blog, viết luận,... gây nhiều trở ngại cho việc giao lưu văn hóa và khoa học.

Theo <a href="http://en.wikipedia.org/wiki/Decimal_mark" rel="nofollow" target="_blank">Wikipedia</a>, có gần 60% dân số thế giới sử dụng dấu chấm để làm kí hiệu thập phân. Còn lại, khoảng 16% dân số thế giới, theo từng vùng ngôn ngữ, lại có các kí hiệu khác nhau để biểu diễn kí hiệu thập phân.

Ở đây tôi sử dụng dữ liệu từ Wikipedia và gói bổ trợ googleVis cho R để tạo một bản đồ thế giới thể hiện sự phân bố kí hiệu thập phân giữa các nước.

**Mã lệnh như sau:**

{% highlight s %}### Preparing the data set (source: http://en.wikipedia.org/wiki/Decimal_mark)    

# Countries using Arabic numerals with decimal point

countries_decimal_point = 
  c("Australia", "Botswana", "British West Indies", "Brunei","Dominican Republic","Egypt", "Guatemala","Honduras","Hong Kong","India","Ireland","Israel", "Japan","Kenya","North Korea","South Korea","Lebanon","Luxembourg","Malaysia","Malta","Mexico","Mongolia","Nepal","New Zealand","Sri Lanka","United Kingdom","United States","Nicaragua","Nigeria","Pakistan","Panama","China","Philippines","Singapore","Switzerland","Taiwan","Tanzania","Thailand","Uganda","Zimbabwe","Guyana","Namibia","Zambia","Malawi","Swaziland","Lesotho")
decimal_point = rep("Decimal Point",46)
decimal_point_number = rep("1",46)
countries_decimal_point_df = cbind(cbind(countries_decimal_point,decimal_point),decimal_point_number)

# Countries using Arabic numerals with decimal comma

countries_decimal_comma = 
  c("Albania", " Andorra"," Angola"," Argentina"," Armenia"," Austria"," Azerbaijan", " Belarus"," Belgium" , " Bolivia"," Bosnia and Herzegovina", " Brazil"," Bulgaria" ," Cameroon"," Chile"," Colombia"," Costa Rica",  " Croatia"," Cuba"," Cyprus"," Czech Republic", " Denmark"," East Timor", " Ecuador"," Estonia", " Faroes"," Finland", " France"," Germany", " Georgia"," Greece", " Greenland"," Hungary", " Iceland"," Indonesia"," Italy"," Kazakhstan", " Kirgistan"," Latvia", " Lebanon"," Lithuania", " Macedonia", " Moldova", " Mongolia"," Morocco", " Mozambique"," Netherlands", " Norway"," Paraguay"," Peru"," Poland"," Portugal"," Romania", " Russia"," Serbia", " Slovakia"," Slovenia", " South Africa"," Spain", " Switzerland"," Sweden"," Tunisia"," Turkey", " Ukraine"," Uruguay"," Uzbekistan"," Venezuela" ,"Vietnam","Suriname","French Guiana","Madagascar", "Mauritania","Algeria")
decimal_comma = rep("Decimal Comma",73)
decimal_comma_number = rep("2",73)
countries_decimal_comma_df = cbind(cbind(countries_decimal_comma,decimal_comma),decimal_comma_number)


# Both decimal point and decimal comma

countries_using_both = 
  c("Canada", "Luxembourg", "Macau") 
both = rep("Decimal Comma &amp; Decimal Point",3)
both_number = rep("3",3)
countries_using_both_df = cbind(cbind(countries_using_both,both),both_number)

# Eastern arabic numerals

countries_eastern_arabic_numerals = 
  c("Bahrain", "Comoros", "Djibouti", "Iraq", "Jordan", "Kuwait", "Lebanon", "Oman" ,"Palestine", "Qatar", "Saudi Arabia", "Somalia","Syria","Tunisia", "United Arab Emirates","Yemen")
eastern_arabic = rep("Eastern Arabic",16)
eastern_arabic_number = rep("4",16)
countries_eastern_arabic_numerals_df = cbind(cbind(countries_eastern_arabic_numerals,eastern_arabic),eastern_arabic_number)

# Combine
point_or_comma = data.frame(rbind(rbind(countries_decimal_point_df,countries_decimal_comma_df),rbind(countries_using_both_df,countries_eastern_arabic_numerals_df)))
colnames(point_or_comma) = c("Country","Point or Comma","Factor Level")
point_or_comma[,"Point or Comma"] = as.factor(point_or_comma[,"Point or Comma"])
point_or_comma$combined <- paste0(point_or_comma$Country,": ", point_or_comma[,2]) 


### Creating the map       

library(googleVis)
library(datasets)

the_map = gvisGeoChart(data = point_or_comma, 
                       locationvar = 'Country', 
                       colorvar="Factor Level",
                       hovervar="combined",
                       options=list(dataMode="regions",colors="['#1abc9c', '#3498db', '#e74c3c','#d35400']",
                                    width="100%", height="100%",projection="kavrayskiy-vii",legend="null"))

plot(the_map)
print(the_map,file="~/Dropbox/Public/blogger/the_map.html"){% endhighlight %}

**Kết quả:**

<iframe frameborder="0" src="https://dl.dropboxusercontent.com/u/46692655/blogger/the_map.html" width="680px" height="600px"></iframe>

Nguồn: <a href="http://blog.datacamp.com/decimal-comma-or-decimal-point-a-googlevis-visualization/">http://blog.datacamp.com/decimal-comma-or-decimal-point-a-googlevis-visualization/</a>
