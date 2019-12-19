SELECT 
count(msno)

from member

where msno in (select msno from train)

-- count msno in member: 6,769,473
-- count msno in train: 970,960
-- distinct count of msno in user_log: 1,103,894

SELECT 
count(distinct msno)

from train

where msno in (select msno from user_log)
AND msno in (select msno from member)
AND msno in (select msno from transaction)

-- 754,532 rows userlog, member, without transaction
-- 725,722 with transaction


SELECT
 *

FROM member 

WHERE msno IN (select msno from common_members)


COPY member_new TO '/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/made_by_me/member_new.csv' DELIMITER ',' CSV HEADER;

COPY train_new TO '/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/made_by_me/train_new.csv' DELIMITER ',' CSV HEADER;

COPY transaction_new TO '/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/made_by_me/transaction_new.csv' DELIMITER ',' CSV HEADER;

COPY user_log_new TO '/Users/galvanize/Documents/projects/kkbox-churn-prediction-challenge/made_by_me/user_log_new.csv' DELIMITER ',' CSV HEADER;


	
SELECT to_date(registration_init_time::text,'YYYYMMDD')
from member_new 
limit 5;

ALTER TABLE member_new 
ALTER COLUMN registration_init_time TYPE DATE USING to_date(registration_init_time::text,'YYYYMMDD');


ALTER TABLE transaction 
ALTER COLUMN transaction_date TYPE DATE USING to_date(transaction_date::text,'YYYYMMDD');

ALTER TABLE transaction
ALTER COLUMN membership_expire_date TYPE DATE USING to_date(membership_expire_date::text,'YYYYMMDD');

ALTER TABLE user_log
ALTER COLUMN date_entry TYPE DATE USING to_date(date_entry::text,'YYYYMMDD');



