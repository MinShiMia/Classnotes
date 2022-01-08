---
layout: post
title: Twitter Information Analysis and Visualization II -- Class Exercise 2
---

I use API method and non-API method to get the data from Twitter. Then I used Rstudio to analyze the data and gotten my results which I will share with you below.

I. API Method

1. Data and method to collect the data: I used API key and token from Twitter developer website, and gotten the least information about "realDonaldTrump and China".

The plot for time series of tweets frequency is as follows:
![images](https://MinShiMia.github.io/images/Donald%20Trump%20Twitter%20Plot1.png)

The plot for Donald Trump Twitter and China is as follows:
![images](https://MinShiMia.github.io/images/Donald%20Trump%20Twitter%20Plot2.png)


II. Non-API Method

1. Data and method to collect the data: The data is gained via python package "GetOldTweets3". It is the historical twitter data about "Trump and
"China-U.S. Trade War" from Jan. 2017 to June 2020. You could get the data file [here](
https://github.com/MinShiMia/Other-Course-Projects/blob/fde3d395e5cc48d1e02d23fc8b9f892c01e3f795/EPPS-7V81-Advanced-Data-Programming/Assignments/Trump-U.S.-China%20trade%20war.csv).

2. The method and code to analyze the data: I used Rstudio and several packages to get the plots for the frequency of tweets, retweets, replies, favorites,
and mentions. You could find my R code for reference [here](https://github.com/MinShiMia/Other-Course-Projects/blob/fde3d395e5cc48d1e02d23fc8b9f892c01e3f795/EPPS-7V81-Advanced-Data-Programming/Assignments/Exercise%202_visualize%20the%20data.R).


3. The results are shown below:
![images1](https://MinShiMia.github.io/images/TwitterFrequencyUSChina.png)
![images2](https://MinShiMia.github.io/images/TwitterRetweetsUSChina.png)
![images3](https://MinShiMia.github.io/images/TwitterRepliesUSChina.png)
![images4](https://MinShiMia.github.io/images/TwitterFavoritesUSChina1.png)
![images5](https://MinShiMia.github.io/images/TwitterMentionsUSChina1.png)

Also, you are welcomed to talk with me if you have any questions with my code.
Thanks!
