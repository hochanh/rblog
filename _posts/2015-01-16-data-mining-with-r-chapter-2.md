---
layout: post
title: "Dự báo sự phát triển của tảo trên một số dòng sông ở Châu Âu"
converted: yes
---
 
## 1. Mô tả vấn đề và Mục tiêu cần đạt
 
Sự tập trung cao độ của một số loài tảo độc trên các dòng sông là một vấn đề sinh thái học nghiêm trọng, không chỉ ảnh hưởng tới các thực thể sống trên sông mà còn ảnh hưởng tới chất lượng nguồn nước. Vì vậy tính chủ động trong việc theo dõi và thực hiện những dự báo sớm về sự phát triển của tảo là rất cần thiết trong việc nâng cao chất lượng các dòng sông.
 
Để làm được điều này, các mẫu nước khác nhau đã được thu thập trên các dòng sông khác nhau ở châu Âu vào các thời điểm khác nhau trong khoảng thời gian xấp xỉ 1 năm. Với mỗi mẫu nước, người ta đo lường các thuộc tính hóa học khác nhau cũng như tần suất xuất hiện của 7 loại tảo độc. Một số thuộc tính khác của quá trình thu thập cũng đồng thời được ghi chép, chẳng hạn như mùa trong năm, kích thước dòng sông và tốc độ dòng chảy.
 
Lý do chính của việc lấy mẫu này dựa trên thực tế rằng các xét nghiệm hóa học thường có giá thành rẻ và dễ dàng tự động hóa, trong khi các phân tích sinh học để xác định loài tảo nào có mặt trong nước liên quan tới các xét nghiệm vi sinh, yêu cầu nhân lực chất lượng cao và do đó đòi hỏi chi phí và thời gian nhiều hơn. Do vậy, việc lập các mô hình có khả năng dự báo chính xác tần suất xuất hiện của các loài tảo dựa trên các thuộc tính hóa học sẽ đơn giản hóa việc tạo ra các hệ thống rẻ và tự động trong việc theo dõi sự sinh trưởng của các loài tảo độc.
 
Một mục đích khác của nghiên cứu này là để cung cấp hiểu biết rõ ràng hơn về các yếu tố tác động tới tần suất xuất hiện của tảo. Nói cách khác, chúng tôi muốn hiểu được những tần suất này liên quan như thế nào tới các thuộc tính hóa học của các mẫu nước cũng như với các thuộc tính khác của mẫu như mùa trong năm, loại sông,...
 
## 2. Mô tả dữ liệu
 
