create table movies
(
	movies_id number(5) primary key,
	movie_title varchar2(50) not null,
	director varchar2(50) not null,
	actors varchar2(50) not null
);

create table reviews
(
	review_id number(5) primary key,
	movies_id number(5) not null,
	review_comment varchar(500),
	rating number(1)
);
	
CREATE TABLE MOVIEUSERS
(
	user_name VARCHAR2(50)       NOT NULL,
    user_password VARCHAR2(50)  NOT NULL,
    email VARCHAR2(100) 		NOT NULL,
	fname VARCHAR2(50) 			NOT NULL,
	lname VARCHAR2(50) 			NOT NULL,
    address VARCHAR2(50)                ,
    state VARCHAR2(3)                   ,
    primary key(user_name, email)
);
create sequence movie_id_seq start with 1 nocache;

create sequence review_id_seq start with 1 nocache;

insert into movies values(movie_id_seq.nextval, 'Old', 'Night Shyamalan', 'Night Shyamalan');

insert into movies values(movie_id_seq.nextval, 'Escape Room', 'Adam Robitel', 'Taylor Russell');

insert into movies values(movie_id_seq.nextval, 'A Quiet Place', 'John Krasinski', 'John Krasinski');