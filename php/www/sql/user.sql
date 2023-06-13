create table user (
    uid INT auto_increment primary KEY ,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    login_type INT
);