Dữ liệu có sẵn cho nghiên cúu này được thu thập trên mạng nghiên cứu [ERUDIT](http://www.erudit.org/) và đã được sử dụng cho cuộc thi quốc tế về phân tích dữ liệu COIL năm 1999. Dữ liệu này có sẵn ở một vài nguồn, chẳng hạn như dữ liệu của [UCI](http://archive.ics.uci.edu/ml/).
 
Có 2 bộ dữ liệu chính trong nghiên cứu này. Bộ đầu tiên bao gồm dữ liệu của 200 mẫu nước. Chính xác hơn, mỗi quan sát trong các bộ dữ liệu thực tế là tập hợp của một số mẫu nước được thu thập từ cùng 1 dòng sông trong khoảng thời gian 3 tháng, trong cùng một mùa trong năm.
 
Mỗi quan sát chứa thông tin về 11 biến số. 3 trong số đó là biến danh nghĩa, mô tả mùa trong năm, kích cỡ và tốc độ dòng chảy của dòng sông. 8 biến còn lại là các giá trị của các tham số hóa học khác nhau đo lường được trong các mẫu nước, gồm:
 
- Giá trị pH lớn nhất
- Giá trị O<sub>2</sub> nhỏ nhất
- Giá trị Cl trung bình
- Giá trị trung bình của NO<sub>3</sub>-
- Giá trị trung bình của NH<sub>4</sub>+
- Giá trị trung bình của PO<sub>4</sub>3-
- Giá trị trung bình của PO<sub>4</sub>
- Giá trị trung bình của chlorophyll
 
Đi kèm với mỗi tham số trên là tần số của 7 loài tảo độc khác nhau tìm thấy tương ứng trong mỗi mẫu nước. Không có thông tin nào về tên của loại tảo được tìm thấy.
 
Bố dữ liệu thứ hai chứa thông tin về 140 quan sát bổ sung. Nó có cấu trúc tương tự bộ dữ liệu thứ nhất, tuy nhiên không bao gồm thông tin về tần suất xuất hiện của 7 loại tảo độc. Những quan sát bổ sung này có thể xem như một bộ kiểm thử. Mục tiêu chính của nghiên cứu này là dự đoán tần suất của 7 loại tảo cho 140 mẫu nước. Điều này có nghĩa chúng ta đang phải giải quyết một nhiệm vụ dự báo trong khai thác dữ liệu (Data Mining).
 
## 3. Nạp dữ liệu vào R
 
Có 2 cách để nạp dữ liệu cho nghiên cứu này: sử dụng thư viện `DMwR` hoặc tệp dữ liệu `Analysis.txt`.
 

{% highlight r %}
# Sử dụng thư viện có sẵn
library(DMwR)
{% endhighlight %}



{% highlight text %}
## Loading required package: lattice
## Loading required package: grid
{% endhighlight %}



{% highlight r %}
head(algae)
{% endhighlight %}



{% highlight text %}
##   season  size  speed mxPH mnO2     Cl    NO3     NH4    oPO4     PO4 Chla
## 1 winter small medium 8.00  9.8 60.800  6.238 578.000 105.000 170.000 50.0
## 2 spring small medium 8.35  8.0 57.750  1.288 370.000 428.750 558.750  1.3
## 3 autumn small medium 8.10 11.4 40.020  5.330 346.667 125.667 187.057 15.6
## 4 spring small medium 8.07  4.8 77.364  2.302  98.182  61.182 138.700  1.4
## 5 autumn small medium 8.06  9.0 55.350 10.416 233.700  58.222  97.580 10.5
## 6 winter small   high 8.25 13.1 65.750  9.248 430.000  18.250  56.667 28.4
##     a1   a2   a3  a4   a5   a6  a7
## 1  0.0  0.0  0.0 0.0 34.2  8.3 0.0
## 2  1.4  7.6  4.8 1.9  6.7  0.0 2.1
## 3  3.3 53.6  1.9 0.0  0.0  0.0 9.7
## 4  3.1 41.0 18.9 0.0  1.4  0.0 1.4
## 5  9.2  2.9  7.5 0.0  7.5  4.1 1.0
## 6 15.1 14.6  1.4 0.0 22.5 12.6 2.9
{% endhighlight %}
 

{% highlight r %}
# Nạp dữ liệu từ tệp Analysis.txt
algae <- read.table('Analysis.txt',
          header=F,
          dec='.',
          col.names=c('season','size','speed','mxPH','mnO2','Cl',
          'NO3','NH4','oPO4','PO4','Chla','a1','a2','a3','a4',
          'a5','a6','a7'),
          na.strings=c('XXXXXXX'))
{% endhighlight %}
 
## 4. Tổng hợp và phác họa dữ liệu
 

{% highlight r %}
# Sử dụng thư viện graphics
summary(algae)
{% endhighlight %}



{% highlight text %}
##     season       size       speed         mxPH            mnO2       
##  autumn:40   large :45   high  :84   Min.   :5.600   Min.   : 1.500  
##  spring:53   medium:84   low   :33   1st Qu.:7.700   1st Qu.: 7.725  
##  summer:45   small :71   medium:83   Median :8.060   Median : 9.800  
##  winter:62                           Mean   :8.012   Mean   : 9.118  
##                                      3rd Qu.:8.400   3rd Qu.:10.800  
##                                      Max.   :9.700   Max.   :13.400  
##                                      NA's   :1       NA's   :2       
##        Cl               NO3              NH4                oPO4       
##  Min.   :  0.222   Min.   : 0.050   Min.   :    5.00   Min.   :  1.00  
##  1st Qu.: 10.981   1st Qu.: 1.296   1st Qu.:   38.33   1st Qu.: 15.70  
##  Median : 32.730   Median : 2.675   Median :  103.17   Median : 40.15  
##  Mean   : 43.636   Mean   : 3.282   Mean   :  501.30   Mean   : 73.59  
##  3rd Qu.: 57.824   3rd Qu.: 4.446   3rd Qu.:  226.95   3rd Qu.: 99.33  
##  Max.   :391.500   Max.   :45.650   Max.   :24064.00   Max.   :564.60  
##  NA's   :10        NA's   :2        NA's   :2          NA's   :2       
##       PO4              Chla               a1              a2        
##  Min.   :  1.00   Min.   :  0.200   Min.   : 0.00   Min.   : 0.000  
##  1st Qu.: 41.38   1st Qu.:  2.000   1st Qu.: 1.50   1st Qu.: 0.000  
##  Median :103.29   Median :  5.475   Median : 6.95   Median : 3.000  
##  Mean   :137.88   Mean   : 13.971   Mean   :16.92   Mean   : 7.458  
##  3rd Qu.:213.75   3rd Qu.: 18.308   3rd Qu.:24.80   3rd Qu.:11.375  
##  Max.   :771.60   Max.   :110.456   Max.   :89.80   Max.   :72.600  
##  NA's   :2        NA's   :12                                        
##        a3               a4               a5               a6        
##  Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
##  1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
##  Median : 1.550   Median : 0.000   Median : 1.900   Median : 0.000  
##  Mean   : 4.309   Mean   : 1.992   Mean   : 5.064   Mean   : 5.964  
##  3rd Qu.: 4.925   3rd Qu.: 2.400   3rd Qu.: 7.500   3rd Qu.: 6.925  
##  Max.   :42.800   Max.   :44.600   Max.   :44.400   Max.   :77.600  
##                                                                     
##        a7        
##  Min.   : 0.000  
##  1st Qu.: 0.000  
##  Median : 1.000  
##  Mean   : 2.495  
##  3rd Qu.: 2.400  
##  Max.   :31.600  
## 
{% endhighlight %}



{% highlight r %}
hist(algae$mxPH, prob=T)
{% endhighlight %}

![plot of chunk histogram](../figures/data-mining-with-r-chapter-2/histogram-1.png) 

{% highlight r %}
# Sử dụng thư viện ggvis
# Tương tác
library(ggvis)
{% endhighlight %}



{% highlight text %}
## The ggvis API is currently rapidly evolving. We strongly recommend that you do not rely on this for production, but feel free to explore. If you encounter a clear bug, please file a minimal reproducible example at https://github.com/rstudio/ggvis/issues. For questions and other discussion, please use https://groups.google.com/group/ggvis.
{% endhighlight %}



{% highlight r %}
algae %>%
  ggvis(~mxPH) %>%
  layer_histograms(width=input_slider(0.1,2,1))
{% endhighlight %}



{% highlight text %}
## The `format` argument to sliderInput is deprecated. Use `sep`, `pre`, and `post` instead. (Last used in version 0.10.2.2)
## The `locale` argument to sliderInput is deprecated. Use `sep`, `pre`, and `post` instead. (Last used in version 0.10.2.2)
{% endhighlight %}



{% highlight text %}
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
{% endhighlight %}

<!--html_preserve--><div id="plot_id831999863-container" class="ggvis-output-container">
<div id="plot_id831999863" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id831999863_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id831999863" data-renderer="svg">SVG</a>
 | 
<a id="plot_id831999863_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id831999863" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id831999863_download" class="ggvis-download" data-plot-id="plot_id831999863">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id831999863_spec = {
    "data": [
        {
            "name": ".0/bin1/stack2",
            "format": {
                "type": "csv",
                "parse": {
                    "xmin_": "number",
                    "xmax_": "number",
                    "stack_upr_": "number",
                    "stack_lwr_": "number"
                }
            },
            "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n5.5,6.5,4,0\n6.5,7.5,31,0\n7.5,8.5,132,0\n8.5,9.5,31,0\n9.5,10.5,1,0\nNA,NA,1,0"
        },
        {
            "name": "scale/x",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n5.25\n10.75"
        },
        {
            "name": "scale/y",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n0\n138.6"
        }
    ],
    "scales": [
        {
            "name": "x",
            "domain": {
                "data": "scale/x",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "width"
        },
        {
            "name": "y",
            "domain": {
                "data": "scale/y",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "height"
        }
    ],
    "marks": [
        {
            "type": "rect",
            "properties": {
                "update": {
                    "stroke": {
                        "value": "#000000"
                    },
                    "fill": {
                        "value": "#333333"
                    },
                    "x": {
                        "scale": "x",
                        "field": "data.xmin_"
                    },
                    "x2": {
                        "scale": "x",
                        "field": "data.xmax_"
                    },
                    "y": {
                        "scale": "y",
                        "field": "data.stack_upr_"
                    },
                    "y2": {
                        "scale": "y",
                        "field": "data.stack_lwr_"
                    }
                },
                "ggvis": {
                    "data": {
                        "value": ".0/bin1/stack2"
                    }
                }
            },
            "from": {
                "data": ".0/bin1/stack2"
            }
        }
    ],
    "width": 504,
    "height": 504,
    "legends": [

    ],
    "axes": [
        {
            "type": "x",
            "scale": "x",
            "orient": "bottom",
            "layer": "back",
            "grid": true,
            "title": "mxPH"
        },
        {
            "type": "y",
            "scale": "y",
            "orient": "left",
            "layer": "back",
            "grid": true,
            "title": "count"
        }
    ],
    "padding": null,
    "ggvis_opts": {
        "keep_aspect": false,
        "resizable": true,
        "padding": {

        },
        "duration": 250,
        "renderer": "svg",
        "hover_duration": 0,
        "width": 504,
        "height": 504
    },
    "handlers": null
}
;
ggvis.getPlot("plot_id831999863").parseSpec(plot_id831999863_spec);
</script><!--/html_preserve-->

{% highlight r %}
# Không tương tác
algae %>%
  ggvis(~mxPH) %>%
  layer_densities(density_args = list(na.rm = T))
{% endhighlight %}

<!--html_preserve--><div id="plot_id646194082-container" class="ggvis-output-container">
<div id="plot_id646194082" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id646194082_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id646194082" data-renderer="svg">SVG</a>
 | 
<a id="plot_id646194082_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id646194082" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id646194082_download" class="ggvis-download" data-plot-id="plot_id646194082">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id646194082_spec = {
    "data": [
        {
            "name": ".0/density1",
            "format": {
                "type": "csv",
                "parse": {
                    "pred_": "number",
                    "resp_": "number"
                }
            },
            "values": "\"pred_\",\"resp_\"\n5.11068740973268,0.000157575218758366\n5.13060358691125,0.000227091763709107\n5.15051976408981,0.000323645540245078\n5.17043594126838,0.000451697999685389\n5.19035211844695,0.000626972785534306\n5.21026829562552,0.0008534373126273\n5.23018447280408,0.00114686479449614\n5.25010064998265,0.00152112439576339\n5.27001682716122,0.00198270940874853\n5.28993300433978,0.00256056201252233\n5.30984918151835,0.00325069157652865\n5.32976535869692,0.00407469433803226\n5.34968153587549,0.00503719697513506\n5.36959771305405,0.00613450727307262\n5.38951389023262,0.00738129531453138\n5.40943006741119,0.00874944810900556\n5.42934624458976,0.0102361191697471\n5.44926242176832,0.0118104533371163\n5.46917859894689,0.0134417243217935\n5.48909477612546,0.0150924443220146\n5.50901095330402,0.0167187447199314\n5.52892713048259,0.0182679670344885\n5.54884330766116,0.0196936364325861\n5.56875948483973,0.020951649208314\n5.58867566201829,0.0219784038791628\n5.60859183919686,0.0227642880325433\n5.62850801637543,0.02324508649453\n5.64842419355399,0.0234282057193598\n5.66834037073256,0.023301153228455\n5.68825654791113,0.0228524994498187\n5.7081727250897,0.0221310610654931\n5.72808890226826,0.0211274903609553\n5.74800507944683,0.0199103638592251\n5.7679212566254,0.0185120701352895\n5.78783743380396,0.0169803664418831\n5.80775361098253,0.0153728338965003\n5.8276697881611,0.0137330284721483\n5.84758596533967,0.0121114421783159\n5.86750214251823,0.0105488524393491\n5.8874183196968,0.0090848106828775\n5.90733449687537,0.00773708879920996\n5.92725067405394,0.00655173684187173\n5.9471668512325,0.00552176234127231\n5.96708302841107,0.00467299505851326\n5.98699920558964,0.00401236171257276\n6.0069153827682,0.0035338814667539\n6.02683155994677,0.00326990636527767\n6.04674773712534,0.00319681331855553\n6.06666391430391,0.00334167548846991\n6.08658009148247,0.00370722812710536\n6.10649626866104,0.00429547678826777\n6.12641244583961,0.00514911822169848\n6.14632862301818,0.00624985420622777\n6.16624480019674,0.00764407238398787\n6.18616097737531,0.00933390822116849\n6.20607715455388,0.0113286329509009\n6.22599333173244,0.0136710231327586\n6.24590950891101,0.0163268160839475\n6.26582568608958,0.0193363606907029\n6.28574186326815,0.0226637820356232\n6.30565804044671,0.0262929431286587\n6.32557421762528,0.0302096470795622\n6.34549039480385,0.0343413243809576\n6.36540657198241,0.0386551901399935\n6.38532274916098,0.0430600882560362\n6.40523892633955,0.0474803373066205\n6.42515510351812,0.0518124170929015\n6.44507128069668,0.0559736409563368\n6.46498745787525,0.0598232881925052\n6.48490363505382,0.0632944713926495\n6.50481981223238,0.066277832030219\n6.52473598941095,0.0686714458812057\n6.54465216658952,0.0704703502220017\n6.56456834376809,0.0715290970229185\n6.58448452094665,0.071931789232455\n6.60440069812522,0.0716394525205986\n6.62431687530379,0.0706947446547014\n6.64423305248236,0.069205821671802\n6.66414922966092,0.0671915174882824\n6.68406540683949,0.0648368016227538\n6.70398158401806,0.0622340745231814\n6.72389776119662,0.0595368729838828\n6.74381393837519,0.0568778039109931\n6.76373011555376,0.0544237381620697\n6.78364629273233,0.0522780215196574\n6.80356246991089,0.0506007306825143\n6.82347864708946,0.0494935803418688\n6.84339482426803,0.0490296705491889\n6.8633110014466,0.0493766189273618\n6.88322717862516,0.0505009560335271\n6.90314335580373,0.052554738973302\n6.9230595329823,0.0555251846556568\n6.94297571016086,0.0594328817566142\n6.96289188733943,0.0643799810584605\n6.982808064518,0.070256178013845\n7.00272424169657,0.0771843956616994\n7.02264041887513,0.0850672068602484\n7.0425565960537,0.0939009156566181\n7.06247277323227,0.103712257685096\n7.08238895041083,0.114363559929377\n7.1023051275894,0.125923513721959\n7.12222130476797,0.138237664270004\n7.14213748194654,0.15126839869336\n7.1620536591251,0.164952440907228\n7.18196983630367,0.179143959493104\n7.20188601348224,0.193807900722387\n7.2218021906608,0.208775261354708\n7.24171836783937,0.223955169167083\n7.26163454501794,0.239222744359028\n7.28155072219651,0.254469115410692\n7.30146689937507,0.269568373585079\n7.32138307655364,0.284449241489436\n7.34129925373221,0.299020716273298\n7.36121543091078,0.31322825377915\n7.38113160808934,0.327072824815305\n7.40104778526791,0.340503773100275\n7.42096396244648,0.353611460515823\n7.44088013962504,0.366425453296622\n7.46079631680361,0.379049332129242\n7.48071249398218,0.391590554858124\n7.50062867116075,0.404180926988655\n7.52054484833931,0.41693964105903\n7.54046102551788,0.430016203077902\n7.56037720269645,0.443518265181436\n7.58029337987501,0.457523573766935\n7.60020955705358,0.472158464829974\n7.62012573423215,0.487376549159577\n7.64004191141072,0.503242061923382\n7.65995808858928,0.519657127915829\n7.67987426576785,0.536538892635684\n7.69979044294642,0.553780746351115\n7.71970662012498,0.571197238131989\n7.73962279730355,0.588620317229152\n7.75953897448212,0.605850998187816\n7.77945515166069,0.62270207406331\n7.79937132883925,0.638940764659294\n7.81928750601782,0.654466716309084\n7.83920368319639,0.668998260850074\n7.85911986037496,0.68250726577397\n7.87903603755352,0.694840989677183\n7.89895221473209,0.705869831428802\n7.91886839191066,0.71565798491341\n7.93878456908922,0.723961347496593\n7.95870074626779,0.730955022752972\n7.97861692344636,0.736545954804312\n7.99853310062493,0.740742545881184\n8.01844927780349,0.74368370114761\n8.03836545498206,0.745213298230514\n8.05828163216063,0.745591199979208\n8.07819780933919,0.74477522401251\n8.09811398651776,0.742864658372753\n8.11803016369633,0.739995017236493\n8.1379463408749,0.73612534435028\n8.15786251805346,0.731467376109855\n8.17777869523203,0.726010481486483\n8.1976948724106,0.719851187464747\n8.21761104958916,0.71306090975247\n8.23752722676773,0.70560829457682\n8.2574434039463,0.697596774370906\n8.27735958112487,0.68896681283195\n8.29727575830343,0.679746170801789\n8.317191935482,0.669925972945488\n8.33710811266057,0.659420789525806\n8.35702428983913,0.648279686254051\n8.3769404670177,0.636382783989526\n8.39685664419627,0.623752971391558\n8.41677282137484,0.610354921577364\n8.4366889985534,0.59610931795538\n8.45660517573197,0.581092541995899\n8.47652135291054,0.565190224121935\n8.49643753008911,0.548498361026147\n8.51635370726767,0.531013574006125\n8.53626988444624,0.512745441937584\n8.55618606162481,0.493822319702522\n8.57610223880337,0.474227170415051\n8.59601841598194,0.454133969431588\n8.61593459316051,0.433620270159403\n8.63585077033908,0.412817845786989\n8.65576694751764,0.391879166469181\n8.67568312469621,0.370958803981013\n8.69559930187478,0.350217627451644\n8.71551547905334,0.329832618712421\n8.73543165623191,0.309987257716188\n8.75534783341048,0.290788503839253\n8.77526401058905,0.272511946874256\n8.79518018776761,0.255157709669659\n8.81509636494618,0.238922248035201\n8.83501254212475,0.223862949435276\n8.85492871930332,0.209959362668165\n8.87484489648188,0.197367387708342\n8.89476107366045,0.185879460899449\n8.91467725083902,0.175542164736922\n8.93459342801759,0.166188412703845\n8.95450960519615,0.157665893637496\n8.97442578237472,0.149883503306983\n8.99434195955329,0.142591079106086\n9.01425813673185,0.135674231577201\n9.03417431391042,0.128943824461271\n9.05409049108899,0.122273992018138\n9.07400666826755,0.115549587191285\n9.09392284544612,0.10871094078627\n9.11383902262469,0.101708573514291\n9.13375519980326,0.0945640319514189\n9.15367137698182,0.0873149012642692\n9.17358755416039,0.0800369107961211\n9.19350373133896,0.072821070424272\n9.21341990851753,0.0657965744906769\n9.23333608569609,0.0590593880554926\n9.25325226287466,0.0527238393267659\n9.27316844005323,0.0469100887477185\n9.29308461723179,0.0416380278510659\n9.31300079441036,0.0370524769924189\n9.33291697158893,0.0330934171878473\n9.35283314876749,0.0298016550048362\n9.37274932594606,0.027159195411789\n9.39266550312463,0.0250718820004704\n9.4125816803032,0.0235635372246424\n9.43249785748176,0.0224782033892976\n9.45241403466033,0.0217770650947998\n9.4723302118389,0.0213680539765171\n9.49224638901747,0.0211615013416506\n9.51216256619603,0.0211014616755106\n9.5320787433746,0.0211028325552353\n9.55199492055317,0.0211145382969597\n9.57191109773174,0.0210845497896442\n9.5918272749103,0.0209798408034701\n9.61174345208887,0.0207582557960053\n9.63165962926744,0.0204158784452466\n9.651575806446,0.0199272148254225\n9.67149198362457,0.0192959420404484\n9.69140816080314,0.0185276279341509\n9.71132433798171,0.0176193580768289\n9.73124051516027,0.0166014171421906\n9.75115669233884,0.0154796233156646\n9.77107286951741,0.0142847775288422\n9.79098904669597,0.0130392408805313\n9.81090522387454,0.0117680983055126\n9.83082140105311,0.0104977872475574\n9.85073757823168,0.00925456351024569\n9.87065375541024,0.00805849730262611\n9.89056993258881,0.0069283778030694\n9.91048610976738,0.00588417786605866\n9.93040228694595,0.00492717128447075\n9.95031846412451,0.00407779943570877\n9.97023464130308,0.003326361076296\n9.99015081848165,0.00267665132486714\n10.0100669956602,0.00212669774452122\n10.0299831728388,0.0016615693425683\n10.0498993500173,0.00128564261908836\n10.0698155271959,0.000977770537553326\n10.0897317043745,0.000733760735656319\n10.109647881553,0.000543464097335761\n10.1295640587316,0.000394763311740559\n10.1494802359102,0.000284966790735021\n10.1693964130888,0.000201463253979222\n10.1893125902673,0.000140781963661413"
        },
        {
            "name": "scale/x",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n4.85675615070595\n10.4432438492941"
        },
        {
            "name": "scale/y",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n-0.0372795599989604\n0.782870759978168"
        }
    ],
    "scales": [
        {
            "name": "x",
            "domain": {
                "data": "scale/x",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "width"
        },
        {
            "name": "y",
            "domain": {
                "data": "scale/y",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "height"
        }
    ],
    "marks": [
        {
            "type": "area",
            "properties": {
                "update": {
                    "fill": {
                        "value": "#333333"
                    },
                    "y2": {
                        "scale": "y",
                        "value": 0
                    },
                    "fillOpacity": {
                        "value": 0.2
                    },
                    "x": {
                        "scale": "x",
                        "field": "data.pred_"
                    },
                    "y": {
                        "scale": "y",
                        "field": "data.resp_"
                    },
                    "stroke": {
                        "value": "transparent"
                    }
                },
                "ggvis": {
                    "data": {
                        "value": ".0/density1"
                    }
                }
            },
            "from": {
                "data": ".0/density1"
            }
        },
        {
            "type": "line",
            "properties": {
                "update": {
                    "stroke": {
                        "value": "#000000"
                    },
                    "x": {
                        "scale": "x",
                        "field": "data.pred_"
                    },
                    "y": {
                        "scale": "y",
                        "field": "data.resp_"
                    },
                    "fill": {
                        "value": "transparent"
                    }
                },
                "ggvis": {
                    "data": {
                        "value": ".0/density1"
                    }
                }
            },
            "from": {
                "data": ".0/density1"
            }
        }
    ],
    "width": 504,
    "height": 504,
    "legends": [

    ],
    "axes": [
        {
            "type": "x",
            "scale": "x",
            "orient": "bottom",
            "layer": "back",
            "grid": true,
            "title": "mxPH"
        },
        {
            "type": "y",
            "scale": "y",
            "orient": "left",
            "layer": "back",
            "grid": true,
            "title": "density"
        }
    ],
    "padding": null,
    "ggvis_opts": {
        "keep_aspect": false,
        "resizable": true,
        "padding": {

        },
        "duration": 250,
        "renderer": "svg",
        "hover_duration": 0,
        "width": 504,
        "height": 504
    },
    "handlers": null
}
;
ggvis.getPlot("plot_id646194082").parseSpec(plot_id646194082_spec);
</script><!--/html_preserve-->

{% highlight r %}
# Sử dụng qqplot của thư viện car
library(car)
par(mfrow=c(1,2))
hist(algae$mxPH, prob=T, xlab='',
      main='Histogram of maximum pH value',ylim=0:1)
lines(density(algae$mxPH,na.rm=T))
rug(jitter(algae$mxPH))
qqPlot(algae$mxPH,main='Normal QQ plot of maximum pH')
{% endhighlight %}

![plot of chunk histogram](../figures/data-mining-with-r-chapter-2/histogram-2.png) 

{% highlight r %}
par(mfrow=c(1,1))
 
# Sử dụng thư viện ggplot2
library(ggplot2)
{% endhighlight %}



{% highlight text %}
## Use suppressPackageStartupMessages to eliminate package startup messages.
## 
## Attaching package: 'ggplot2'
## 
## The following object is masked from 'package:ggvis':
## 
##     resolution
{% endhighlight %}



{% highlight r %}
library(gridExtra)
plot1 <- ggplot(algae, aes(mxPH)) + 
  geom_histogram(binwidth=0.5, aes(y=..density..), fill="white", color="black") + 
  geom_density(alpha=0.2) + 
  geom_rug()
plot2 <- ggplot(algae, aes(sample = mxPH)) + stat_qq()
grid.arrange(plot1, plot2, ncol=2)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing non-finite values (stat_density).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (stat_qq).
{% endhighlight %}

![plot of chunk histogram](../figures/data-mining-with-r-chapter-2/histogram-3.png) 
 

{% highlight r %}
# Sử dụng thư viện graphics
boxplot(algae$oPO4,ylab='Orthophosphate (oPO4)')
rug(jitter(algae$oPO4),side=2)
abline(h=mean(algae$oPO4,na.rm=T),lty=2)
{% endhighlight %}

![plot of chunk boxplot](../figures/data-mining-with-r-chapter-2/boxplot-1.png) 

{% highlight r %}
# Sử dụng thư viện ggplot2
ggplot(algae, aes(x = factor(0), y = oPO4)) + 
  geom_boxplot(varwidth=T) + xlab("") + 
  geom_rug() + 
  geom_abline(intercept=mean(algae$oPO4,na.rm=T), linetype=2)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing non-finite values (stat_boxplot).
{% endhighlight %}

![plot of chunk boxplot](../figures/data-mining-with-r-chapter-2/boxplot-2.png) 
 

{% highlight r %}
# Sử dụng thư viện graphic
plot(algae$NH4,xlab='')
abline(h=mean(algae$NH4,na.rm=T),lty=1)
abline(h=mean(algae$NH4,na.rm=T)+sd(algae$NH4,na.rm=T),lty=2)
abline(h=median(algae$NH4,na.rm=T),lty=3)
identify(algae$NH4)
{% endhighlight %}

![plot of chunk scatterplot](../figures/data-mining-with-r-chapter-2/scatterplot-1.png) 

{% highlight text %}
## integer(0)
{% endhighlight %}



{% highlight r %}
plot(algae$NH4,xlab='')
clicked.lines <- identify(algae$NH4)
{% endhighlight %}

![plot of chunk scatterplot](../figures/data-mining-with-r-chapter-2/scatterplot-2.png) 

{% highlight r %}
algae[clicked.lines,]
{% endhighlight %}



{% highlight text %}
##  [1] season size   speed  mxPH   mnO2   Cl     NO3    NH4    oPO4   PO4   
## [11] Chla   a1     a2     a3     a4     a5     a6     a7    
## <0 rows> (or 0-length row.names)
{% endhighlight %}



{% highlight r %}
algae[algae$NH4 > 19000,]
{% endhighlight %}



{% highlight text %}
##      season   size speed mxPH mnO2     Cl   NO3   NH4 oPO4 PO4 Chla  a1 a2
## NA     <NA>   <NA>  <NA>   NA   NA     NA    NA    NA   NA  NA   NA  NA NA
## 153  autumn medium  high  7.3 11.8 44.205 45.65 24064   44  34 53.1 2.2  0
## NA.1   <NA>   <NA>  <NA>   NA   NA     NA    NA    NA   NA  NA   NA  NA NA
##      a3  a4  a5   a6 a7
## NA   NA  NA  NA   NA NA
## 153   0 1.2 5.9 77.6  0
## NA.1 NA  NA  NA   NA NA
{% endhighlight %}



{% highlight r %}
# Sử dụng thư viện ggplot2
ggplot(algae, aes(y=NH4,x=seq_along(NH4))) + geom_point()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk scatterplot](../figures/data-mining-with-r-chapter-2/scatterplot-3.png) 

{% highlight r %}
# Sử dụng thư viện ggvis
all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x), ": ", format(x), collapse = "<br />")
}
algae %>%
  ggvis(x=~seq_along(NH4), y = ~NH4) %>%
  layer_points() %>%
  add_tooltip(all_values, "hover")
{% endhighlight %}



