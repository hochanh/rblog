---
layout: post
title: "ggplot2: Data"
converted: yes
---
 
## Gói `plyr`
 
### Làm việc với dữ liệu
 

{% highlight r %}
library(plyr)
library(ggplot2)
options(digits = 2, width = 60, max.print = 500)
 
# Select the smallest diamond in each colour
ddply(diamonds, .(color), subset, carat == min(carat))
{% endhighlight %}



{% highlight text %}
##    carat       cut color clarity depth table price   x   y
## 1   0.20     Ideal     D     VS2    62    57   367 3.8 3.8
## 2   0.20   Premium     D     VS2    62    60   367 3.7 3.7
## 3   0.20   Premium     D     VS2    62    60   367 3.8 3.7
## 4   0.20   Premium     E     SI2    60    62   345 3.8 3.8
## 5   0.20   Premium     E     VS2    60    62   367 3.8 3.8
## 6   0.20   Premium     E     VS2    59    60   367 3.8 3.8
## 7   0.20   Premium     E     VS2    61    59   367 3.8 3.8
## 8   0.20   Premium     E     VS2    60    62   367 3.8 3.8
## 9   0.20     Ideal     E     VS2    60    55   367 3.9 3.8
## 10  0.20 Very Good     E     VS2    63    59   367 3.7 3.7
## 11  0.20     Ideal     E     VS2    62    57   367 3.8 3.7
## 12  0.20   Premium     F     VS2    63    59   367 3.7 3.7
## 13  0.23 Very Good     G    VVS2    60    58   354 4.0 4.0
## 14  0.23     Ideal     G     VS1    62    54   404 3.9 4.0
## 15  0.23 Very Good     G    VVS1    61    59   414 3.9 4.0
## 16  0.23 Very Good     G    VVS1    60    59   415 4.0 4.0
## 17  0.23      Good     G    VVS2    64    56   428 3.9 3.9
## 18  0.23 Very Good     G    VVS2    63    55   431 3.9 3.9
## 19  0.23 Very Good     G    VVS2    63    54   431 3.9 4.0
## 20  0.23 Very Good     G    VVS2    62    57   431 3.9 3.9
## 21  0.23 Very Good     G    VVS2    63    55   431 3.9 4.0
## 22  0.23     Ideal     G     SI1    62    54   364 4.0 4.0
## 23  0.23     Ideal     G     SI1    62    53   364 3.9 4.0
## 24  0.23 Very Good     G    VVS2    58    59   438 4.1 4.0
## 25  0.23 Very Good     G     VS2    63    53   369 3.9 3.9
## 26  0.23      Fair     G    VVS2    61    66   369 3.9 3.9
## 27  0.23     Ideal     G     SI1    61    56   375 4.0 4.0
## 28  0.23 Very Good     G    VVS1    62    56   484 3.9 4.0
## 29  0.23 Very Good     G    VVS1    62    56   484 4.0 4.0
## 30  0.23     Ideal     G     VS1    62    55   384 4.0 4.0
## 31  0.23 Very Good     G     VS1    62    55   391 3.9 4.0
## 32  0.23      Good     G    VVS1    56    60   395 4.1 4.2
## 33  0.23   Premium     G    VVS1    61    59   531 4.0 3.9
## 34  0.23     Ideal     G    VVS1    62    58   536 3.9 4.0
## 35  0.23     Ideal     G    VVS1    62    57   536 3.9 4.0
## 36  0.23     Ideal     G    VVS1    61    57   536 4.0 4.0
## 37  0.23     Ideal     G      IF    62    56   536 3.9 3.9
## 38  0.23     Ideal     G      IF    63    55   536 3.9 4.0
## 39  0.23     Ideal     G      IF    62    55   536 3.9 4.0
## 40  0.23      Good     G    VVS2    64    56   537 3.9 3.9
## 41  0.23   Premium     G    VVS2    58    59   550 4.1 4.0
## 42  0.23 Very Good     H     VS1    59    61   338 4.0 4.0
## 43  0.23 Very Good     H     VS1    61    57   353 3.9 4.0
## 44  0.23     Ideal     H     VS1    61    55   423 3.9 4.0
## 45  0.23 Very Good     H    VVS2    62    55   431 3.9 3.9
## 46  0.23 Very Good     H    VVS2    63    56   431 3.9 4.0
## 47  0.23 Very Good     H    VVS1    62    56   434 3.9 4.0
## 48  0.23   Premium     H     VS1    59    61   434 4.0 4.0
## 49  0.23 Very Good     H      IF    64    55   369 3.9 3.9
## 50  0.23 Very Good     H    VVS2    62    55   378 3.9 4.0
##      z
## 1  2.3
## 2  2.3
## 3  2.3
## 4  2.3
## 5  2.3
## 6  2.2
## 7  2.3
## 8  2.3
## 9  2.3
## 10 2.4
## 11 2.3
## 12 2.3
## 13 2.4
## 14 2.4
## 15 2.4
## 16 2.4
## 17 2.5
## 18 2.5
## 19 2.5
## 20 2.4
## 21 2.5
## 22 2.5
## 23 2.5
## 24 2.4
## 25 2.5
## 26 2.4
## 27 2.4
## 28 2.4
## 29 2.5
## 30 2.5
## 31 2.5
## 32 2.3
## 33 2.4
## 34 2.4
## 35 2.4
## 36 2.4
## 37 2.4
## 38 2.5
## 39 2.4
## 40 2.5
## 41 2.4
## 42 2.4
## 43 2.4
## 44 2.4
## 45 2.5
## 46 2.5
## 47 2.4
## 48 2.4
## 49 2.5
## 50 2.4
##  [ reached getOption("max.print") -- omitted 7 rows ]
{% endhighlight %}



