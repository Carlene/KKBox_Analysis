<p align="center">
  <img width="418" height="170" src="https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/kkbox_logo.png">
</p>

## Let's Analyze! (TBE)
What's KKBOX?

KKBOX is a music subscription service started in 2005 in Taiwan. It was one of the first companies to enter the music streaming scene, and its slogan is Let’s Music! 

![Lets_Music_logo](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/logo_music.png)

They have over 10 M users and have over 50 M tracks, hosting the largest database of Chinese music. Currently, they’re in 5 different countries (Taiwan, Hong Kong, Japan, Singapore and Malaysia), and are still growing! Last month, they entered a partnership with Microsoft to start branching their product to other countries and continents. With this new partnership in mind, I wanted to look at a group of KKBOX’s subscriber base. 

So, who are KKBOX’s customers? Much of the data was anonymized, so I focused on the information that was the most descriptive. 

![churn](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/churned_members.png)

I grabbed a random sample of 665K subscribers who had a subscription in the month of March in 2017. They tended against churning, with 94% of users deciding to renew their subscription vs. the 6% who didn’t.

![gender](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/gender.png)![gender_churn](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/churn_age.png)

Of the sampled subscribers, 22.6% are female and 24.7% are male. There’s not a huge difference, about 2%, in the genders who decide to self-identify themselves who subscribe to KKBOX. 52.6% of subscribers choose not to give a gender. Even accounting for the difference in amounts of users who self-identify to those who don’t, users who don’t input their gender are less likely to churn than people who do.

![age_stacked_legend](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/age_legend.png)![age_stacked_churn](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/age_stacked.png)

After some cleaning of the data, subscribers range from ages 14-100. Only 1% of subscribers gave an age without giving their gender. 

![age_given](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/churn_age.png) ![age_churn](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/age_given.png)

A large number of subscribers listed their age as ‘0’, not wanting to input their age. Of users who marked themselves as age ‘0’, they were less likely to churn than the users who gave an age.

[GRAPH]

These are the top 5 payment plans our customers use out of 42 different payment plans, converted from New Taiwan Dollar to U.S. Dollar. 98% of the KKBOX subscriber base pay for one of these plans. The most popular plan with about 50% of subscribers is $4.92/month, followed by the $3.24/month, then the $5.94/month.

![two_payments](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/payment_plans2.png)

The fifth of these most popular plans is $3.30/month. It would be interesting to do some A/B testing in the payment plan area, to see whether a customer would pay for the $4.92 plan or the 5.94 plan if the $3.30 plan was taken away.. (It would also be interesting to test prices that end in ‘8’, as it’s a lucky number in the majority of the markets we’re in. Out of the 42 plans only one ends in an ‘8’, and it’s the second most expensive plan: only .64% of subscribers are enrolled in it.)

![top5_gender](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/plans_gender.png)

By gender, this is how the top 5 plans rank. Unlike in the previous chart, some of the plans flip around in popularity by gender. 

![top2_gender](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/plans_gender_high.png)

Men and women tend to pay for more expensive plans than users who don’t input their information. Perhaps that’s the reason that men and women tend to churn more than their genderless counterparts.

![20_33](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/age_line.png)

Back to the ages of our users. Of people who self-identify as male or female, this is the age range of 95% of users. Over 80% of those users fit within the age groups 20-26 and 27-33. I did a couple of hypothesis test for these users to see which group tend to pay for more expensive plans and which tend to churn more often.

Using SciPy, I performed a hypothesis test comparing the types of plans that the 20-26 group use vs. the 27-33 year old group

![plan_test](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/hypothesis_churn_price_age.png)

With 95% confidence, the results of my first hypothesis test show a difference in the amount paid by subscribers aged 20-26 to 27-33. In fact, 20-26 year olds to pay for more expensive payment plans than subscribers aged 27-33.

Which leads me to my next hypothesis test. Which age group churns more?

![churn_test](https://github.com/Carlene/KKBox_Analysis/blob/master/graphs/hypothesis_churn_age.png)

With 95% confidence, these groups also do not tend to churn at the same rate. The subscribers who are 20-26 also tend to churn more than subscribers 27-33. 

Possible next steps:
Finding less anonymized data for more detailed customer study
Figure out which payment plan will keep the most users while allowing for maximum revenue
A/B testing for plan pricing