{% highlight text %}
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
{% endhighlight %}

<!--html_preserve--><div id="plot_id326805403-container" class="ggvis-output-container">
<div id="plot_id326805403" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id326805403_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id326805403" data-renderer="svg">SVG</a>
 | 
<a id="plot_id326805403_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id326805403" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id326805403_download" class="ggvis-download" data-plot-id="plot_id326805403">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id326805403_spec = {
    "data": [
        {
            "name": ".0",
            "format": {
                "type": "csv",
                "parse": {
                    "seq_along(NH4)": "number",
                    "NH4": "number"
                }
            },
            "values": "\"seq_along(NH4)\",\"NH4\"\n1,578\n2,370\n3,346.66699\n4,98.182\n5,233.7\n6,430\n7,110\n8,205.66701\n9,102.75\n10,5.8\n11,21.571\n12,18.429\n13,27.286\n14,8\n15,46.2\n16,14.75\n17,34.333\n18,31.333\n19,49\n20,8777.59961\n21,1729\n22,81\n23,42\n24,208.33299\n25,12.5\n26,58.5\n27,28\n28,20\n29,20\n30,120\n31,60\n32,60\n33,49.5\n34,3515\n35,6400\n36,1911\n37,13.5\n38,10\n39,228.75\n40,178.57001\n41,122.85\n42,647.57001\n43,76\n44,51.429\n45,37.5\n46,22.5\n47,39\n48,10\n49,40\n50,35\n51,192.5\n52,28.333\n53,18.333\n54,33.636\n55,10\n56,5\n57,10\n58,20\n59,10\n60,10\n61,10\n62,NA\n63,18\n64,27.5\n65,160\n66,15\n67,15\n68,16.2\n69,1386.25\n70,2082.8501\n71,2167.37012\n72,225\n73,109\n74,245\n75,271.25\n76,32.5\n77,224.286\n78,133.636\n79,165\n80,101\n81,255\n82,130\n83,123.333\n84,89.6\n85,737.5\n86,914\n87,429.20001\n88,5738.33008\n89,4073.33008\n90,124.167\n91,101.25\n92,153\n93,96.667\n94,98.333\n95,137\n96,215.714\n97,105.556\n98,155\n99,153.75\n100,421.66699\n101,122.5\n102,215.556\n103,371.11099\n104,758.75\n105,308.75\n106,38.111\n107,239\n108,931.83301\n109,723.66699\n110,461.875\n111,51.111\n112,25\n113,206.53799\n114,118.571\n115,217.75\n116,10\n117,25.833\n118,12.727\n119,131.66701\n120,92\n121,345.45499\n122,56.364\n123,128.571\n124,170.909\n125,65.556\n126,43.75\n127,246.364\n128,76.667\n129,102.5\n130,236\n131,103.333\n132,92.375\n133,3466.65991\n134,380\n135,196\n136,120\n137,46.5\n138,124\n139,112.857\n140,505\n141,175\n142,34\n143,132.25\n144,920\n145,196.66701\n146,1990.16003\n147,172.5\n148,235\n149,84.667\n150,91.833\n151,54.75\n152,90\n153,24064\n154,176.66701\n155,486.5\n156,1131.66003\n157,1495\n158,134\n159,96.833\n160,62.5\n161,142\n162,146.66701\n163,103.333\n164,52.2\n165,101.667\n166,244.60001\n167,137.27299\n168,227.60001\n169,643\n170,627.27301\n171,1168\n172,1081.66003\n173,124.364\n174,66.667\n175,197.909\n176,54.778\n177,32.727\n178,12.5\n179,53.846\n180,11.111\n181,10\n182,10.5\n183,32\n184,40\n185,32.5\n186,161.81799\n187,88.182\n188,43.75\n189,82.1\n190,17.778\n191,103\n192,65.455\n193,37.778\n194,72.6\n195,96.667\n196,83.75\n197,125.333\n198,60.11\n199,NA\n200,27.069"
        },
        {
            "name": "scale/x",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n-8.95\n209.95"
        },
        {
            "name": "scale/y",
            "format": {
                "type": "csv",
                "parse": {
                    "domain": "number"
                }
            },
            "values": "\"domain\"\n-1197.95\n25266.95"
        }
    ],
    "scales": [
        {
            "name": "x",
            "domain": {
                "data": "scale/x",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "width"
        },
        {
            "name": "y",
            "domain": {
                "data": "scale/y",
                "field": "data.domain"
            },
            "zero": false,
            "nice": false,
            "clamp": false,
            "range": "height"
        }
    ],
    "marks": [
        {
            "type": "symbol",
            "properties": {
                "update": {
                    "fill": {
                        "value": "#000000"
                    },
                    "size": {
                        "value": 50
                    },
                    "x": {
                        "scale": "x",
                        "field": "data.seq_along(NH4)"
                    },
                    "y": {
                        "scale": "y",
                        "field": "data.NH4"
                    }
                },
                "ggvis": {
                    "data": {
                        "value": ".0"
                    }
                }
            },
            "from": {
                "data": ".0"
            }
        }
    ],
    "width": 504,
    "height": 504,
    "legends": [

    ],
    "axes": [
        {
            "type": "x",
            "scale": "x",
            "orient": "bottom",
            "layer": "back",
            "grid": true,
            "title": "seq_along(NH4)"
        },
        {
            "type": "y",
            "scale": "y",
            "orient": "left",
            "layer": "back",
            "grid": true,
            "title": "NH4"
        }
    ],
    "padding": null,
    "ggvis_opts": {
        "keep_aspect": false,
        "resizable": true,
        "padding": {

        },
        "duration": 250,
        "renderer": "svg",
        "hover_duration": 0,
        "width": 504,
        "height": 504
    },
    "handlers": null
}
;
ggvis.getPlot("plot_id326805403").parseSpec(plot_id326805403_spec);
</script><!--/html_preserve-->
 

