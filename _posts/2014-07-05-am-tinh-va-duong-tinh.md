---
layout: post
title: "Âm tính và dương tính"
math: true
---
 
## Ví dụ 1:
 
Một xét nghiệm y khoa, xét nghiệm HIV chẳng hạn, đưa ra kết quả dương tính (+) hoặc âm tính (-), bảng xác suất về tính chính xác của xét nghiệm này như sau:
 
| | $D$ | $D^c$ |
|:-|:-:|:-:|
| + | 0.09 | 0.099 |
| - | 0.001 | 0.891 |
{: rules="all" align="center"}
 
Theo định nghĩa về xác suất điều kiện ta có:
 
$$P(+\vert D) = \frac{P(+ \cap D)}{P(D)} = \frac{0.009}{0.009 + 0.001} = 0.9$$
 
và
 
$$P(-\vert D^c) = \frac{P(- \cap D^c)}{P(D^c)} = \frac{0.891}{0.891 + 0.099} \approx 0.9$$
 
Như vậy nói chung xét nghiệm này khá là chính xác. Người bị bệnh có kết quả dương tính đối với 90% trong tổng số những lần xét nghiệm và người không mắc bệnh có kết quả âm tính với gần 90%. 
 
Giả sử bạn đi xét nghiệm (HIV chẳng hạn), và có kết quả dương tính, vậy xác suất bạn đã bị nhiễm bệnh là bao nhiêu? 90% chăng?
 
Đừng lo lắng quá, bởi vì:
 
$$P(D \vert +) = \frac{P(+ \cap D)}{P(+)} = \frac{0.009}{0.009 + 0.099} \approx 0.08$$
 
Tức là bạn chỉ có khoảng 8% khả năng đã nhiễm bệnh rồi mà thôi. 
 
Giá trị $P(D)$ được gọi là độ **phổ biến** của dịch bệnh. Trong ví dụ này $P(D) =  0.01$, tức chỉ khoảng 1% trong số những người đi xét nghiệm là có bệnh.
 
Giá trị $P(+ \vert D)$ còn được gọi là **độ nhạy**, và $P(- \vert D^c)$ là **độ đặc hiệu**. Xét nghiệm ở trên có độ nhạy 90% và độ đặc hiệu khoảng 90%.
 
## Ví dụ 2:
 
Một xét nghiệm khác có độ nhạy 99.7% ($P(+  \vert  D) = .997$) và độ đặc hiệu 98.5% ($P(-  \vert  D^c) = 0.985$). Giả thiết mức nhiễm bệnh là 0.1% ($P(D)=0.001$). 
 
Bạn tiếp tục đi xét nghiệm, và nhận được kết quả dương tính, lần này xác suất bạn (lại) nhiễm bệnh sẽ là bao nhiêu? 
 
Tất nhiên sẽ không phải là 99% rồi, đáp án là:
 
$$
\begin{eqnarray*}
  P(D  \vert  +) & = &\frac{P(+ \vert D)P(D)}{P(+ \vert D)P(D) + P(+ \vert D^c)P(D^c)}\\ \\
 & = & \frac{P(+ \vert D)P(D)}{P(+ \vert D)P(D) + \{1-P(- \vert D^c)\}\{1 - P(D)\}} \\ \\
 & = & \frac{0.997\times 0.001}{0.997 \times 0.001 + 0.015 \times 0.999}\\ \\
 & = & 0.062
\end{eqnarray*}
$$
 
Độ nhạy lớn hơn, độ đặc hiệu cao hơn, nhưng do tỉ lệ nhiễm bệnh thấp hơn nên xác suất nhiễm bệnh của bạn ở xét nghiệm 2 này thấp hơn. Đây là ảnh hưởng của độ phổ biến dịch bệnh.
 
NHƯNG, đừng vội mừng!
 
Nếu bạn dùng bơm kim tiêm đã qua sử dụng hoặc quan hệ tình dục với người có nghi nhiễm HIV thì khả năng bạn bị lây bệnh **so với** khả năng bạn không bị lây bệnh TRƯỚC KHI XÉT NGHIỆM sẽ là:
 
$$\frac{P(D)}{P(D^c)}$$
 
Khả năng bạn đã bị lây bệnh **so với** khả năng bạn không bị lây bệnh SAU KHI XÉT NGHIỆM sẽ là:
 
$$\frac{P(D  \vert  +)}{P(D^c  \vert  +)}$$
 
Ta có:
 
$$P(D  \vert  +) = \frac{P(+ \vert D)P(D)}{P(+ \vert D)P(D) + P(+ \vert D^c)P(D^c)}$$
 
và
 
$$P(D^c  \vert  +) = \frac{P(+ \vert D^c)P(D^c)}{P(+ \vert D)P(D) + P(+ \vert D^c)P(D^c)}$$
 
Nên:
 
$$\frac{P(D  \vert  +)}{P(D^c  \vert  +)} = \frac{P(+ \vert D)}{P(+ \vert D^c)}\times \frac{P(D)}{P(D^c)}$$
 
Trong ví dụ này ta tính ra được:
 
$$\frac{P(+ \vert D)}{P(+ \vert D^c)} = \frac{0.997}{1 - 0.985} \approx 66$$
 
Tức: sau khi xét nghiệm, giả thiết bạn bị nhiễm bệnh đã được làm "chắc chắn hơn" tới 66 lần so với giả thiết bạn không nhiễm bệnh!
 
### Nếu bạn nhận được kết quả âm tính (-), thì sao?
 
