---
layout: post
title: "Nghiên cứu khả lặp vẫn đang là một thách thức"
description: "Nghiên cứu khả lặp vẫn đang là một thách thức"
tags: [dịch, nghiên cứu khả lặp, R, ứng dụng]
modified: 2014-06-11
comments: true
share: true
---

> _Chú thích_: Nguyên bản bài viết này bàn về "reproducible research", ở đây chúng tôi tạm dịch là "**nghiên cứu khả lặp**", khái niệm tóm lược về "nghiên cứu khả lặp" là loại nghiên cứu khoa học không chỉ có báo cáo kết quả nghiên cứu mà còn bao gồm đầy đủ các bước thực hiện, đồng thời công bố các thông tin cần thiết (dữ liệu, thuật toán sử dụng,...) để người khác có thể tiến hành lại nghiên cứu nhằm xác nhận tính đúng đắn và mở rộng nghiên cứu dựa trên nền tảng nghiên cứu cũ. Ở đây "reproducible" hay "reproducibility" mang nghĩa có khả năng lặp lại, có khả năng thực hiện lại nghiên cứu đã được công bố. 

Khoa học hiện nay được cho là đang lâm vào<a href="http://theconversation.com/science-is-in-a-reproducibility-crisis-how-do-we-resolve-it-16998" rel="nofollow" target="_blank"> cuộc khủng hoảng</a> về khả năng tái lặp. Khả năng tái lặp có vẻ được hoan nghênh và thường là nhân tố bắt buộc đối với các nghiên cứu mang tính cộng đồng (chẳng hạn trên các tạp chí như <a href="http://www.nature.com/nature/focus/reproducibility/" rel="nofollow" target="_blank">nature</a> hay <a href="http://www.sciencemag.org/content/334/6060/1226" rel="nofollow" target="_blank">science</a>). Luận điểm chung cho xu hướng này là việc các nghiên cứu có khả năng được thực hiện lại một cách độc lập thì sẽ có tính tin cậy cao hơn những nghiên cứu không thể tiến hành lại một cách độc lập. Cũng cần lưu ý rằng nghiên cứu khả lặp không chỉ mang ý nghĩa xác minh, hơn thế nữa nó sẽ mang lại lợi ích thiết thực cho việc mở rộng nghiên cứu hay xây dựng các nghiên cứu tương tự. Khó có thể tìm thấy những ý kiến phản bác các luận điểm trên, nhưng cần xét tới thực tế rằng với mỗi nhóm nghiên cứu cũng cần đầu tư một nguồn lực nhất định trong việc làm cho các nghiên cứu của họ trở thành khả lặp đối với các nhà nghiên cứu độc lập. Chẳng hạn việc <a href="http://www.nature.com/nature/journal/v483/n7391/full/483531a.html" rel="nofollow" target="_blank">lặp lại toàn bộ những thử nghiệm trong phòng thí nghiệm</a>. Tuy nhiên cũng có nhiều biến thể đơn giản hơn, chẳng hạn như khả năng lặp lại phân tích dựa trên các bộ dữ liệu đã biết.

Các loại nghiên cứu khoa học khác nhau sẽ khác nhau về khả năng tái lặp. Một ví dụ là nghiên cứu toán học, trong nhiều trường hợp các nghiên cứu này cho phép việc khả lặp dựa trên những phương trình trong bản thảo. Một ví dụ khác là các nghiên cứu hiện trường, thường thì kết quả phụ thuộc vào các yếu tố không kiểm soát được. Chẳng hạn việc tái lập toàn bộ một nghiên cứu về ảnh hưởng của một cơn bão ngay trước và sau khi nó xảy ra dường như là điều không thể, ít nhất xét về tính hiệu quả của nó.

Phạm vi hiện tại về khả năng tái lập đang ở đâu đó giữa hai ví dụ mà chúng tôi chỉ ra ở trên, và phạm vi này thu hẹp hay mở rộng phụ thuộc vào các bộ công cụ sẵn có cho các nhà nghiên cứu. Phần mềm nguồn mở, điện toán đám mây, lưu trữ dữ liệu và vô vàn các công cụ điện toán sẵn có đã mở rộng phạm vi này trong việc cho phép các nghiên cứu khả lặp có thể được tiến hành trên <i>nhiều loại nghiên cứu</i> hơn hai ví dụ ở trên. Tuy nhiên, lối chơi chữ về một cuộc khủng hoảng của nghiên cứu khả lặp cho thấy rằng các bộ công cụ hiện tại, mặc dù rất quan trọng, nhưng chưa giải quyết được vấn đề một cách triệt để.