{% highlight r %}
# Sử dụng thư viện lattice
library(lattice)
print(bwplot(size ~ a1, data=algae,ylab='River Size',xlab='Algal A1'))
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-1.png) 

{% highlight r %}
# Sử dụng ggplot2
ggplot(algae) + 
  geom_boxplot(aes(y = a1, x = size)) + 
  ylab("Algal A1") + xlab("River Size") +
  coord_flip()
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-2.png) 

{% highlight r %}
# Sử dụng Hmisc
library(Hmisc)
{% endhighlight %}



{% highlight text %}
## Loading required package: survival
## Loading required package: splines
## Loading required package: Formula
## 
## Attaching package: 'Hmisc'
## 
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
{% endhighlight %}



{% highlight r %}
print(bwplot(size ~ a1, data=algae, panel=panel.bpplot, 
        probs=seq(.01,.49,by=.01), datadensity=TRUE,
        ylab='River Size',xlab='Algal A1'))
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-3.png) 

{% highlight r %}
# Sử dụng ggplot2
ggplot(algae) +
  geom_violin(aes(y = a1, x = size)) + 
  ylab("Algal A1") + xlab("River Size") +
  coord_flip()
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-4.png) 

{% highlight r %}
# Sử dụng lattice
minO2 <- equal.count(na.omit(algae$mnO2),
                     number=4,overlap=1/5)
