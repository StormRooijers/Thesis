# Thesis

In the descriptive analysis code from R, you can find all the tests that I did which are included in my thesis (also in the order as they are in my thesis). 
I left out the other tests/analyses that I tried because otherwise it would be messy. 



In the Python code for accessing the Twitter API, you can find all the steps that I did so far to scrape the Tweets and some basic VADER analysis. 
I did not include everything I tried because again, then the code will be messy. 

Currently, I am struggeling with collecting the Tweets from the historical archive which requieres academic access. 

I succeeded to collect the tweets from the last 7 days (which is free and does not contain a limit such as the academic acccess) and adding it to a file and run the Vader sentiment analysis.

I want to collect 2500 tweets per day from the period 2013- August 2022 (3530 days), so in total 8.8 million tweets. 

However, when I tried to do this from the period 2013-2022, I faced the issue that you can only collect 200/500 tweets per second, so I need to include a pause. Now I am stuck at this point; when I then go through the loop again (after the pause), it just adds the same 200/500 tweets again to the file instead of continuing where it stopped. (So it takes the tweets from 23:59-23:57 again, instead of taking and adding the tweets from for example 23:57-23:54). Thus, what I still need to improve in my code is that it adds the new 200/500 tweets correctly until I have reached the 2500 before it moves on to the next day. 