{% highlight r %}
# Select the two smallest diamonds
ddply(diamonds, .(color), subset, order(carat) <= 2)
{% endhighlight %}



{% highlight text %}
##    carat       cut color clarity depth table price   x   y
## 1   0.30     Ideal     D     SI1    62    56   552 4.3 4.3
## 2   0.24 Very Good     D    VVS1    62    60   553 4.0 4.0
## 3   0.23 Very Good     E     VS1    60    58   402 4.0 4.1
## 4   0.26 Very Good     E    VVS1    63    59   554 4.0 4.0
## 5   0.23 Very Good     F     VS1    61    57   357 4.0 4.0
## 6   0.23 Very Good     F     VS1    60    57   402 4.0 4.1
## 7   0.23 Very Good     G    VVS2    60    58   354 4.0 4.0
## 8   0.23     Ideal     G     VS1    62    54   404 3.9 4.0
## 9   0.26 Very Good     H     SI1    62    55   337 4.1 4.1
## 10  0.34     Ideal     H     VS2    60    57   555 4.5 4.6
## 11  0.30     Ideal     I     SI2    62    54   348 4.3 4.3
## 12  0.36     Ideal     I     VS2    62    56   556 4.5 4.6
## 13  0.24 Very Good     J    VVS2    63    57   336 3.9 4.0
## 14  1.01 Very Good     J     SI2    63    53  3088 6.3 6.3
##      z
## 1  2.7
## 2  2.5
## 3  2.4
## 4  2.5
## 5  2.4
## 6  2.4
## 7  2.4
## 8  2.4
## 9  2.5
## 10 2.8
## 11 2.7
## 12 2.8
## 13 2.5
## 14 4.0
{% endhighlight %}



{% highlight r %}
# Select the 1% largest diamonds in each group
ddply(diamonds, .(color), subset, carat > 
  quantile(carat, 0.99))
{% endhighlight %}



{% highlight text %}
##     carat       cut color clarity depth table price    x
## 1     1.8     Ideal     D     SI2    63    54  7862  7.8
## 2     1.9 Very Good     D     SI2    63    60  9791  7.8
## 3     1.8     Ideal     D     SI2    61    53 10051  7.9
## 4     2.0      Good     D     SI2    64    57 10528  7.9
## 5     1.8 Very Good     D     SI2    63    60 10730  7.7
## 6     1.8   Premium     D     SI1    61    60 12063  7.8
## 7     2.0   Premium     D     SI2    61    57 12108  8.1
## 8     1.8   Premium     D     SI1    61    58 12338  7.9
## 9     2.0   Premium     D     SI2    59    62 12576  8.1
## 10    2.0 Very Good     D     SI2    58    63 12639  8.3
## 11    2.1     Ideal     D     SI2    63    55 12707  8.2
## 12    2.0 Very Good     D     SI2    63    59 12765  8.1
## 13    2.0   Premium     D     SI2    60    58 12891  8.3
## 14    1.8 Very Good     D     SI2    62    57 12981  7.8
## 15    2.1      Fair     D     SI2    64    60 13016  8.0
## 16    1.8     Ideal     D     SI2    62    57 13026  7.8
## 17    2.0   Premium     D     SI2    62    59 13098  8.0
## 18    2.0      Good     D     SI2    63    59 13109  8.1
## 19    2.8     Ideal     D      I1    61    57 13156  9.0
## 20    2.0   Premium     D     SI2    62    58 13229  8.1
## 21    2.0   Premium     D     SI2    59    60 13811  8.3
## 22    2.0 Very Good     D     SI2    63    58 13858  8.0
## 23    1.8   Premium     D     SI2    60    58 13867  7.9
## 24    2.0   Premium     D     SI2    61    58 14406  8.1
## 25    1.8 Very Good     D     SI1    59    61 14561  7.9
## 26    2.6 Very Good     D     SI2    59    63 14749  9.1
## 27    2.1   Premium     D     SI2    59    60 15198  8.4
## 28    2.0 Very Good     D     SI2    61    57 15334  8.2
## 29    2.0      Good     D     SI2    65    55 15394  7.8
## 30    2.0      Fair     D     SI1    65    58 15540  8.0
## 31    1.9 Very Good     D     SI2    63    58 15594  7.8
## 32    2.0      Fair     D     SI2    59    66 15627  8.2
## 33    3.4      Fair     D      I1    67    52 15964  9.4
## 34    2.0      Fair     D     SI2    67    57 16086  7.9
## 35    2.0      Fair     D     SI1    65    55 16386  7.9
## 36    2.1     Ideal     D     SI2    63    56 16404  8.2
## 37    2.0      Good     D     SI2    60    56 16425  8.1
## 38    2.2   Premium     D     SI2    62    59 16472  8.3
## 39    2.0   Premium     D     SI2    61    60 16484  8.2
## 40    2.2     Ideal     D     SI2    62    57 16558  8.4
## 41    2.0      Good     D     SI2    60    65 16624  8.0
## 42    2.0      Good     D     SI2    60    65 16776  8.1
## 43    2.0   Premium     D     SI2    63    58 16776  8.1
## 44    2.0   Premium     D     SI2    62    60 16872  8.1
## 45    2.0 Very Good     D     SI2    62    59 17079  8.1
## 46    2.0      Good     D     SI2    64    57 17094  7.9
## 47    2.1   Premium     D     SI2    60    59 17127  8.4
## 48    2.0   Premium     D     SI2    62    59 17235  8.2
## 49    2.0 Very Good     D     SI2    62    56 17263  8.0
## 50    2.0   Premium     D     SI2    62    59 17674  8.1
##        y   z
## 1    7.7 4.9
## 2    7.8 4.9
## 3    7.8 4.8
## 4    7.9 5.0
## 5    7.6 4.8
## 6    7.7 4.8
## 7    8.1 4.9
## 8    7.7 4.8
## 9    8.1 4.8
## 10   8.2 4.8
## 11   8.1 5.1
## 12   8.0 5.1
## 13   8.2 5.0
## 14   7.8 4.9
## 15   7.9 5.1
## 16   7.7 4.8
## 17   8.0 5.0
## 18   8.0 5.1
## 19   9.0 5.5
## 20   8.1 5.0
## 21   8.2 4.9
## 22   8.0 5.0
## 23   7.9 4.7
## 24   8.0 4.9
## 25   8.0 4.7
## 26   9.0 5.3
## 27   8.4 5.0
## 28   8.2 5.0
## 29   8.0 5.1
## 30   7.9 5.1
## 31   7.8 4.9
## 32   8.2 4.9
## 33   9.3 6.3
## 34   7.8 5.2
## 35   7.8 5.1
## 36   8.2 5.1
## 37   8.1 4.9
## 38   8.3 5.2
## 39   8.1 4.9
## 40   8.3 5.2
## 41   8.1 4.8
## 42   8.0 4.8
## 43   8.0 5.0
## 44   8.1 5.0
## 45   8.2 5.0
## 46   7.8 5.0
## 47   8.4 5.0
## 48   8.1 5.0
## 49   8.1 5.0
## 50   8.2 5.0
##  [ reached getOption("max.print") -- omitted 450 rows ]
{% endhighlight %}