stripplot(season ~ a3|minO2,
          data=algae[!is.na(algae$mnO2),])
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-5.png) 

{% highlight r %}
# Sử dụng ggplot2
qplot(a3, mnO2, data=algae) + facet_grid(season ~ .)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_point).
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk conditional](../figures/data-mining-with-r-chapter-2/conditional-6.png) 
 
## 5. Giá trị không xác định
 
Khi gặp các bộ dữ liệu có chứa các giá trị không xác định chúng ta có thể giải quyết theo một trong các hướng sau:
 
- Loại bỏ các trường hợp có chứa các giá trị chưa biết
- Tính các giá trị chưa biết bằng cách tìm mối tương quan giữa các biến
- Tính các giá trị chưa biết bằng cách tìm sự tương tự giữa các biến
- Sử dụng công cụ có khả năng xử lý được các giá trị này
 
### Loại bỏ các trường hợp chứa các giá trị không xác định
 

{% highlight r %}
library(DMwR)
data(algae)
 
algae[!complete.cases(algae),]
 
 
nrow(algae[!complete.cases(algae),])
 
 
algae <- na.omit(algae)
 
 
algae <- algae[-c(62,199),]
 
 
apply(algae,1,function(x) sum(is.na(x)))
 
 
data(algae)
manyNAs(algae,0.2)
 
 
algae <- algae[-manyNAs(algae),]
{% endhighlight %}
 
### Thay các giá trị chưa biết bằng trung bình, trung vị, hoặc mốt
 

{% highlight r %}
# Trung bình
algae[48,'mxPH'] <- mean(algae$mxPH,na.rm=T)
 
# Trung vị
algae[is.na(algae$Chla),'Chla'] <- median(algae$Chla,na.rm=T)
 
# Trung vị & mốt
data(algae)
algae <- algae[-manyNAs(algae),]
algae <- centralImputation(algae)
{% endhighlight %}
 
### Thay các giá trị chưa biết bằng tìm mối tương quan
 

{% highlight r %}
# Tìm hệ số tương quan
cor(algae[,4:18],use="complete.obs")
 
# Ma trận tương quan
symnum(cor(algae[,4:18],use="complete.obs"))
 
# Xét riêng PO4 và oPO4
data(algae)
algae <- algae[-manyNAs(algae),]
lm(PO4 ~ oPO4,data=algae)
 
# Thay thế
algae[28,'PO4'] <- 42.897 + 1.293 * algae[28,'oPO4']
 
# Thay thế đồng loạt
data(algae)
algae <- algae[-manyNAs(algae),]
fillPO4 <- function(oP) {
   if (is.na(oP)) return(NA)
   else return(42.897 + 1.293 * oP)
}
algae[is.na(algae$PO4),'PO4'] <- 
    sapply(algae[is.na(algae$PO4),'oPO4'],fillPO4)
{% endhighlight %}
 
Tìm mối tương quan giữa các biến chứa các đại lượng chưa biến và các biến danh nghĩa
 

{% highlight r %}
# Sử dụng lattice
histogram(~ mxPH | season,data=algae)
{% endhighlight %}

![plot of chunk hist](../figures/data-mining-with-r-chapter-2/hist-1.png) 

{% highlight r %}
# ggplto2
ggplot(algae) +
  geom_histogram(aes(x=mxPH, y=..density..), binwidth=0.4, color="white") +
  facet_grid(. ~ season)
{% endhighlight %}

![plot of chunk hist](../figures/data-mining-with-r-chapter-2/hist-2.png) 
 

{% highlight r %}
# Chuyển sang lớp factor
algae$season <- factor(algae$season,levels=c('spring','summer','autumn','winter'))
{% endhighlight %}
 

{% highlight r %}
# lattice
histogram(~ mxPH | size*speed,data=algae)
{% endhighlight %}

![plot of chunk hist2](../figures/data-mining-with-r-chapter-2/hist2-1.png) 

{% highlight r %}
# ggplot2
ggplot(algae) +
  geom_histogram(aes(x=mxPH, y=..density..), binwidth=0.4, color="white") +
  facet_grid(size ~ speed)
{% endhighlight %}

