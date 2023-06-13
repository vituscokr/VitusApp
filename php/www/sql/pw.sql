create table my_password (
    uid INT auto_increment primary KEY ,
    sitename varchar(255) comment '사이트명',
    username varchar(255) comment '유저명',
    password varchar(255) comment '비번',
    memo TEXT comment '메모', 
    wdate datetime default CURRENT_TIMESTAMP comment '작성일',
    udate datetime default CURRENT_TIMESTAMP comment '수정일'
)