{% highlight r %}
# Select all diamonds bigger than the group average
ddply(diamonds, .(color), subset, price > mean(price))
{% endhighlight %}



{% highlight text %}
##       carat       cut color clarity depth table price    x
## 1      0.80     Ideal     D     SI2    62    58  3173  6.0
## 2      0.72     Ideal     D     SI2    60    57  3176  5.8
## 3      0.74     Ideal     D     VS2    61    54  3177  5.9
## 4      0.72     Ideal     D     VS2    61    56  3179  5.8
## 5      0.72     Ideal     D     VS2    62    57  3179  5.7
## 6      0.72     Ideal     D     VS2    63    57  3179  5.7
## 7      0.81      Good     D     SI1    64    58  3179  5.9
## 8      0.73 Very Good     D     VS2    64    58  3182  5.7
## 9      0.73     Ideal     D     VS2    62    56  3182  5.8
## 10     0.70   Premium     D     VS1    61    60  3183  5.8
## 11     0.79     Ideal     D     SI1    61    56  3185  6.0
## 12     0.73     Ideal     D     SI1    62    56  3189  5.8
## 13     0.73     Ideal     D     SI1    62    56  3189  5.8
## 14     0.71     Ideal     D     VS1    62    55  3192  5.7
## 15     0.70      Good     D     VS1    60    63  3193  5.7
## 16     0.54   Premium     D    VVS1    61    58  3194  5.2
## 17     0.73     Ideal     D     SI1    62    53  3195  5.8
## 18     0.80     Ideal     D     SI1    62    56  3195  6.0
## 19     0.70     Ideal     D     SI1    62    57  3199  5.8
## 20     0.71 Very Good     D     VS2    60    55  3203  5.8
## 21     0.90   Premium     D     SI2    63    59  3205  6.2
## 22     0.90      Fair     D     SI2    66    59  3205  6.0
## 23     0.90      Fair     D     SI2    66    58  3205  6.0
## 24     0.90      Fair     D     SI2    65    54  3205  6.1
## 25     0.90      Fair     D     SI2    66    60  3205  6.0
## 26     0.90      Fair     D     SI2    65    59  3205  6.1
## 27     0.90   Premium     D     SI2    59    61  3205  6.3
## 28     0.72   Premium     D     VS2    61    57  3205  5.8
## 29     0.58     Ideal     D    VVS1    61    57  3206  5.4
## 30     0.83     Ideal     D     SI2    62    56  3207  6.0
## 31     0.70 Very Good     D     VS1    60    60  3208  5.7
## 32     0.79     Ideal     D     SI1    61    57  3209  5.9
## 33     0.80     Ideal     D     SI2    62    54  3210  6.0
## 34     0.70   Premium     D    VVS2    62    60  3210  5.7
## 35     0.71     Ideal     D     VS2    63    57  3212  5.7
## 36     0.78     Ideal     D     SI1    61    57  3214  6.0
## 37     0.70   Premium     D     VS1    63    59  3214  5.7
## 38     0.95      Good     D     SI2    56    61  3214  6.5
## 39     0.71   Premium     D     VS2    59    59  3217  5.8
## 40     0.71     Ideal     D     VS2    62    55  3217  5.7
## 41     0.71 Very Good     D     VS2    62    59  3217  5.7
## 42     0.52     Ideal     D    VVS1    62    57  3218  5.2
## 43     0.72     Ideal     D     VS2    63    56  3219  5.7
## 44     0.72     Ideal     D     VS2    63    56  3219  5.7
## 45     0.71 Very Good     D     VS2    63    58  3222  5.7
## 46     0.71     Ideal     D     VS2    61    57  3222  5.7
## 47     0.51     Ideal     D    VVS2    61    56  3223  5.1
## 48     0.80   Premium     D     SI1    59    55  3226  6.1
## 49     0.65     Ideal     D    VVS2    61    60  3228  5.5
## 50     0.70   Premium     D     VS1    62    60  3229  5.6
##          y   z
## 1      6.0 3.7
## 2      5.9 3.5
## 3      5.9 3.6
## 4      5.8 3.5
## 5      5.8 3.5
## 6      5.7 3.6
## 7      5.8 3.8
## 8      5.7 3.6
## 9      5.8 3.6
## 10     5.7 3.5
## 11     6.0 3.7
## 12     5.8 3.6
## 13     5.8 3.6
## 14     5.7 3.6
## 15     5.7 3.5
## 16     5.3 3.2
## 17     5.8 3.6
## 18     6.0 3.7
## 19     5.7 3.5
## 20     5.9 3.5
## 21     6.1 3.9
## 22     6.0 3.9
## 23     6.0 4.0
## 24     6.0 3.9
## 25     5.9 3.9
## 26     6.0 3.9
## 27     6.3 3.7
## 28     5.8 3.5
## 29     5.4 3.3
## 30     6.0 3.7
## 31     5.8 3.5
## 32     6.0 3.6
## 33     6.0 3.7
## 34     5.6 3.5
## 35     5.8 3.6
## 36     6.0 3.6
## 37     5.7 3.6
## 38     6.5 3.7
## 39     5.9 3.5
## 40     5.7 3.6
## 41     5.7 3.6
## 42     5.2 3.2
## 43     5.8 3.6
## 44     5.7 3.6
## 45     5.7 3.6
## 46     5.8 3.5
## 47     5.2 3.2
## 48     6.0 3.6
## 49     5.6 3.4
## 50     5.6 3.5
##  [ reached getOption("max.print") -- omitted 19353 rows ]
{% endhighlight %}



