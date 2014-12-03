---
layout: post
title: Standard Error
math: true
---
 
"Point estimation" (ước lượng điểm) ám chỉ việc đưa ra một ước đoán tốt nhất cho một đại lượng mà ta quan tâm. Đại lượng này có thể là một tham số trong một mô hình tham số, một hàm phân phối lũy tiến, một hàm mật độ xác suất, một hàm hồi quy,...
 
Ký hiệu $\hat{\beta}$ là ước lượng điểm của đại lượng $\beta$. Nhớ rằng $\beta$ thì cố định và chưa (không) biết còn $\hat{\beta}$ phụ thuộc vào dữ liệu thu thập được nên $\hat{\beta}$ là một biến ngẫu nhiên.
 
**Bias** của một ước lượng được định nghĩa:
 
$$\text{bias}(\hat{\beta})=E(\hat{\beta})-\beta$$
 
Chúng ta nói một ước lượng là **unbiased** nếu $E(\hat{\beta})=\beta$.
 
Phân phối của $\hat{\beta}$ được gọi là **phân phối mẫu**. Độ lệch chuẩn của $\hat{\beta}$ được gọi là **sai số chuẩn**, tức **Standard Error**.
 
$$\text{SE} = \text{SE}(\hat{\beta})=\sqrt{Var(\hat{\beta})}$$
 
**SE** thường phụ thuộc vào tổng thể, nên chúng ta phải sử dụng giá trị ước tính của **SE** là $\hat{SE}$ để thay thế. Và thường vẫn kí hiệu **SE** vì lý do thuận tiện.
 
SE được dùng trong tính toán khoảng tin cậy như sau: Khoảng tin cậy 95% của $\beta$ được tính bởi công thức:
 
$$\hat{\beta} \pm 2 \cdot \text{SE}(\hat{\beta})$$
 
SE trong kiểm định giả thuyết:
 
$$H_0: \beta = x$$
 
và
 
$$H_a: \beta \not= x$$
 
Chúng ta tính *t-statistic* như sau:
 
$$t = \frac{\hat{\beta}-x}{\text{SE}(\hat{\beta})}$$
 
Dễ thấy *t* cho biết khoảng cách từ $\beta$ tới $x$ bằng bao nhiêu lần  SE. Gần đúng một cách *chính xác* (?) thì t có phân phối Student với *n-2* bậc tự do. Tuy nhiên với n lớn hơn 30, phân phối của t sẽ xấp xỉ chuẩn.
 
Trong phân phối này của *t*, xác suất bắt gặp những giá trị lớn hơn hoặc bằng $\vert t \vert$ gọi là *p-value* (như chúng ta đã [biết](../p-value)).
 
Vậy là khi sử dụng lệnh `summary(lm())` chúng ta đã biết được các giá trị `Std. Error`, `t value` và `Pr(>|t|)` có nghĩa là gì rồi. Hehe.