Hiện tại chúng tôi đang làm việc trong một dự án về một phân tích có mức độ phức tạp vừa phải với một lượng dữ liệu cũng vừa phải (<a href="https://datadryad.org/resource/doi:10.5061/dryad.63q27d%C3%B2ng" rel="nofollow" target="_blank">49061 dòng</a>) và chúng tôi đang thử nghiệm xem để biến nó thành một nghiên cứu khả lặp hoàn toàn thì cần phải làm những gì. (Nghiên cứu này trả lời cho một câu hỏi rất đơn giản: <a href="http://onlinelibrary.wiley.com/doi/10.1111/1365-2745.12260/abstract" rel="nofollow" target="_blank">loại thân gỗ chiếm tỉ lệ bao nhiêu trong giới thực vật</a>?). Kinh nghiệm của chúng tôi trong việc cố gắng biến nghiên cứu này trở thành khả lặp có thể hữu ích cho những thảo luận tiếp sau về cách làm thế nào để các nhà khoa học cần ít thời gian và ít yếu tố kĩ thuật hơn chúng tôi để thực hiện các nghiên cứu khả lặp của riêng họ. Nói cách khác, việc làm này cho thấy chúng tôi hữu ích đến mức nào trong việc mở rộng phạm vi khả lặp cho nhiều loại nghiên cứu hơn và bằng cách đó, làm cho khoa học ngày càng đáng tin cậy hơn.

Cuối cùng, phân tích và báo cáo của chúng tôi đã được tái lặp một cách độc lập và tương đối dễ dàng cho những ai muốn tái lặp nghiên cứu này, nhưng để thực hiện được việc tái lặp ở mức độ này không phải là không cần bỏ công sức. Cho những ai quan tâm, toàn bộ mã lệnh và tài liệu của chúng tôi có sẵn tại <a href="https://github.com/richfitz/wood" rel="nofollow" target="_blank">địa chỉ này</a>.

Có 2 phần trong việc biến một dự án trở nên khả lặp: dữ liệu và các phân tích đã tiến hành. Chúng tôi cũng lưu ý rằng thực tế dự án này là khả thi bởi những phát triển gần đây trong việc <a href="http://en.wikipedia.org/wiki/Scientific_data_archiving" rel="nofollow" target="_blank">lưu trữ dữ liệu</a>. Công việc viết một mã lệnh để tải dữ liệu chính từ <a href="http://datadryad.org/" rel="nofollow" target="_blank">Dryad</a> và chuẩn bị cho việc phân tích nó khá là đơn giản. Tuy nhiên, điều này chỉ chứng tỏ một bắt đầu cho thách thức: bước phân tích dữ liệu giờ đây trở thành bước khó khăn nhất. Những điều ngay tiếp sau là danh sách ngắn những bài học rút ra từ thực tiễn làm việc của chúng tôi. Mỗi bài học cho thấy một thử thách chúng tôi phải vượt qua trong quá trình thực hiện nghiên cứu khả lặp và công cụ chúng tôi chọn để đối đầu với thách thức đó.

## Những thách thức và công cụ cho việc tái lặp

### Sử dụng nguồn dữ liệu tiêu chuẩn

Chúng tôi tải dữ liệu về từ các nguồn chuẩn (<a href="http://datadryad.org/" rel="nofollow" target="_blank">Dryad</a> và <a href="http://theplantlist.org/" rel="nofollow" target="_blank">The Plant List</a>) và chỉ chỉnh sửa chúng sử dụng các câu lệnh nhằm đảm bảo những thay đổi bảo toàn được nguyên vẹn tính chất của dữ liệu ban đầu. Lợi ích của các dữ liệu mở sẽ chỉ được nhận ra nếu chúng ta tôn trọng tính định danh của dữ liệu và không tạo ra hàng trăm bản sửa đổi chỉ khác nhau chút ít. Điều này cũng giúp cho việc ghi công của những người đóng góp dữ liệu. Tuy nhiên các vấn đề như các tiêu chuẩn phân loại chưa thống nhất vẫn đang là một vật cản lớn đối với các dữ liệu về sinh thái học.

### Kết hợp suy nghĩ và mã lệnh

