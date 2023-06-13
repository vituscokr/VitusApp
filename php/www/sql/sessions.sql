-- Active: 1686128224838@@vitus.co.kr@3306@lucky

CREATE TABLE sessions ( 

session_key char(32) not null, 

session_expiry int(11) unsigned not null, 

session_value text not null, 

PRIMARY KEY (session_key) 

); 