{% highlight r %}
# Within each colour, scale price to mean 0 and variance 1
ddply(diamonds, .(color), transform, price = scale(price))
{% endhighlight %}



{% highlight text %}
##       carat       cut color clarity depth table    price
## 1      0.23 Very Good     D     VS2    60    61 -8.4e-01
## 2      0.23 Very Good     D     VS1    62    58 -8.2e-01
## 3      0.26 Very Good     D     VS2    61    59 -8.2e-01
## 4      0.26      Good     D     VS2    65    56 -8.2e-01
## 5      0.26      Good     D     VS1    58    63 -8.2e-01
## 6      0.22   Premium     D     VS2    59    62 -8.2e-01
## 7      0.30   Premium     D     SI1    63    59 -7.8e-01
## 8      0.30     Ideal     D     SI1    62    57 -7.8e-01
## 9      0.30     Ideal     D     SI1    62    56 -7.8e-01
## 10     0.24 Very Good     D    VVS1    62    60 -7.8e-01
## 11     0.26 Very Good     D    VVS2    62    54 -7.8e-01
## 12     0.26 Very Good     D    VVS2    63    60 -7.8e-01
## 13     0.26 Very Good     D    VVS1    62    60 -7.8e-01
## 14     0.75 Very Good     D     SI1    63    56 -1.2e-01
## 15     0.71     Ideal     D     SI2    62    56 -1.2e-01
## 16     0.61 Very Good     D    VVS2    60    57 -1.2e-01
## 17     0.71 Very Good     D     SI1    64    58 -1.2e-01
## 18     0.71     Ideal     D     SI1    62    59 -1.2e-01
## 19     0.70 Very Good     D     VS2    62    55 -1.2e-01
## 20     0.71     Ideal     D     SI2    62    55 -1.2e-01
## 21     0.73 Very Good     D     SI1    60    56 -1.2e-01
## 22     0.70 Very Good     D     SI1    61    58 -1.2e-01
## 23     0.71   Premium     D     SI2    62    59 -1.2e-01
## 24     0.71   Premium     D     VS2    62    60 -1.2e-01
## 25     0.76     Ideal     D     SI2    62    57 -1.2e-01
## 26     0.73     Ideal     D     SI2    60    57 -1.2e-01
## 27     0.75     Ideal     D     SI2    61    56 -1.2e-01
## 28     0.70   Premium     D     VS2    58    62 -1.2e-01
## 29     0.70 Very Good     D     VS1    63    58 -1.2e-01
## 30     0.53 Very Good     D    VVS2    58    64 -1.2e-01
## 31     0.75 Very Good     D     SI2    63    58 -1.2e-01
## 32     0.72     Ideal     D     SI1    61    57 -1.2e-01
## 33     0.72   Premium     D     SI1    63    59 -1.2e-01
## 34     0.70   Premium     D     SI1    63    60 -1.2e-01
## 35     0.64     Ideal     D     VS1    62    56 -1.1e-01
## 36     0.71      Good     D     VS2    63    56 -1.1e-01
## 37     0.72   Premium     D     SI2    62    60 -1.1e-01
## 38     0.71   Premium     D     SI1    63    60 -1.1e-01
## 39     0.71   Premium     D     SI1    61    58 -1.1e-01
## 40     0.71   Premium     D     SI1    62    60 -1.1e-01
## 41     0.51     Ideal     D    VVS1    62    56 -1.1e-01
## 42     0.78     Ideal     D     SI1    62    57 -1.1e-01
## 43     0.91     Ideal     D     SI2    62    57 -1.1e-01
## 44     0.70 Very Good     D     SI1    62    58 -1.1e-01
## 45     0.70     Ideal     D     SI1    61    59 -1.1e-01
## 46     0.72     Ideal     D     SI1    62    56 -1.1e-01
## 47     0.72     Ideal     D     SI1    62    54 -1.1e-01
## 48     0.73 Very Good     D     SI1    63    57 -1.1e-01
## 49     0.81   Premium     D     SI2    59    57 -1.1e-01
## 50     0.74     Ideal     D     SI2    62    55 -1.1e-01
##          x    y    z
## 1      4.0  4.0  2.4
## 2      3.9  4.0  2.4
## 3      4.1  4.2  2.5
## 4      4.0  4.0  2.6
## 5      4.2  4.2  2.5
## 6      3.9  3.9  2.3
## 7      4.2  4.3  2.7
## 8      4.3  4.3  2.7
## 9      4.3  4.3  2.7
## 10     4.0  4.0  2.5
## 11     4.1  4.1  2.6
## 12     4.0  4.0  2.5
## 13     4.0  4.1  2.5
## 14     5.8  5.8  3.6
## 15     5.7  5.7  3.6
## 16     5.6  5.6  3.3
## 17     5.6  5.7  3.6
## 18     5.7  5.7  3.5
## 19     5.7  5.7  3.5
## 20     5.7  5.8  3.5
## 21     5.8  5.9  3.5
## 22     5.7  5.7  3.5
## 23     5.7  5.7  3.5
## 24     5.7  5.6  3.5
## 25     5.8  5.8  3.6
## 26     5.9  5.9  3.5
## 27     5.8  5.9  3.6
## 28     5.9  5.8  3.4
## 29     5.7  5.7  3.6
## 30     5.3  5.4  3.1
## 31     5.8  5.7  3.6
## 32     5.8  5.8  3.5
## 33     5.7  5.7  3.6
## 34     5.7  5.7  3.6
## 35     5.5  5.5  3.4
## 36     5.6  5.7  3.6
## 37     5.7  5.7  3.5
## 38     5.7  5.7  3.6
## 39     5.7  5.8  3.5
## 40     5.7  5.7  3.5
## 41     5.1  5.2  3.2
## 42     5.9  5.9  3.6
## 43     6.2  6.2  3.9
## 44     5.7  5.7  3.6
## 45     5.7  5.7  3.5
## 46     5.7  5.8  3.6
## 47     5.8  5.8  3.6
## 48     5.7  5.7  3.6
## 49     6.2  6.0  3.6
## 50     5.8  5.8  3.6
##  [ reached getOption("max.print") -- omitted 53890 rows ]
{% endhighlight %}



