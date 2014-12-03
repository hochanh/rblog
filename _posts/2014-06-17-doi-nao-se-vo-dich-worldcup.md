---
layout: post
title: "Đội nào sẽ vô địch World Cup 2014 và mô hình dự đoán?"
description: "Đội nào sẽ vô địch World Cup 2014 và mô hình dự đoán?"
tags: [dịch, dự đoán, R, Wold Cup 2014, ứng dụng ]
modified: 2014-06-18
comments: true
share: true
---


Giải bóng đá thế giới World Cup đã khởi tranh từ thứ 5 tuần trước (thứ 6 theo giờ Việt Nam) với nhiều trận cầu hấp dẫn. 

Tôi không chỉ đặt ra câu hỏi đội nào sẽ vô địch World Cup mà quan trọng hơn, mô hình nào sẽ sự đoán chính xác nhất các kết quả xảy ra trên thực tế. Trong bài viết này tôi đề cập 3 nhóm dự đoán khác nhau, nhóm một: <a href="http://fivethirtyeight.com/" target="_blank">FiveThirtyEight </a>với một website thống kê dựa trên phiếu bầu, nhóm hai:&nbsp; <a href="http://www.statistik.lmu.de/%7Egroll" target="_blank">Groll</a> &amp; <a href="http://www.statistik.lmu.de/%7Eschauberger" target="_blank">Schauberger</a> là 2 viện đến từ Munich, Đức và cuối cùng là nhóm <a href="http://www.lloyds.com/" target="_blank">Lloyd's of London</a>, một sàn giao dịch bảo hiểm.

Nhóm thứ nhất tại <a href="http://fivethirtyeight.com/" target="_blank">FiveThirtyEight</a> đã sử dụng chỉ số <a href="http://fivethirtyeight.com/features/its-brazils-world-cup-to-lose/">ESPN’s Soccer Power Index</a> để dự đoán kết quả các trận bóng và liên tục <a href="http://fivethirtyeight.com/interactives/world-cup/">cập nhật mô hình của họ</a>. Nhóm này rõ ràng là một fan của đội Brasil.

Nhóm thứ hai <a href="http://www.statistik.lmu.de/%7Eschauberger/research.html">Andreas Groll &amp; Gunther Schauberger</a> đến từ đại học LMU Munich đã phát triển một mô hình giống như cách tiếp cận của FiveThirtyEight nhằm ước tính xác suất của một đội bóng vô địch world cup. Nhưng khác với FiveThirtyEight, nhóm này dự đoán Đức sẽ là đội mang cúp vô địch về quê.

Nhóm thứ ba, <a href="http://www.lloyds.com/">Lloyd's</a> lại chọn một cách tiếp cận khác để dự đoán. Họ xem xét tới khía cạnh rủi ro của đội bóng và xếp hạng các đội theo <a href="http://www.lloyds.com/news-and-insight/news-and-features/market-news/industry-news-2014/fifa-world-cup-how-much-are-those-leg-worth" rel="" target="_blank">giá trị được bảo hiểm của từng đội</a>. Cho rằng đội mạnh hơn sẽ có giá trị được bảo hiểm cao hơn, họ dự đoán Đức sẽ vô địch World Cup năm nay.

Một lưu ý nhỏ ở đây; đâu là điểm khác biệt giữa bảo hiểm và bài bạc? Bài bạc dẫn tới rủi ro ở nơi chả có rủi ro nào cả. Bảo hiểm làm giảm rủi ro ở những nơi rủi ro tồn tại. (Gambling introduces risk, where none exists. Insurance mitigates risk,  where risk exists.)

<figure>
<a href="http://www.lloyds.com/~/media/Images/News%20and%20Insight/News%20and%20features/2014/Lloyds%20World%20Cup%20Infographic%2001%20ENG%20Sterling%20v31.pdf" imageanchor="1" style="margin-left: auto; margin-right: auto;" target="_blank"><img border="0" src="http://www.lloyds.com/~/media/Images/News%20and%20Insight/News%20and%20features/2014/World%20CupInfographic01EnglishSterlingcropped.jpg" /></a>

<figcaption>_Nguồn:_ Nghiên cứu của Cebr thực hiện cho Lloyd’s, 06/2014.</figcaption>
</figure>

Dưới đây là bảng thống kê 3 hệ thống xếp hạng được giới thiệu. Không có nhóm nào trong ba nhóm xếp Hà Lan vào top 5, mặc dù họ đã gặp Tây Ban Nha ở chung kết 4 năm trước.
Điều thú vị là vào sáng nay, các đội bóng được đánh giá cao hơn theo dự đoán của cả ba nhóm là Brasil, Argentina, Đức và Hà Lan đều có xác suất vô địch ở mức xấp xỉ tương ứng 25%, 20%, 18% và 7%.

<iframe frameborder="0" height="900" src="https://dl.dropboxusercontent.com/u/46692655/blogger/WorldCupPredictions.html" width="580"></iframe> 