![plot of chunk hist2](../figures/data-mining-with-r-chapter-2/hist2-2.png) 

{% highlight r %}
# lattice
stripplot(size ~ mxPH | speed, data=algae, jitter=T)
{% endhighlight %}

![plot of chunk hist2](../figures/data-mining-with-r-chapter-2/hist2-3.png) 

{% highlight r %}
#ggplot2
ggplot(algae) +
  geom_point(aes(x=mxPH, y=seq_along(mxPH)), binwidth=0.4, size=3) +
  facet_grid(size ~ speed)
{% endhighlight %}



{% highlight text %}
## Warning: Removed 1 rows containing missing values (geom_point).
{% endhighlight %}

![plot of chunk hist2](../figures/data-mining-with-r-chapter-2/hist2-4.png) 
 
### Thay thế các giá trị chưa biết bằng cách tìm sự tương tự giữa các biến
 

{% highlight r %}
data(algae)
algae <- algae[-manyNAs(algae),]
 
# Hàng xóm gần nhất trung bình có trọng số
algae <- knnImputation(algae,k=10)
 
# Phương pháp trung vị
algae <- knnImputation(algae,k=10,meth='median')
{% endhighlight %}
 
## 6. Xây dựng mô hình dự đoán
 
Trong nghiên cứu này chúng tôi sẽ áp dụng 2 mô hình dự đoán khác nhau có thể áp dụng cho các nghiên cứu về tảo: hồi quy tuyến tính đa biến và cây hồi quy. Lựa chọn này là do mục đích trình diễn trong khuôn khổ cuốn sách và chưa phải là kết quả của một bước lựa chọn mô hình tiêu chuẩn.
 
### Hồi quy tuyến tính đa biến
 

{% highlight r %}
# Loại bỏ các giá trị chưa biết
data(algae)
algae <- algae[-manyNAs(algae), ]
clean.algae <- knnImputation(algae, k = 10)
 
# Chạy mô hình cho 1 biến
lm.a1 <- lm(a1 ~ ., data=clean.algae[,1:12])
 
# Các thông số của mô hình
summary(lm.a1)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = a1 ~ ., data = clean.algae[, 1:12])
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -37.699 -11.899  -2.553   7.411  62.185 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)   
## (Intercept)  46.749310  23.518066   1.988  0.04833 * 
## seasonsummer -2.986220   3.743563  -0.798  0.42609   
## seasonautumn -3.702680   4.136646  -0.895  0.37192   
## seasonwinter -0.018635   3.394557  -0.005  0.99563   
## sizemedium    3.260202   3.801478   0.858  0.39223   
## sizesmall     9.674317   4.179509   2.315  0.02175 * 
## speedlow      3.928730   4.702385   0.835  0.40455   
## speedmedium   0.240118   3.240419   0.074  0.94101   
## mxPH         -3.594709   2.701250  -1.331  0.18493   
## mnO2          1.052234   0.704937   1.493  0.13726   
## Cl           -0.040375   0.033654  -1.200  0.23181   
## NO3          -1.511363   0.551089  -2.743  0.00671 **
## NH4           0.001633   0.001003   1.628  0.10522   
## oPO4         -0.005288   0.039865  -0.133  0.89463   
## PO4          -0.052346   0.030735  -1.703  0.09025 . 
## Chla         -0.088835   0.079893  -1.112  0.26764   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 17.64 on 182 degrees of freedom
## Multiple R-squared:  0.3734,	Adjusted R-squared:  0.3217 
## F-statistic:  7.23 on 15 and 182 DF,  p-value: 2.371e-12
{% endhighlight %}



{% highlight r %}
# Phân tích phương sai để loại bỏ dần các biến
anova(lm.a1)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Response: a1
##            Df Sum Sq Mean Sq F value    Pr(>F)    
## season      3     85    28.2  0.0905  0.965176    
## size        2  11401  5700.7 18.3157 5.658e-08 ***
## speed       2   3934  1967.2  6.3203  0.002219 ** 
## mxPH        1   1329  1329.5  4.2714  0.040175 *  
## mnO2        1   2286  2286.4  7.3458  0.007365 ** 
## Cl          1   4317  4317.3 13.8709  0.000261 ***
## NO3         1   3416  3415.7 10.9742  0.001114 ** 
## NH4         1    403   402.6  1.2936  0.256884    
## oPO4        1   4784  4783.9 15.3702  0.000125 ***
## PO4         1   1414  1413.6  4.5418  0.034420 *  
## Chla        1    385   384.8  1.2364  0.267638    
## Residuals 182  56647   311.2                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
{% endhighlight %}



{% highlight r %}
# Loại bỏ biến season ra khỏi mô hình 1
lm2.a1 <- update(lm.a1, . ~ . - season)
 
# Các thông số của mô hình 2
summary(lm2.a1)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + 
##     oPO4 + PO4 + Chla, data = clean.algae[, 1:12])
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -36.478 -11.743  -3.036   7.449  63.719 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)   
## (Intercept) 45.0180864 23.2268397   1.938  0.05412 . 
## sizemedium   3.3082723  3.7818883   0.875  0.38283   
## sizesmall   10.2685155  4.1217771   2.491  0.01361 * 
## speedlow     3.0665309  4.6076756   0.666  0.50654   
## speedmedium -0.3010598  3.1805504  -0.095  0.92469   
## mxPH        -3.2726316  2.6559391  -1.232  0.21944   
## mnO2         0.8016549  0.6588092   1.217  0.22522   
## Cl          -0.0383513  0.0333720  -1.149  0.25195   
## NO3         -1.5334364  0.5474276  -2.801  0.00563 **
## NH4          0.0015778  0.0009949   1.586  0.11448   
## oPO4        -0.0060570  0.0394914  -0.153  0.87827   
## PO4         -0.0511060  0.0305023  -1.675  0.09553 . 
## Chla        -0.0848708  0.0793461  -1.070  0.28618   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 17.57 on 185 degrees of freedom
## Multiple R-squared:  0.3684,	Adjusted R-squared:  0.3275 
## F-statistic: 8.993 on 12 and 185 DF,  p-value: 1.706e-13
{% endhighlight %}



{% highlight r %}
# So sánh 2 mô hình
anova(lm.a1,lm2.a1)
{% endhighlight %}



{% highlight text %}
## Analysis of Variance Table
## 
## Model 1: a1 ~ season + size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + 
##     PO4 + Chla
## Model 2: a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + 
##     Chla
##   Res.Df   RSS Df Sum of Sq      F Pr(>F)
## 1    182 56647                           
## 2    185 57095 -3    -447.4 0.4791 0.6972
{% endhighlight %}



{% highlight r %}
# Sử dụng hàm step để lặp lại việc đơn giản hóa mô hình
# sử dụng AIC (Akaike Information Criterion)
final.lm <- step(lm.a1)
{% endhighlight %}