{% highlight r %}
# Subtract off group mean
ddply(diamonds, .(color), transform, 
  price = price - mean(price))
{% endhighlight %}



{% highlight text %}
##       carat       cut color clarity depth table    price
## 1      0.23 Very Good     D     VS2    60    61 -2812.95
## 2      0.23 Very Good     D     VS1    62    58 -2767.95
## 3      0.26 Very Good     D     VS2    61    59 -2766.95
## 4      0.26      Good     D     VS2    65    56 -2766.95
## 5      0.26      Good     D     VS1    58    63 -2766.95
## 6      0.22   Premium     D     VS2    59    62 -2765.95
## 7      0.30   Premium     D     SI1    63    59 -2617.95
## 8      0.30     Ideal     D     SI1    62    57 -2617.95
## 9      0.30     Ideal     D     SI1    62    56 -2617.95
## 10     0.24 Very Good     D    VVS1    62    60 -2616.95
## 11     0.26 Very Good     D    VVS2    62    54 -2615.95
## 12     0.26 Very Good     D    VVS2    63    60 -2615.95
## 13     0.26 Very Good     D    VVS1    62    60 -2615.95
## 14     0.75 Very Good     D     SI1    63    56  -409.95
## 15     0.71     Ideal     D     SI2    62    56  -407.95
## 16     0.61 Very Good     D    VVS2    60    57  -406.95
## 17     0.71 Very Good     D     SI1    64    58  -405.95
## 18     0.71     Ideal     D     SI1    62    59  -405.95
## 19     0.70 Very Good     D     VS2    62    55  -402.95
## 20     0.71     Ideal     D     SI2    62    55  -402.95
## 21     0.73 Very Good     D     SI1    60    56  -401.95
## 22     0.70 Very Good     D     SI1    61    58  -401.95
## 23     0.71   Premium     D     SI2    62    59  -401.95
## 24     0.71   Premium     D     VS2    62    60  -399.95
## 25     0.76     Ideal     D     SI2    62    57  -399.95
## 26     0.73     Ideal     D     SI2    60    57  -399.95
## 27     0.75     Ideal     D     SI2    61    56  -396.95
## 28     0.70   Premium     D     VS2    58    62  -396.95
## 29     0.70 Very Good     D     VS1    63    58  -392.95
## 30     0.53 Very Good     D    VVS2    58    64  -387.95
## 31     0.75 Very Good     D     SI2    63    58  -387.95
## 32     0.72     Ideal     D     SI1    61    57  -387.95
## 33     0.72   Premium     D     SI1    63    59  -387.95
## 34     0.70   Premium     D     SI1    63    60  -387.95
## 35     0.64     Ideal     D     VS1    62    56  -382.95
## 36     0.71      Good     D     VS2    63    56  -381.95
## 37     0.72   Premium     D     SI2    62    60  -374.95
## 38     0.71   Premium     D     SI1    63    60  -372.95
## 39     0.71   Premium     D     SI1    61    58  -372.95
## 40     0.71   Premium     D     SI1    62    60  -372.95
## 41     0.51     Ideal     D    VVS1    62    56  -372.95
## 42     0.78     Ideal     D     SI1    62    57  -370.95
## 43     0.91     Ideal     D     SI2    62    57  -366.95
## 44     0.70 Very Good     D     SI1    62    58  -365.95
## 45     0.70     Ideal     D     SI1    61    59  -365.95
## 46     0.72     Ideal     D     SI1    62    56  -365.95
## 47     0.72     Ideal     D     SI1    62    54  -365.95
## 48     0.73 Very Good     D     SI1    63    57  -361.95
## 49     0.81   Premium     D     SI2    59    57  -360.95
## 50     0.74     Ideal     D     SI2    62    55  -359.95
##          x    y    z
## 1      4.0  4.0  2.4
## 2      3.9  4.0  2.4
## 3      4.1  4.2  2.5
## 4      4.0  4.0  2.6
## 5      4.2  4.2  2.5
## 6      3.9  3.9  2.3
## 7      4.2  4.3  2.7
## 8      4.3  4.3  2.7
## 9      4.3  4.3  2.7
## 10     4.0  4.0  2.5
## 11     4.1  4.1  2.6
## 12     4.0  4.0  2.5
## 13     4.0  4.1  2.5
## 14     5.8  5.8  3.6
## 15     5.7  5.7  3.6
## 16     5.6  5.6  3.3
## 17     5.6  5.7  3.6
## 18     5.7  5.7  3.5
## 19     5.7  5.7  3.5
## 20     5.7  5.8  3.5
## 21     5.8  5.9  3.5
## 22     5.7  5.7  3.5
## 23     5.7  5.7  3.5
## 24     5.7  5.6  3.5
## 25     5.8  5.8  3.6
## 26     5.9  5.9  3.5
## 27     5.8  5.9  3.6
## 28     5.9  5.8  3.4
## 29     5.7  5.7  3.6
## 30     5.3  5.4  3.1
## 31     5.8  5.7  3.6
## 32     5.8  5.8  3.5
## 33     5.7  5.7  3.6
## 34     5.7  5.7  3.6
## 35     5.5  5.5  3.4
## 36     5.6  5.7  3.6
## 37     5.7  5.7  3.5
## 38     5.7  5.7  3.6
## 39     5.7  5.8  3.5
## 40     5.7  5.7  3.5
## 41     5.1  5.2  3.2
## 42     5.9  5.9  3.6
## 43     6.2  6.2  3.9
## 44     5.7  5.7  3.6
## 45     5.7  5.7  3.5
## 46     5.7  5.8  3.6
## 47     5.8  5.8  3.6
## 48     5.7  5.7  3.6
## 49     6.2  6.0  3.6
## 50     5.8  5.8  3.6
##  [ reached getOption("max.print") -- omitted 53890 rows ]
{% endhighlight %}



