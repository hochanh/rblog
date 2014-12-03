---
layout: post
title: "TED: diễn giả và từ khóa"
description: "TED: diễn giả và từ khóa"
tags: [dịch, R, TED, Wikipedia]
modified: 2014-06-19
comments: true
share: true
---

Cho những ai chưa biết về TED, đọc thêm <a href="http://tedvn.com/about-ted/" rel="nofollow" target="_blank">tại đây</a>.

> TED (Technology – Entertainment – Design) ra đời năm 1984 với hình thức là hội nghị quy tụ ba giới: Công nghệ, Giải trí và Thiết kế. Thành công của hội nghị 1984 là một tiếng vang lớn, nhưng mãi đến năm 2001 khi tổ chức phi lợi nhuận tư nhân Sapling Foundation mua lại TED từ người sáng lập Richard Saul Wurma thì những hoạt động của TED mới trở nên rõ nét. Chris Anderson trở thành người phụ trách TED và tiếp tục phát triển hội nghị TED với phạm vi và tác động trên toàn cầu.

Với sứ mệnh **Lan tỏa giá trị của những ý tưởng** (Ideas Worth Spreading), TED có một niềm tin mãnh liệt vào quyền năng của những ý tưởng trong việc thay đổi thái độ, cuộc sống và thậm chí là cả thế giới. TED trở thành một ngôi nhà chia sẻ tri thức và nguồn cảm hứng bất tận một cách miễn phí, và là một cộng đồng kết nối những tâm hồn tò mò với các ý tưởng và cá nhân khác.

TED tổ chức hai hội nghị thường niên – TED Conference ở Long Beach và Palm Spring mỗi mùa xuân và hội nghị TEDGlobal ở Edinburgh (U.K) mỗi mùa hè. TED còn cho ra đời nhiều hình thức hoạt động đa dạng khác như trang web video TED.com, chương trình TEDx, TED Fellows, TED Prize, TED Conversations và Dự án dịch thuật mở.


Một <a href="http://www.openculture.com/2014/06/1756-ted-talks-listed-in-a-neat-spreadsheet.html" rel="nofollow" target="_blank">bài đăng</a> mới đây bởi Dan Colman đề cập tới việc có một danh sách 1756 bài diễn thuyết trên Ted (Ted Talks) được xây dựng bởi "một người nào đó". Liên kết tới bảng tính này có thể tìm thấy trên <a href="http://en.wikipedia.org/wiki/List_of_TED_speakers" rel="nofollow" target="_blank">Wikipedia</a>. Nó có tiêu đề "Những bài diễn thuyết trên Ted cho đến ngày 23/5/2014". Tôi đã tải bảng tính này vào ngày 12/6/2014 từ <a href="https://spreadsheets.google.com/ccc?hl=en&amp;key=pjGlYH-8AK8ffDa6o2bYlXg&amp;hl=en#gid=0" rel="nofollow" target="_blank">liên kết này</a> và lưu lại dưới định dạng csv. Thực tế bảng này là một danh sách gồm 1755 bài diễn thuyết đã diễn ra trên Ted. Trong bài viết này, tôi sẽ xây dựng một đám mây từ xuất hiện trong tiêu đề của các bài diễn thuyết này và sử dụng ggplots để xác định những diễn giả có từ 3 lần xuất hiện sử dụng bảng màu Karthik Ram’s Wes  Anderson cho R. Mã R và dữ liệu cho bài viết này có thể tìm thấy <a href="https://github.com/patilv/ted" rel="nofollow" target="_blank">tại đây</a>.


##Đọc dữ liệu đầu vào

{% highlight s %}library(stringr)
library(tm)
library(wordcloud)
library(wesanderson)
library(ggplot2)
library(dplyr)
library(gridExtra)
ted <- read.csv("ted.csv")
colnames(ted){% endhighlight %}


{% highlight s %}## [1] "URL"           "ID"            "URL.1"         "Speaker"      
## [5] "Name"          "Short.Summary" "Event"         "Duration"     
## [9] "Publish.date"{% endhighlight %}

Các cột được sử dụng trong nghiên cứu này là tên của các diễn giả - cột "Speaker", tiêu đề của bài diễn thuyết - cột "Name" và thời gian của buổi diễn thuyết - cột "Duration". Những tiêu đề ở phần sau có vẻ như được chèn thêm họ và tên của diễn giả vào trước. Dò theo cột này tôi nhận ra kể từ mục số 424 trở đi, tiêu đề của các bài diễn thuyết đúng là đã được chèn thêm họ và tên tác giả vào trước đó. Để chắc chắn, chúng ta sẽ loại bỏ 2 từ đầu tiên (gồm họ và tên) của tiêu đề thứ 424 trở đi.

##Làm sạch dữ liệu

Trong bước này, chúng ta loại bỏ 2 từ đầu tiên ở cột tiêu đề của các mục từ mục thứ 424 trở đi, sau đó tiếp tục làm sạch dữ liệu bằng cách loại bỏ các dấu câu, các khoảng trống thừa và các đường dẫn không cần thiết.

{% highlight s %}ted$Name <- as.character(ted$Name)
for (i in 424:nrow(ted)) {
    ted$Name[i] <- word(ted$Name[i], 3, -1)
}  # Removing first two words from row 424 onwards