{% highlight text %}
## Start:  AIC=1151.95
## a1 ~ season + size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + 
##     PO4 + Chla
## 
##          Df Sum of Sq   RSS    AIC
## - season  3    447.40 57095 1147.5
## - speed   2    271.43 56919 1148.9
## - oPO4    1      5.48 56653 1150.0
## - Chla    1    384.82 57032 1151.3
## - Cl      1    447.99 57095 1151.5
## - mxPH    1    551.19 57198 1151.9
## <none>                56647 1152.0
## - mnO2    1    693.47 57341 1152.4
## - NH4     1    825.10 57472 1152.8
## - PO4     1    902.85 57550 1153.1
## - size    2   1854.23 58501 1154.3
## - NO3     1   2340.99 58988 1158.0
## 
## Step:  AIC=1147.51
## a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + 
##     Chla
## 
##         Df Sum of Sq   RSS    AIC
## - speed  2    212.65 57307 1144.2
## - oPO4   1      7.26 57102 1145.5
## - Chla   1    353.09 57448 1146.7
## - Cl     1    407.59 57502 1146.9
## - mnO2   1    456.96 57551 1147.1
## - mxPH   1    468.58 57563 1147.1
## <none>               57095 1147.5
## - NH4    1    776.16 57871 1148.2
## - PO4    1    866.37 57961 1148.5
## - size   2   2173.46 59268 1150.9
## - NO3    1   2421.59 59516 1153.7
## 
## Step:  AIC=1144.25
## a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + Chla
## 
##        Df Sum of Sq   RSS    AIC
## - oPO4  1     15.78 57323 1142.3
## - Chla  1    228.68 57536 1143.0
## - mnO2  1    413.83 57721 1143.7
## - Cl    1    476.58 57784 1143.9
## - mxPH  1    484.70 57792 1143.9
## <none>              57307 1144.2
## - NH4   1    719.82 58027 1144.7
## - PO4   1    813.99 58121 1145.0
## - size  2   2057.77 59365 1147.2
## - NO3   1   2379.88 59687 1150.3
## 
## Step:  AIC=1142.3
## a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + PO4 + Chla
## 
##        Df Sum of Sq   RSS    AIC
## - Chla  1     213.9 57537 1141.0
## - mnO2  1     402.8 57726 1141.7
## - Cl    1     474.5 57797 1141.9
## - mxPH  1     520.8 57844 1142.1
## <none>              57323 1142.3
## - NH4   1     704.5 58027 1142.7
## - size  2    2047.9 59371 1145.2
## - NO3   1    2370.8 59694 1148.3
## - PO4   1    5823.8 63147 1159.5
## 
## Step:  AIC=1141.04
## a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + PO4
## 
##        Df Sum of Sq   RSS    AIC
## - mnO2  1     434.5 57971 1140.5
## - Cl    1     440.8 57978 1140.5
## <none>              57537 1141.0
## - NH4   1     746.9 58284 1141.6
## - mxPH  1     836.9 58374 1141.9
## - size  2    2217.3 59754 1144.5
## - NO3   1    2667.6 60204 1148.0
## - PO4   1    6315.4 63852 1159.7
## 
## Step:  AIC=1140.53
## a1 ~ size + mxPH + Cl + NO3 + NH4 + PO4
## 
##        Df Sum of Sq   RSS    AIC
## - NH4   1     531.3 58503 1140.3
## - Cl    1     588.1 58559 1140.5
## <none>              57971 1140.5
## - mxPH  1     823.4 58795 1141.3
## - size  2    2477.8 60449 1144.8
## - NO3   1    2252.7 60224 1146.1
## - PO4   1    9101.3 67073 1167.4
## 
## Step:  AIC=1140.33
## a1 ~ size + mxPH + Cl + NO3 + PO4
## 
##        Df Sum of Sq   RSS    AIC
## <none>              58503 1140.3
## - mxPH  1     788.3 59291 1141.0
## - Cl    1     839.8 59342 1141.2
## - NO3   1    1989.2 60492 1145.0
## - size  2    2663.9 61167 1145.2
## - PO4   1    8578.8 67081 1165.4
{% endhighlight %}



{% highlight r %}
# Thông số của mô hình cuối
summary(final.lm)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = a1 ~ size + mxPH + Cl + NO3 + PO4, data = clean.algae[, 
##     1:12])
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -28.884 -12.733  -3.739   8.423  62.914 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 57.37988   20.95697   2.738  0.00677 ** 
## sizemedium   2.79956    3.40145   0.823  0.41151    
## sizesmall   10.40537    3.82205   2.722  0.00708 ** 
## mxPH        -3.98096    2.48142  -1.604  0.11030    
## Cl          -0.05241    0.03165  -1.656  0.09939 .  
## NO3         -0.89555    0.35142  -2.548  0.01161 *  
## PO4         -0.05912    0.01117  -5.292  3.3e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 17.5 on 191 degrees of freedom
## Multiple R-squared:  0.3529,	Adjusted R-squared:  0.3325 
## F-statistic: 17.36 on 6 and 191 DF,  p-value: 5.429e-16
{% endhighlight %}
 
Tỉ lệ phương sai giải thích bằng mô hình tuyến tính trên đây vẫn chưa đáng kể, chứng tỏ mô hình tuyến tính không phù hợp với phân tích sự phát triển của tảo.
 
### Cây hồi quy
 

{% highlight r %}
# Phân tích sử dụng thư viện rpart
library(rpart)
data(algae)
algae <- algae[-manyNAs(algae), ]
{% endhighlight %}



{% highlight text %}
## Warning in manyNAs(algae): Empty index generated, no rows with many NAs.
## Undesirable effects may be caused if indexing a data frame with this.
{% endhighlight %}



{% highlight r %}
rt.a1 <- rpart(a1 ~ ., data=algae[,1:12])
 
# Xem cây dạng chữ
rt.a1
{% endhighlight %}



{% highlight text %}
## n= 0 
## 
## node), split, n, deviance, yval
##       * denotes terminal node
## 
## 1) root 0 0 NaN *
{% endhighlight %}



{% highlight r %}
# # Xem cây dạng đồ thị
# prettyTree(rt.a1)
 
## Xem thông số của mô hình 
# sumarry(rt.a1)
{% endhighlight %}
 
Hàm `rpart()` phát triển cây hồi quy cho đến khi đạt được các tiêu chuẩn:
 
- Mức giảm độ lệch nhỏ hơn một mức tiêu chuẩn (`cp`)
- Số lượng mẫu trong một nút nhỏ hơn một mức tiêu chuẩn (`minsplit`)
- Độ sâu của cây vượt quá một mức tiêu chuẩn (`maxdepth`)
 
Mặc định giá trị của chúng lần lượt là 0.01, 20 và 30.
 

{% highlight r %}
# Xem tham số phức tạp của mô hình (cp)
printcp(rt.a1)
{% endhighlight %}



{% highlight text %}
## 
## Regression tree:
## rpart(formula = a1 ~ ., data = algae[, 1:12])
## 
## Variables actually used in tree construction:
## character(0)
## 
## Root node error: 0/0 = NaN
## 
## n= 0 
## 
##    CP nsplit rel error xerror xstd
## 1 NaN      0       NaN    NaN  NaN
{% endhighlight %}



{% highlight r %}
# # Đồ thị
# plotcp(rt.a1)
 
# Chọn mô hình có xerror + xstd nhỏ nhất
rt2.a1 <- prune(rt.a1,cp=0.08)
rt2.a1
{% endhighlight %}



{% highlight text %}
## n= 0 
## 
## node), split, n, deviance, yval
##       * denotes terminal node
## 
## 1) root 0 0 NaN *
{% endhighlight %}



{% highlight r %}
# Chọn tự động
set.seed(1234) # Just to ensure  same results as in the book
(rt.a1 <- rpartXse(a1 ~ .,data=algae[,1:12]))
{% endhighlight %}



{% highlight text %}
## n= 0 
## 
## node), split, n, deviance, yval
##       * denotes terminal node
## 
## 1) root 0 0 NaN *
{% endhighlight %}



{% highlight r %}
# Tạo một phiên bản cắt của cây hồi quy
# sử dụng hàm snip.part()
first.tree <- rpart(a1 ~ .,data=algae[,1:12])
snip.rpart(first.tree,c(4,7))
{% endhighlight %}



{% highlight text %}
## Warning in snip.rpart(first.tree, c(4, 7)): c("Nodes %s are not in this
## tree", "4", "7")
{% endhighlight %}



{% highlight text %}
## n= 0 
## 
## node), split, n, deviance, yval
##       * denotes terminal node
## 
## 1) root 0 0 NaN *
{% endhighlight %}



{% highlight r %}
# # Sử dụng hàm snip.part() trên đồ thị
# prettyTree(first.tree)
# snip.rpart(first.tree)
{% endhighlight %}
 
## 7. Đánh giá và lựa chọn mô hình
 
Hiệu suất dự báo của các mô hình hồi quy được thực hiện bằng cách so sánh các giá trị dự đoán của mô hình với các giá trị thực tế và tính toán một số trung bình về sai số từ so sánh này. Một trong các số trung bình đó là sai số trung bình tuyệt đối (MAE - the mean absolute error).
 

{% highlight r %}
# Dự báo bằng mô hình
lm.predictions.a1 <- predict(final.lm,clean.algae)
rt.predictions.a1 <- predict(rt.a1,algae)
 
# Tính toán sai số trung bình tuyệt đối
(mae.a1.lm <- mean(abs(lm.predictions.a1-algae[,'a1'])))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}



{% highlight r %}
(mae.a1.rt <- mean(abs(rt.predictions.a1-algae[,'a1'])))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}
 
Một số trung bình khác là sai số bình phương trung bình (MSE - the mean squared error).
 

{% highlight r %}
(mse.a1.lm <- mean((lm.predictions.a1-algae[,'a1'])^2))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}



{% highlight r %}
(mse.a1.rt <- mean((rt.predictions.a1-algae[,'a1'])^2))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}
 
Sai số bình phương trung bình chuẩn hóa (NMSE - the nỏmalized mean squared error)
 

{% highlight r %}
(nmse.a1.lm <- mean((lm.predictions.a1-algae[,'a1'])^2)/
                mean((mean(algae[,'a1'])-algae[,'a1'])^2))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}



{% highlight r %}
(nmse.a1.rt <- mean((rt.predictions.a1-algae[,'a1'])^2)/
                mean((mean(algae[,'a1'])-algae[,'a1'])^2))
{% endhighlight %}



{% highlight text %}
## [1] NaN
{% endhighlight %}
 
Tính 3 số trung bình cùng lúc
 

{% highlight r %}
regr.eval(algae[,'a1'],lm.predictions.a1,train.y=algae[,'a1'])
{% endhighlight %}