{% highlight r %}
nmissing <- function(x) sum(is.na(x))
nmissing(msleep$name)
{% endhighlight %}



{% highlight text %}
## [1] 0
{% endhighlight %}



{% highlight r %}
nmissing(msleep$brainwt)
{% endhighlight %}



{% highlight text %}
## [1] 27
{% endhighlight %}



{% highlight r %}
nmissing_df <- colwise(nmissing)
nmissing_df(msleep)
{% endhighlight %}



{% highlight text %}
##   name genus vore order conservation sleep_total sleep_rem
## 1    0     0    7     0           29           0        22
##   sleep_cycle awake brainwt bodywt
## 1          51     0      27      0
{% endhighlight %}



{% highlight r %}
# This is shorthand for the previous two steps
colwise(nmissing)(msleep)
{% endhighlight %}



{% highlight text %}
##   name genus vore order conservation sleep_total sleep_rem
## 1    0     0    7     0           29           0        22
##   sleep_cycle awake brainwt bodywt
## 1          51     0      27      0
{% endhighlight %}



{% highlight r %}
msleep2 <- msleep[, -6] # Remove a column to save space
numcolwise(median)(msleep2, na.rm = T)
{% endhighlight %}



{% highlight text %}
##   sleep_rem sleep_cycle awake brainwt bodywt
## 1       1.5        0.33    14   0.012    1.7
{% endhighlight %}



{% highlight r %}
numcolwise(quantile)(msleep2, na.rm = T)
{% endhighlight %}



{% highlight text %}
##   sleep_rem sleep_cycle awake brainwt  bodywt
## 1       0.1        0.12   4.1 0.00014 5.0e-03
## 2       0.9        0.18  10.2 0.00290 1.7e-01
## 3       1.5        0.33  13.9 0.01240 1.7e+00
## 4       2.4        0.58  16.1 0.12550 4.2e+01
## 5       6.6        1.50  22.1 5.71200 6.7e+03
{% endhighlight %}



{% highlight r %}
numcolwise(quantile)(msleep2, probs = c(0.25, 0.75), 
  na.rm = T)
{% endhighlight %}



{% highlight text %}
##   sleep_rem sleep_cycle awake brainwt bodywt
## 1       0.9        0.18    10  0.0029   0.17
## 2       2.4        0.58    16  0.1255  41.75
{% endhighlight %}



