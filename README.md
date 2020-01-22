KKBox: Let's Analyze!
=========================

The data for this project was provided by Kaggle.com and KKBOX’s company website. For this project, I used SQL for organizing the datasets into a relational database so I would be able to join information like a customer’s transactions with their demographic data. Python was used because it was faster with the large amount of data I had and for hypothesis testing. Tableau was used for my visualizations.

KKBOX is a music subscription service started in 2005 in Taiwan. It was one of the first companies to enter the music streaming scene, and its slogan is Let’s Music! (why my title is Let’s Analyze! :D). 

They have over 10 M users and have over 50 M tracks, hosting the largest database of Chinese music. Currently, they’re in 5 different countries (Taiwan, Hong Kong, Japan, Singapore and Malaysia), and are still growing! 

Last month, they entered a partnership with Microsoft to start branching their product to other countries and continents. With this new partnership in mind, I wanted to look at a group of KKBOX’s subscriber base. 

I wanted to figure out the characteristics of their subscribers who churn, and the commonalities of subscribers who pay for more expensive plans.

So, who are KKBOX’s customers? Much of the data was anonymized, so I focused on the information that was the most descriptive. 

I grabbed a random sample of 665K subscribers who had a subscription in the month of March in 2017. They tended against churning, with 94% of users deciding to renew their subscription vs. the 6% who didn’t.

Of the sampled subscribers, 22.6% are female and 24.7% are male. There’s not a huge difference, about 2%, in the genders who decide to self-identify themselves who subscribe to KKBOX. 52.6% of subscribers choose not to give a gender.

Even accounting for the difference in amounts of users who self-identify to those who don’t, users who don’t input their gender are less likely to churn than people who do. 

After some cleaning of the data, subscribers range from ages 14-100. Only 1% of subscribers gave an age without giving their gender. 

A large number of subscribers listed their age as ‘0’, not wanting to input their age. 

Of users who marked themselves as age ‘0’, they were less likely to churn than the users who gave an age.

These are the top 5 payment plans our customers use out of 42 different payment plans, converted from New Taiwan Dollar to U.S. Dollar. 98% of the KKBOX subscriber base pay for one of these plans. The most popular plan with about 50% of subscribers is $4.92/month, followed by the $3.24/month, then the $5.94/month.

The fifth of these most popular plans is $3.30/month. It would be interesting to do some A/B testing in the payment plan area, to see whether a customer would pay for the $4.92 plan or the 5.94 plan if the $3.30 plan was taken away.. (It would also be interesting to test prices that end in ‘8’, as it’s a lucky number in the majority of the markets we’re in. Out of the 42 plans only one ends in an ‘8’, and it’s the second most expensive plan: only .64% of subscribers are enrolled in it.)

By gender, this is how the top 5 plans rank. Unlike in the previous chart, some of the plans flip around in popularity by gender. Men and women tend to pay for more expensive plans than users who don’t input their information. Perhaps that’s the reason that men and women tend to churn more than their genderless counterparts.

Back to the ages of our users. Of people who self-identify as male or female, this is the age range of 95% of users. Over 80% of those users fit within the age groups 20-26 and 27-33. I did a couple of hypothesis test for these users to see which group tend to pay for more expensive plans and which tend to churn more often.

Using SciPy, I performed a hypothesis test comparing the types of plans that the 20-26 group use vs. the 27-33 year old group

With 95% confidence, the results of my first hypothesis test show a difference in the amount paid by subscribers aged 20-26 to 27-33. In fact, 20-26 year olds to pay for more expensive payment plans than subscribers aged 27-33.

Which leads me to my next hypothesis test. Which age group churns more?

With 95% confidence, these groups also do not tend to churn at the same rate. The subscribers who are 20-26 also tend to churn more than subscribers 27-33. 

Possible next steps:
Finding less anonymized data for more detailed customer study
Figure out which payment plan will keep the most users while allowing for maximum revenue
A/B testing for plan pricing