{% highlight text %}
##  mae  mse rmse mape nmse nmae 
##  NaN  NaN  NaN  NaN  NaN  NaN
{% endhighlight %}



{% highlight r %}
regr.eval(algae[,'a1'],rt.predictions.a1,train.y=algae[,'a1'])
{% endhighlight %}



{% highlight text %}
##  mae  mse rmse mape nmse nmae 
##  NaN  NaN  NaN  NaN  NaN  NaN
{% endhighlight %}
 
Biểu diễn sai số lên đồ thị
 

{% highlight r %}
old.par <- par(mfrow=c(1,2))
plot(lm.predictions.a1,algae[,'a1'],main="Linear Model",
     xlab="Predictions",ylab="True Values")
abline(0,1,lty=2)
plot(rt.predictions.a1,algae[,'a1'],main="Regression Tree",
     xlab="Predictions",ylab="True Values")
abline(0,1,lty=2)
par(old.par)
{% endhighlight %}
 
Đồ thị tương tác
 

{% highlight r %}
plot(lm.predictions.a1,algae[,'a1'],main="Linear Model",
     xlab="Predictions",ylab="True Values")
abline(0,1,lty=2)
algae[identify(lm.predictions.a1,algae[,'a1']),]
{% endhighlight %}
 
Loại bỏ các dự báo âm (-) trong mô hình tuyến tính
 

{% highlight r %}
sensible.lm.predictions.a1 <- ifelse(lm.predictions.a1 < 0,0,lm.predictions.a1)
regr.eval(algae[,'a1'],lm.predictions.a1,stats=c('mae','mse'))
{% endhighlight %}



{% highlight text %}
## mae mse 
## NaN NaN
{% endhighlight %}



{% highlight r %}
regr.eval(algae[,'a1'],sensible.lm.predictions.a1,stats=c('mae','mse'))
{% endhighlight %}



{% highlight text %}
## mae mse 
## NaN NaN
{% endhighlight %}
 
 
Nói chung, khi giải quyết các vấn đề dự báo, chúng ta cần phải đưa ra quyết định về:
 
- Lựa chọn mô hình thay thế cho vấn đề dự báo đang giải quyết
- Lựa chọn tiêu chí đánh giá sử dụng để đánh giá mô hình
- Lựa chọn phương pháp thực nghiệm để có được các ước tính hợp lý cho các tiêu chí này
 
Hàm `experimentalComparison()` cung cấp một giải pháp để thực hiện công đoạn này.
 

{% highlight r %}
cv.rpart <- function(form,train,test,...) {
  m <- rpartXse(form,train,...)
  p <- predict(m,test)
  mse <- mean((p-resp(form,test))^2)
  c(nmse=mse/mean((mean(resp(form,train))-resp(form,test))^2))
}
cv.lm <- function(form,train,test,...) {
  m <- lm(form,train,...)
  p <- predict(m,test)
  p <- ifelse(p < 0,0,p)
  mse <- mean((p-resp(form,test))^2)
  c(nmse=mse/mean((mean(resp(form,train))-resp(form,test))^2))
}
 
res <- experimentalComparison(
            c(dataset(a1 ~ .,clean.algae[,1:12],'a1')),
            c(variants('cv.lm'), 
              variants('cv.rpart',se=c(0,0.5,1))),
            cvSettings(3,10,1234))
 
 
summary(res)
 
 
plot(res)
 
 
getVariant('cv.rpart.v1',res)
{% endhighlight %}
 
Sử dụng `experimentalComparison()` cho 7 biến cùng lúc
 

{% highlight r %}
DSs <- sapply(names(clean.algae)[12:18],
         function(x,names.attrs) { 
           f <- as.formula(paste(x,"~ ."))
           dataset(f,clean.algae[,c(names.attrs,x)],x) 
         },
         names(clean.algae)[1:11])
 
res.all <- experimentalComparison(
                  DSs,
                  c(variants('cv.lm'),
                    variants('cv.rpart',se=c(0,0.5,1))
                   ),
                  cvSettings(5,10,1234))
 
 
plot(res.all)
 
 
bestScores(res.all)
{% endhighlight %}
 
Sử dụng `randomForest()` cho `experimentalComparison()`
 

{% highlight r %}
library(randomForest)
cv.rf <- function(form,train,test,...) {
  m <- randomForest(form,train,...)
  p <- predict(m,test)
  mse <- mean((p-resp(form,test))^2)
  c(nmse=mse/mean((mean(resp(form,train))-resp(form,test))^2))
}
res.all <- experimentalComparison(
                  DSs,
                  c(variants('cv.lm'),
                    variants('cv.rpart',se=c(0,0.5,1)),
                    variants('cv.rf',ntree=c(200,500,700))
                   ),
                  cvSettings(5,10,1234))
 
 
bestScores(res.all)
 
 
compAnalysis(res.all,against='cv.rf.v3',
               datasets=c('a1','a2','a4','a6'))
{% endhighlight %}
 
## 8. Dự báo cho 7 loại tảo
 
Trong phần này chúng tôi sẽ chỉ ra cách để dự báo sự phát triển của 7 loại tảo trong 140 mẫu thử. Phân Đánh giá và lựa chọn mô hình ở trên đã cho thấy cách thức chọn mô hình dự báo tốt nhất bằng cách sử dụng ước tính sai số trung bình bình phương chuẩn hóa (NMSE) cho một nhóm các mô hình trong cả 7 nhiệm vụ dự báo, trên cơ sở quá trình kiểm tra chéo (CV - cross-validation).
 
Mục tiêu chính của nghiên cứu này là thu được 7 dự báo cho 140 quan sát trong bộ dữ liệu kiểm thử. Mỗi một dự báo sẽ được tính ra từ mô hình mà quá trình kiểm tra chéo đã chỉ ra là tốt nhất. Đó là những mô hình thu được từ việc chạy hàm `bestScores()`.
 

{% highlight r %}
bestModelsNames <- sapply(bestScores(res.all),
                          function(x) x['nmse','system'])
learners <- c(rf='randomForest',rpart='rpartXse') 
funcs <- learners[sapply(strsplit(bestModelsNames,'\\.'),
                        function(x) x[2])]
parSetts <- lapply(bestModelsNames,
                   function(x) getVariant(x,res.all)@pars)
 
bestModels <- list()
for(a in 1:7) {
  form <- as.formula(paste(names(clean.algae)[11+a],'~ .'))
  bestModels[[a]] <- do.call(funcs[a],
          c(list(form,clean.algae[,c(1:11,11+a)]),parSetts[[a]]))
}
 
# Thay thế các giá trị chưa biết trong bộ dữ liệu kiểm thử
# bằng knn
clean.test.algae <- knnImputation(test.algae,k=10,distData=algae[,1:11])
 
 
preds <- matrix(ncol=7,nrow=140)
for(i in 1:nrow(clean.test.algae)) 
  preds[i,] <- sapply(1:7,
                      function(x) 
                        predict(bestModels[[x]],clean.test.algae[i,])
                     )
 
 
avg.preds <- apply(algae[,12:18],2,mean)
apply( ((algae.sols-preds)^2),           2,mean) / 
apply( (scale(algae.sols,avg.preds,F)^2),2,mean)
{% endhighlight %}
 
Những báo cáo khoa học của những nhóm thắng cuộc tại cuộc thi COIL năm 1999.
 
- [Bontempi, G., Birattari, M., and Bersini, H. (1999). Lazy learners at work: The lazy learning toolbox. In Proceedings of the 7th European Congress on Intelligent Tecnhiques & Soft Computing (EUFIT’99)](http://raw.githubusercontent.com/hochanh/rblog/gh-pages/_knitr/files/EUFIT-BonBirBer1999eufit.pdf).
 
- [Chan, R. (1999). Protecting rivers & streams by monitoring chemical concentrations and algae communities. In Proceedings of the 7th European Congress on Intelligent Tecnhiques & Soft Computing (EUFIT’99)](http://raw.githubusercontent.com/hochanh/rblog/gh-pages/_knitr/files/EUFIT-10.1.1.131.4618-libre.pdf).
 
- [Devogelaere, D., Rijckaert, M., and Embrechts, M. J. (1999). 3rd international competition: Protecting rivers and streams by monitoring chemical concentrations and algae communities solved with the use of gadc. In Proceedings of the 7th European Congress on Intelligent Tecnhiques & Soft Computing (EUFIT’99)](http://raw.githubusercontent.com/hochanh/rblog/gh-pages/_knitr/files/EUFIT-supervised.pdf).
 
- [Torgo, L. (1999b). Predicting the density of algae communities using local regression trees. In Proceedings of the 7th European Congress on Intelligent Tecnhiques & Soft Computing (EUFIT’99)](http://raw.githubusercontent.com/hochanh/rblog/gh-pages/_knitr/files/EUFIT-PDACLRT.pdf).
