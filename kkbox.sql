CREATE TABLE transaction(
id serial primary key 
,msno varchar(255) NOT NULL
,payment_method_id int NOT NULL
,payment_plan_days int NOT NULL
,plan_list_price int NOT NULL
,actual_amount_paid int NOT NULL
,is_auto_renew boolean NOT NULL
,transaction_date int NOT NULL
,membership_Expire_Date int NOT NULL
,is_cancel boolean NOT NULL)


COPY transaction (msno, payment_method_id, payment_plan_days, plan_list_price, actual_amount_paid, is_auto_renew, transaction_date, membership_Expire_Date, is_cancel)

FROM 
'/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/transactions_v2.csv' DELIMITER ',' CSV HEADER




CREATE TABLE member(
msno varchar(255) primary key
,city int NOT NULL
,bd int NOT NULL
,gender varchar(255)
,registered_via int NOT NULL
,registration_init_time int NOT NULL
)

COPY member
FROM 
'/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/members_v3.csv' DELIMITER ',' CSV HEADER


-- ALTER TABLE transaction 
-- ADD CONSTRAINT constraint_name FOREIGN KEY (msno) REFERENCES member(msno);




CREATE TABLE train(
msno varchar(255) primary key 
,is_churn boolean NOT NULL
)

COPY train
FROM 
'/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/train_v2.csv' DELIMITER ',' CSV HEADER





CREATE TABLE user_log(
id serial primary key 
,msno varchar(255) 
,date_entry int NOT NULL
,num_25 int NOT NULL
,num_50 int NOT NULL
,num_75 int NOT NULL
,num_985 int NOT NULL
,num_100 int NOT NULL
,num_unq int NOT NULL
,total_secs decimal NOT NULL
)

COPY user_log (msno, date_entry, num_25, num_50, num_75, num_985, num_100, num_unq, total_secs)
FROM 
'/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/user_logs_v2.csv' DELIMITER ',' CSV HEADER


-- count: 18,396,362


CREATE TABLE common_members
AS 
(SELECT 
 msno

from train_v2

where msno in (select msno from userlog_v2)
AND msno in (select msno from member_v2)
AND msno in (select msno from transaction_v2))



ALTER TABLE common_members
ADD COLUMN id SERIAL PRIMARY KEY;




CREATE TABLE member_new
AS 
(SELECT
 *

FROM member_v2 

WHERE msno IN (select msno from common_members))

-- count: 725,722


CREATE TABLE train_new
AS 
(SELECT
 *

FROM train_v2

WHERE msno IN (select msno from common_members))

-- count: 725,722


CREATE TABLE transaction_new
AS 
(SELECT
 *

FROM transaction_v2

WHERE msno IN (select msno from common_members))


-- count: 890,959


CREATE TABLE user_log_new
AS 
(SELECT
 *

FROM userlog_v2 

WHERE msno IN (select msno from common_members))

-- count: 13,200,675


CREATE TABLE test(
msno varchar(255) primary key 
,is_churn boolean NOT NULL
)

COPY test
FROM 
'/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/sample_submission_v2.csv' DELIMITER ',' CSV HEADER

-- 801,490 msno in common with the train set


ALTER TABLE IF EXISTS member
RENAME TO member_v2;

ALTER TABLE IF EXISTS test
RENAME TO test_v2;

ALTER TABLE IF EXISTS train
RENAME TO train_v2;

ALTER TABLE IF EXISTS transaction
RENAME TO transaction_v2;

ALTER TABLE IF EXISTS user_log
RENAME TO userlog_v2;