Chúng tôi sử dụng gói **knitr** cho R để thực thi các phân tích theo kiểu lập trình có giải thích. Toàn bộ các phân tích, bao gồm những biện giải cho các hàm cốt lõi có thể tìm thấy <a href="http://richfitz.github.io/wood/wood.html" rel="nofollow" target="_blank">tại đây</a>. Tuy nhiên, làm việc với các nhóm mã lệnh dài hay cần thời gian đáng kể để chạy vẫn đang là một vấn đề đau đầu.

### Kết xuất các thông số động

Toàn bộ việc xử lí dữ liệu của chúng tôi được thực hiện bởi các mã lệnh, và chúng tôi có thể xóa hết các thông số đầu ra và tạo lại chúng một cách dễ dàng.

### Tự động lưu trữ các thành tố phụ thuộc

Chúng tôi sử dụng <a href="http://vimeo.com/22577738" rel="nofollow" target="_blank">GNU make</a> để quản lý các thành tố phụ thuộc trong dự án, chỉ thay đổi những phần cần sửa lại. Công cụ này cũng giúp cho quá trình phát triển dự án trở thành một quy trình tự đóng gói.

### Quản lý phiên bản

Toàn bộ mã lệnh của chúng tôi được quản lý phiên bản sử dụng git từ lúc <a href="https://github.com/richfitz/wood/commit/8ed0c8c10dfda2a8f11f169ec528b7e161832eeb" rel="nofollow" target="_blank">bắt đầu</a>, điều này cho phép chúng tôi kiểm soát các phiên bản cũ một cách thuận lợi. Đây cũng là trung tâm dữ liệu của mọi thứ chúng tôi làm. Xem <a href="http://www.scfbm.org/content/8/1/7" rel="nofollow" target="_blank">bài viết</a> này để thấy vai trò to lớn của quản lý phiên bản tới quá trình nghiên cứu.

### Tự động kiểm tra các thay đổi để đảm bảo không phát sinh vấn đề

Chúng tôi sử dụng môi trường hệ thống tích hợp liên tục (continuous integration) <a href="http://travis-ci.org/" rel="nofollow" target="_blank">Travis CI</a> để giám sát thay đổi trong phân tích để ngăn chặn lỗi. Mỗi khi chúng tôi tạo ra một thay đổi, hệ thống này tải mã nguồn của chúng tôi xuống đồng thời với các dữ liệu liên quan và chạy phân tích, và sẽ gửi cho chúng tôi một thư điện tử nếu vì lý do gì đó phân tích bị lỗi. Hệ thống này thậm chí còn tải lên các phiên bản đã biên dịch của phân tích và ghi chú mỗi khi chạy.

### Đóng gói các thành tố phụ thuộc

Chúng tôi sử dụng gói **packrat** cho R để quản lý và lưu trữ các gói R phụ thuộc để chắc chắn khả năng khả lặp trong tương lai. Về mặt lý thuyết, điều này nghĩa là nếu phiên bản của gói phần mềm đó thay đổi nhiều đến mức gây ra lỗi trong mã lệnh của chúng tôi thì chúng tôi đã có sẵn một bản lưu trữ có thể sử dụng được. Đây là một công cụ mới, chúng tôi chưa xác nhận được nó có hoạt động hay không.

## Những thách thức còn bỏ ngỏ
Chúng tôi nhận thấy rằng việc chuyển đổi những phân tích đang hoạt động từ máy tính của người này (với những tùy chỉnh cá nhân cho máy tính của họ) sang người khác là một việc khó khăn. Ví dụ như vấn đề này. Thật khó để dự đoán được mọi nguyên nhân dẫn tới sai sót: trong quá trình tái lặp nghiên cứu này bởi <a href="http://carlboettiger.info/" rel="nofollow" target="_blank">Carl Boettiger</a> một <a href="https://github.com/richfitz/wood/issues/12" rel="nofollow" target="_blank">vấn đề</a> đã phát sinh do việc chưa hoàn thiện tài liệu về các phiên bản gói hỗ trợ R cần thiết.
<!--more-->
Gói mã lệnh thực thi các công việc trên là tương đương về kích cỡ khi tiến hành phân tích trong thực tế; đây là một thách thức thật sự cho các nhà nghiên cứu. Việc sử dụng nhiều ngôn ngữ và framework khác nhau làm gia tăng yêu cầu về các mảng kiến thức mang tính kĩ thuật hơn, cũng như khả năng xảy ra các vấn đề sẽ tăng lên. Càng tự động hóa quá trình này thì các nghiên cứu khả lặp sẽ càng trở nên phổ biến.