# Function to clean text ## from Gaston Sanchez's work
# (https://sites.google.com/site/miningtwitter/questions/talking-about/wordclouds/comparison-cloud)
clean.text <- function(x) {
    # to lowercase
    x <- tolower(x)
    # remove punctuation marks
    x <- gsub("[[:punct:]]", "", x)
    # remove numbers
    x <- gsub("[[:digit:]]", "", x)
    # remove tabs and extra spaces
    x <- gsub("[ |\t]{2,}", "", x)
    # remove blank spaces at the beginning
    x <- gsub("^ ", "", x)
    # remove blank spaces at the end
    x <- gsub(" $", "", x)
    # result
    return(x)
}
{% endhighlight %}

##Đám mây các từ phổ biến trong tiêu đề các buổi diễn thuyết

{% highlight s %}myCorpus <- Corpus(VectorSource(clean.text(ted$Name)))
myStopwords <- c(stopwords("english"), "ted prize wish")
# The latter was required because there were few titles with that
# phrase

myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
tdmpremat <- TermDocumentMatrix(myCorpus)
tdm <- as.matrix(tdmpremat)
sortedMatrix <- sort(rowSums(tdm), decreasing = TRUE)
tdmframe <- data.frame(word = names(sortedMatrix), freq = sortedMatrix)

# plotting words that appear at least 5 times
wordcloud(tdmframe$word, tdmframe$freq, random.order = FALSE, random.color = FALSE, 
    min.freq = 5, scale = c(5, 0.2), colors = wes.palette(5, "Darjeeling")){% endhighlight %}

###Kết quả:

<img alt="" src="http://patilv.github.io/img/2014-6-17-Ted-Talks/unnamed-chunk-3.png" title="" />

##Diễn giả có hơn 2 lần xuất hiện trên TED và thời gian diễn thuyết trung bình của họ

{% highlight s %}numtalks <- data.frame(table(ted$Speaker))
table(numtalks$Freq){% endhighlight %}

{% highlight s %}## 
##    1    2    3    4    5    6    9 
## 1301  130   40   11    3    1    1{% endhighlight %}

Đã có 1487 diễn giả khác nhau, 1301 người trong số đó thực hiện 1 buổi diễn thuyết, 130 người thực hiện 2 buổi và 56 người có trên 2 buổi diễn thuyết tại TED. Chúng ta sẽ tập trung vào 56 người này.

Trước hết là thời lượng của bài diễn thuyết, chúng ta tính thời lượng trung bình các bài diễn thuyết của 56 người này:

{% highlight s %}# Function adapted from
# http://stackoverflow.com/questions/5186972/how-to-convert-time-mmss-to-decimal-form-in-r
ted$TalkTime <- sapply(strsplit(as.character(ted$Duration), ":"), function(x) {
    x <- as.numeric(x)
    x[1] * 60 + x[2] + x[3]/60
})

speakfreqandduration <- ted %>% group_by(Speaker) %>% summarise(NumTalks = n(), 
    Mean.Talk.Time = mean(TalkTime, na.rm = TRUE)) %>% filter(NumTalks > 
    2)

summary(speakfreqandduration$Mean.Talk.Time)
{% endhighlight %}

{% highlight s %}##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    3.03   11.60   15.50   14.90   17.20   36.30{% endhighlight %}

Số trung bình và trung vị nằm trong khoảng 15 phút. Và tất nhiên sẽ có những bài diễn thuyết ngắn hơn và dài hơn. Xem các biểu đồ chi tiết ở dưới.
{% highlight s %}gg1 <- ggplot(speakfreqandduration, aes(x = NumTalks, fill = as.factor(NumTalks))) + 
    scale_x_continuous(breaks = 1:10) + geom_histogram() + xlab("Number of talks") + 
    ggtitle("Number of talks") + scale_fill_manual(values = wes.palette(5, 
    "Darjeeling2")) + theme_bw() + theme(legend.position = "none")

gg2 <- ggplot(speakfreqandduration, aes(x = Mean.Talk.Time, fill = as.factor(NumTalks))) + 
    scale_x_continuous(breaks = c(5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 
        55, 60, 65, 70)) + geom_histogram() + scale_fill_manual(values = wes.palette(5, 
    "Darjeeling2")) + ggtitle("Mean talk time") + theme_bw() + theme(legend.position = "none") + 
    scale_y_continuous(breaks = 1:10)

gg3 <- ggplot(speakfreqandduration, aes(x = reorder(Speaker, Mean.Talk.Time), 
    y = Mean.Talk.Time, fill = as.factor(NumTalks))) + scale_fill_manual(values = wes.palette(5, 
    "Darjeeling2"), name = ("Number of\nTalks")) + geom_bar(stat = "identity") + 
    xlab("Speaker") + theme_bw() + theme(axis.text.y = element_text(size = 8), 
    axis.title.y = element_blank()) + coord_flip() + ggtitle("Speakers, mean talk time, and number of talks")

grid.arrange(gg3, arrangeGrob(gg1, gg2, ncol = 1), ncol = 2, widths = c(2, 
    1)){% endhighlight %}

<img src="http://patilv.github.io/img/2014-6-17-Ted-Talks/unnamed-chunk-6.png" height="448" width="640" /> 

* Hans Rosling có 9 lần diễn thuyết, nhiều nhất trong danh sách này, tiếp theo là Marco Tempest với 6 lần xuất hiện.
* Nếu giả sử rằng các bài diễn thuyết được lên chương trình trong vòng 15 phút, không một ai trong số 56 người này có thời gian diễn thuyết trung bình trong khoảng 14 phút. Họ đều kéo dài bài diễn thuyết hoặc là đến đủ 15 phút hoặc hơn vài phút chứ không kém đi. Khá thú vị!

Nguồn: <a href="http://patilv.github.io/Ted-Talks/" rel="nofollow" target="_blank">http://patilv.github.io/Ted-Talks/ </a>

