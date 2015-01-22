---
layout: post
title: Bias - Variance
math: true
---
Sai số bình phương trung bình của một mô hình được tính như sau:
 
$$E(y_0-\hat{f}(x_0))^2 = Var(\hat{f}(x_0)) + [Bias(\hat{f}(x_0))]^2 + Var(\epsilon)$$
 
Trong đó:
 
$$Var(\hat{f}(x_0)) = E\left((\hat{f}(x_0)-E(\hat{f}(x_0)))^2\right)$$
 
là Variance (phương sai) của $\hat{f}$, và
 
$$Bias(\hat{f}(x_0))=E(\hat{f}(x_0)-y_0)$$
 
là Bias (sai lệch) giữa $\hat{f}$ và $f$.
 
Nôm na, Bias là sai lệch giữa mô hình và thực tế còn Variance là phương sai của mô hình, hay chính xác hơn là chênh lệch giữa kết quả áp dụng 1 mô hình đối với các mẫu đầu vào khác nhau (bằng cách sử dụng phương pháp xác nhận chéo, cross-validation, chẳng hạn).
 
Sai lệch tổng cộng bằng phương sai của mô hình và bình phương chênh lệch giữa mô hình và thực tế, hay:
 
$$SAI SỐ = BIAS^2 + VARIANCE$$
 
Mô hình càng linh hoạt (càng phức tạp) thì khi thay đổi đầu vào dữ liệu, càng dễ dẫn tới chênh lệch kết quả đầu ra, hay High Variance, tuy nhiên do thường khớp với giá trị thực tế nên Less Bias. Và ngược lại.
 
Kết quả tất yếu là có sự đánh đổi giữa Bias và Variance, tức BIAS-VARIANCE TRADEOFF.