{% highlight r %}
ddply(msleep2, .(vore), numcolwise(median), na.rm = T)
{% endhighlight %}



{% highlight text %}
##      vore sleep_rem sleep_cycle awake brainwt bodywt
## 1   carni      1.95        0.38  13.6  0.0445 20.490
## 2   herbi      0.95        0.22  13.7  0.0123  1.225
## 3 insecti      3.00        0.17   5.9  0.0012  0.075
## 4    omni      1.85        0.50  14.1  0.0066  0.950
## 5    <NA>      2.00        0.18  13.4  0.0030  0.122
{% endhighlight %}



{% highlight r %}
ddply(msleep2, .(vore), numcolwise(mean), na.rm = T)
{% endhighlight %}



{% highlight text %}
##      vore sleep_rem sleep_cycle awake brainwt bodywt
## 1   carni       2.3        0.37  13.6  0.0793  90.75
## 2   herbi       1.4        0.42  14.5  0.6216 366.88
## 3 insecti       3.5        0.16   9.1  0.0215  12.92
## 4    omni       2.0        0.59  13.1  0.1457  12.72
## 5    <NA>       1.9        0.18  13.8  0.0076   0.86
{% endhighlight %}



{% highlight r %}
my_summary <- function(df) {
  with(df, data.frame(
    pc_cor = cor(price, carat, method = "spearman"),
    lpc_cor = cor(log(price), log(carat))
  ))
}
ddply(diamonds, .(cut), my_summary)
{% endhighlight %}



{% highlight text %}
##         cut pc_cor lpc_cor
## 1      Fair   0.91    0.91
## 2      Good   0.96    0.97
## 3 Very Good   0.97    0.97
## 4   Premium   0.96    0.97
## 5     Ideal   0.95    0.97
{% endhighlight %}



{% highlight r %}
ddply(diamonds, .(color), my_summary)
{% endhighlight %}



{% highlight text %}
##   color pc_cor lpc_cor
## 1     D   0.96    0.96
## 2     E   0.96    0.96
## 3     F   0.96    0.96
## 4     G   0.96    0.97
## 5     H   0.97    0.98
## 6     I   0.98    0.99
## 7     J   0.98    0.99
{% endhighlight %}
 
### Vẽ biểu đồ
 

{% highlight r %}
library(ggplot2)
 
# Vẽ đường smooth tự động bằng ggplot2
qplot(carat, price, data = diamonds, geom = "smooth", 
  color = color)
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk gplot](../../figures/ggplot2-data/gplot-1.png) 

{% highlight r %}
dense <- subset(diamonds, carat < 2)
qplot(carat, price, data = dense, geom = "smooth", 
  colour = color,  fullrange = TRUE)
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk gplot](../../figures/ggplot2-data/gplot-2.png) 

{% highlight r %}
# Vẽ đường smooth bằng tay
library(mgcv)
smooth <- function(df) {
  mod <- gam(price ~ s(carat, bs = "cs"), data = df)
  grid <- data.frame(carat = seq(0.2, 2, length = 50))
  pred <- predict(mod, grid, se = T)
  
  grid$price <- as.vector(pred$fit)
  grid$se <- as.vector(pred$se.fit)
  grid
}
smoothes <- ddply(dense, .(color), smooth)
qplot(carat, price, data = smoothes, colour = color, 
  geom = "line")
{% endhighlight %}

![plot of chunk gplot](../../figures/ggplot2-data/gplot-3.png) 

{% highlight r %}
qplot(carat, price, data = smoothes, colour = color, 
  geom = "smooth", ymax = price + 2 * se, ymin = price - 2 * se)
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk gplot](../../figures/ggplot2-data/gplot-4.png) 

{% highlight r %}
mod <- gam(price ~ s(carat, bs = "cs") + color, data = dense)
grid <- with(diamonds, expand.grid(
  carat = seq(0.2, 2, length = 50),
  color = levels(color)
))
grid$pred <- predict(mod, grid)
qplot(carat, pred, data = grid, colour = color, geom = "line")
{% endhighlight %}

![plot of chunk gplot](../../figures/ggplot2-data/gplot-5.png) 
 
## Gói `reshape`
 
### Định dạng rộng
 

{% highlight r %}
qplot(date, uempmed, data = economics, geom = "line")
{% endhighlight %}

![plot of chunk wide](../../figures/ggplot2-data/wide-1.png) 

{% highlight r %}
qplot(date, unemploy, data = economics, geom = "line")
{% endhighlight %}

![plot of chunk wide](../../figures/ggplot2-data/wide-2.png) 

{% highlight r %}
qplot(unemploy, uempmed, data = economics) + geom_smooth()
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk wide](../../figures/ggplot2-data/wide-3.png) 
 
### Biểu diễn 2 số liệu khác độ đo
 

{% highlight r %}
ggplot(economics, aes(date)) + 
  geom_line(aes(y = unemploy, colour = "unemploy")) + 
  geom_line(aes(y = uempmed, colour = "uempmed")) + 
  scale_colour_hue("variable")
{% endhighlight %}

![plot of chunk long & wide](../../figures/ggplot2-data/long & wide-1.png) 

{% highlight r %}
library(reshape2)
emp <- melt(economics, id = "date", 
  measure = c("unemploy", "uempmed"))
qplot(date, value, data = emp, geom = "line", colour = variable)
{% endhighlight %}