Phương pháp tiếp cận sử dụng hệ thống tích hợp liên tục có tiềm năng lớn giúp cho việc quản lý các dự án nghiên cứu dựa trên công nghệ điện toán trở nên dễ dàng hơn. Tuy nhiên, mặc dù phân tích của chúng tôi mang tính nguyên tắc nhiều hơn là ứng dụng thực tế, nó sẽ bị giới hạn ở các mặt: đòi hỏi dự án phải là nguồn mở, phân tích phải chạy tương đối nhanh (dưới 1 giờ). Những giới hạn này là hợp lý đối với các dịch vụ miễn phí nhưng nó sẽ không thể đáp ứng được các dự án nghiên cứu sử dụng các thông tin "nhạy cảm" và các tính toán có thể kéo dài nhiều giờ hay nhiều ngày.
<hr />
Chúng tôi nhận thấy mục tiêu khả lặp cho dự án đã trở thành một ví dụ hữu ích, và nó đã trở thành nền tảng cho <a href="https://github.com/richfitz/modeladequacy" rel="nofollow" target="_blank">các dự án tiếp sau</a>. Tuy nhiên, quá trình này đã trở nên thức tạp hơn nhiều, khiến cho việc hướng dẫn cho người khác cách để làm cho dự án của họ trở nên tái lặp không đơn giản chỉ qua lời nói.
Chúng ta cần phải phát triển những công cụ, ít nhất phải dễ dùng như quản lý phiên bản trước khi chúng ta mong đợi việc tái lặp dự án trở thành một xu hướng chung.
Chúng tôi không phản bác ý kiến của Titus Brown về việc <a href="http://ivory.idyll.org/blog/2014-myths-of-computational-reproducibility.html" rel="nofollow" target="_blank">tái lặp một phần thì tốt hơn là không tái lặp gì cả </a>(50% số người làm cho công việc của họ có khả năng tái lặp 50% có vẻ tốt hơn 5% số người làm cho côgn việc của họ có khả năng tái lặp 100%!). Tuy nhiên, chúng tôi không đồng tình với quan điểm của Titus cho rằng những công cụ mới là không cần thiết. Những công cụ hiện tại là rất thô sơ và nhiều đến mức khó mong chờ các nhà khoa học áp dụng trên diện rộng xu hướng tái lặp vì mục tiêu chính của họ không phải để tái lặp. Nếu cho rằng việc tái lặp là <a href="http://software-carpentry.org/blog/2013/02/correctness-isnt-compelling.html" rel="nofollow" target="_blank">không hấp dẫn</a>, chúng ta không thể trông chờ người khác bỏ thời gian và công sức của họ ra để đóng góp cho cộng đồng những thứ tốt đẹp.

Những nỗ lực khác cho mục tiêu đơn giản là thực hiện lại nghiên cứu ở một máy tính khác cũng không khả thi hơn nỗ lực của chúng tôi là bao. Một nghiên cứu của nhóm <a href="http://www.zoology.ubc.ca/%7Erepro" rel="nofollow" target="_blank">UBC Reproducibility</a> cho thấy họ <a href="http://onlinelibrary.wiley.com/doi/10.1111/j.1365-294X.2012.05754.x/abstract" rel="nofollow" target="_blank">không thể tái lặp kết quả của 30%</a> những phân tích được công bố sử dụng gói bổ trợ phổ biến STRUCTURE, với cùng dữ liệu được cung cấp bởi tác giả. Một trường hợp đáng buồn hơn, <a href="http://reproducibility.cs.arizona.edu/" rel="nofollow" target="_blank">một nhóm nghiên cứu tại đại học Arizona</a> cho thấy họ chỉ có thể build được khoảng 50% số phần mềm nguồn mở mà họ có thể tải xuống mà chưa xét tới việc kiểm tra tính năng của phần mềm (lưu ý rằng nghiên cứu này hiện tại đã được <a href="http://cs.brown.edu/%7Esk/Memos/Examining-Reproducibility/" rel="nofollow" target="_blank">tái lặp</a>!).

Quá trình làm cho nghiên cứu của chúng tôi trở nên khả lặp cho thấy chúng ta chỉ đang tiến được những bước nhỏ trong việc làm cho nghiên cứu khả lặp trở nên phổ biến đối với các nhà khoa học trong thực tế.


Nguồn: <a href="http://ropensci.org/blog/2014/06/09/reproducibility">http://ropensci.org/blog/2014/06/09/reproducibility</a>