<b>R code</b>

{% highlight s %}Predictions <- structure(list(Team = c("<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Algeria.svg/22px-Flag_of_Algeria.svg.png\"> Algeria",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/22px-Flag_of_Argentina.svg.png\"> Argentina",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/22px-Flag_of_Australia.svg.png\"> Australia",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Belgium_%28civil%29.svg/22px-Flag_of_Belgium_%28civil%29.svg.png\"> Belgium",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Flag_of_Bosnia_and_Herzegovina.svg/22px-Flag_of_Bosnia_and_Herzegovina.svg.png\"> Bosnia and Herzegovina",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/22px-Flag_of_Brazil.svg.png\"> Brazil",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/22px-Flag_of_Cameroon.svg.png\"> Cameroon",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Flag_of_Chile.svg/22px-Flag_of_Chile.svg.png\"> Chile",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Colombia.svg/22px-Flag_of_Colombia.svg.png\"> Colombia",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Costa_Rica.svg/22px-Flag_of_Costa_Rica.svg.png\"> Costa Rica",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Flag_of_Cote_d%27Ivoire.svg/22px-Flag_of_Cote_d%27Ivoire.svg.png\"> Cote d'Ivoire",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/22px-Flag_of_Croatia.svg.png\"> Croatia",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/22px-Flag_of_Ecuador.svg.png\"> Ecuador",
"<img src=\"http://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/23px-Flag_of_England.svg.png\"> England",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/22px-Flag_of_France.svg.png\"> France",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/22px-Flag_of_Germany.svg.png\"> Germany",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Ghana.svg/22px-Flag_of_Ghana.svg.png\"> Ghana",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/22px-Flag_of_Greece.svg.png\"> Greece",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Flag_of_Honduras.svg/22px-Flag_of_Honduras.svg.png\"> Honduras",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/22px-Flag_of_Iran.svg.png\"> Iran",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/22px-Flag_of_Italy.svg.png\"> Italy",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/22px-Flag_of_Japan.svg.png\"> Japan",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/22px-Flag_of_Mexico.svg.png\"> Mexico",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/22px-Flag_of_the_Netherlands.svg.png\"> Netherlands",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/22px-Flag_of_Nigeria.svg.png\"> Nigeria",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/22px-Flag_of_Portugal.svg.png\"> Portugal",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/22px-Flag_of_Russia.svg.png\"> Russia",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/22px-Flag_of_South_Korea.svg.png\"> South Korea",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/22px-Flag_of_Spain.svg.png\"> Spain",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/20px-Flag_of_Switzerland.svg.png\"> Switzerland",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/22px-Flag_of_the_United_States.svg.png\"> United States",
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Uruguay.svg/22px-Flag_of_Uruguay.svg.png\"> Uruguay"
), `Lloyd\'s` = c(46.4, 355.2, 66.6, 360.4, 64.3, 448.3, 195.8,
72, 59.5, 18.3, 132, 185.6, 48.9, 550.1, 394.8, 641.2, 158.5,
53.2, 34.2, 24.4, 196.8, 92.8, 72.5, 279.4, 143.1, 279.3, 165.8,
65.2, 590.1, 138.5, 110.7, 144.1), Groll.Schauberger = c(0.0018, 0.0582,
3e-04, 0.0819, 8e-04, 0.2765, 0, 0.0063, 0.0052, 0, 0.0032, 0.021,
0.0017, 0.0193, 0.0135, 0.288, 0.0022, 4e-04, 2e-04, 0, 0.0094,
0.001, 0.0012, 0.0129, 4e-04, 0.0522, 4e-04, 0.0019, 0.09, 0.0413,
0.0016, 0.0071), FiveThirtyEight = c(0, 0.128, 0, 0.015, 0.009,
0.452, 0.001, 0.042, 0.028, 0.001, 0.006, 0.002, 0.009, 0.016,
0.037, 0.109, 0.003, 0.002, 0, 0, 0.005, 0.001, 0.003, 0.009,
0.002, 0.007, 0.006, 0.001, 0.076, 0.004, 0.004, 0.018)), .Names = c("Team",
"Lloyd\\'s", "Groll.Schauberger", "FiveThirtyEight"), row.names = c(NA,
-32L), class = "data.frame")
 
library(googleVis)
plot(gvisTable(Predictions,
formats=list("Lloyd\\'s"="#,###.0",
Groll.Schauberger="0.0%",
FiveThirtyEight="0.0%"),
options=list(sortColumn=1, sortAscending=FALSE,
width=550, height=840
),
chartid="WorldCupPredictions"))
{% endhighlight %}

Nguồn: <a href="http://lamages.blogspot.com/2014/06/who-will-win-world-cup-and-which.html" target="_blank">http://lamages.blogspot.com/2014/06/who-will-win-world-cup-and-which.html</a>