![plot of chunk long & wide](../../figures/ggplot2-data/long & wide-2.png) 
 
Có 2 lựa chọn để xử lý những số liệu không cùng độ đo:
 

{% highlight r %}
# Rescaling
range01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / diff(rng)
}
emp2 <- ddply(emp, .(variable), transform, value = range01(value))
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "range01"
{% endhighlight %}



{% highlight r %}
qplot(date, value, data = emp2, geom = "line", 
  colour = variable, linetype = variable)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(data, aesthetics, environment = env): object 'emp2' not found
{% endhighlight %}



{% highlight r %}
# Faceting
qplot(date, value, data = emp, geom = "line") + 
  facet_grid(variable ~ ., scales = "free_y")
{% endhighlight %}

![plot of chunk rescale & facet](../../figures/ggplot2-data/rescale & facet-1.png) 
 
### Tọa độ song song
 

{% highlight r %}
popular <- subset(movies, votes > 1e4)
ratings <- popular[, 7:16]
ratings$.row <- rownames(ratings)
molten <- melt(ratings, id = ".row")
{% endhighlight %}
 

{% highlight r %}
# mặc định
pcp <- ggplot(molten, aes(variable, value, group = .row))
pcp + geom_line()
{% endhighlight %}

![plot of chunk plot](../../figures/ggplot2-data/plot-1.png) 

{% highlight r %}
# thêm `alpha`
pcp + geom_line(colour = alpha("black", 1 / 20))
{% endhighlight %}

![plot of chunk plot](../../figures/ggplot2-data/plot-2.png) 

{% highlight r %}
# thêm `jitter`
jit <- position_jitter(width = 0.25, height = 2.5)
pcp + geom_line(position = jit)
{% endhighlight %}

![plot of chunk plot](../../figures/ggplot2-data/plot-3.png) 

{% highlight r %}
# thêm alpha cho jitter
pcp + geom_line(colour = alpha("black", 1 / 20), position = jit)
{% endhighlight %}

![plot of chunk plot](../../figures/ggplot2-data/plot-4.png) 
 

{% highlight r %}
cl <- kmeans(ratings[1:10], 6)
ratings$cluster <- reorder(factor(cl$cluster), popular$rating)
levels(ratings$cluster) <- seq_along(levels(ratings$cluster))
molten <- melt(ratings, id = c(".row", "cluster"))
{% endhighlight %}
 

{% highlight r %}
pcp_cl <- ggplot(molten, 
  aes(variable, value, group = .row, colour = cluster)) 
pcp_cl + geom_line(position = jit, alpha = 1/5)
{% endhighlight %}

![plot of chunk plot2](../../figures/ggplot2-data/plot2-1.png) 

{% highlight r %}
pcp_cl + stat_summary(aes(group = cluster), fun.y = mean, 
  geom = "line")
{% endhighlight %}

![plot of chunk plot2](../../figures/ggplot2-data/plot2-2.png) 
 

{% highlight r %}
library(scales)
pcp_cl + geom_line(position = jit, colour = alpha("black", 1/5)) +
  facet_wrap(~ cluster)
{% endhighlight %}

![plot of chunk faceting](../../figures/ggplot2-data/faceting-1.png) 
 
## Phương pháp `ggplot()`
 
### Mô hình đơn giản
 

{% highlight r %}
qplot(displ, cty, data = mpg) + geom_smooth(method = "lm")
{% endhighlight %}



{% highlight text %}
## Error: ggplot2 doesn't know how to deal with data of class numeric
{% endhighlight %}



{% highlight r %}
mpgmod <- lm(cty ~ displ, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error in eval(predvars, data, env): numeric 'envir' arg not of length one
{% endhighlight %}



{% highlight r %}
head(fortify(mpgmod))
{% endhighlight %}



{% highlight text %}
## Error in head(fortify(mpgmod)): error in evaluating the argument 'x' in selecting a method for function 'head': Error in fortify(mpgmod) : object 'mpgmod' not found
{% endhighlight %}
 
### Điều chỉnh mô hình
 

{% highlight r %}
mod <- lm(cty ~ displ, data = mpg)
{% endhighlight %}



{% highlight text %}
## Error in eval(predvars, data, env): numeric 'envir' arg not of length one
{% endhighlight %}



{% highlight r %}
basic <- ggplot(mod, aes(.fitted, .resid)) +
  geom_hline(yintercept = 0, colour = "grey50", size = 0.5) + 
  geom_point() + 
  geom_smooth(size = 0.5, se = F)
{% endhighlight %}



{% highlight text %}
## Error in infl$hat: $ operator is invalid for atomic vectors
{% endhighlight %}



{% highlight r %}
basic
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'basic' not found
{% endhighlight %}



{% highlight r %}
# sử dụng residual chuẩn hóa thay vì residual
basic + aes(y = .stdresid)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'basic' not found
{% endhighlight %}



{% highlight r %}
# Thêm khoảng cách Cook
basic + aes(size = .cooksd) + scale_size_area("Cook's distance")
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'basic' not found
{% endhighlight %}
 
 
### Thêm biến vào mô hình
 

{% highlight r %}
full <- basic %+% fortify(mod, mpg)
{% endhighlight %}



{% highlight text %}
## Error in inherits(x, "theme"): object 'basic' not found
{% endhighlight %}



{% highlight r %}
full + aes(colour = factor(cyl))
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'full' not found
{% endhighlight %}



{% highlight r %}
full + aes(displ, colour = factor(cyl))
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'full' not found
{% endhighlight %}
