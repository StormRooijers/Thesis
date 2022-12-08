# Thesis

This repository coints code and data for the thesis: 

“Predicting the unpredictable” - Predicting the Bitcoin price using machine learning techniques


#Table of content
- In the analysis folder, the descriptive analysis can be found. 
- In the data folder, the databases used in the descriptive analysis can be found. 
- In the Twitter sentiment folder, the approach of collecting tweets and the VADER sentiment analysis can be found. 


#Background information
Currently, I am struggeling with collecting the Tweets from the historical archive which requieres academic access. 

I succeeded to collect the tweets from the last 7 days (which is free and does not contain a limit such as the academic acccess) and adding it to a file and run the Vader sentiment analysis.

I want to collect 2500 tweets per day from the period 2013- August 2022 (3530 days), so in total 8.8 million tweets. 

However, when I tried to do this from the period 2013-2022, I faced the issue that you can only collect 200/500 tweets per second, so I need to include a pause. Now I am stuck at this point; when I then go through the loop again (after the pause), it just adds the same 200/500 tweets again to the file instead of continuing where it stopped. (So it takes the tweets from 23:59-23:57 again, instead of taking and adding the tweets from for example 23:57-23:54). Thus, what I still need to improve in my code is that it adds the new 200/500 tweets correctly until I have reached the 2500 before it moves on to the next day. 
