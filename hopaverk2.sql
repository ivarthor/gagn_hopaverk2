drop database if exists 0901013310_hopaverk2;
create database 0901013310_hopaverk2;
use 0901013310_hopaverk2;

create table employee(
	EMP_NUM int not null primary key,
    EMP_LNAME char(20),
    EMP_FNAME char(20),
    EMP_INITIAL varchar(20),
    EMP_HIREDATE date,
    EMP_YEARS INT(3)
);

CREATE TABLE project(
	PROJ_NUM INT NOT NULL PRIMARY KEY,
    PROJ_NAME char(50),
    PROJ_VALUE INT,
    PROJ_BALANCE INT
);

CREATE TABLE assignment(
	ASSIGN_NUM INT NOT NULL PRIMARY KEY,
    ASSIGN_DATE DATE,
    ASSIGN_JOB int,
    ASSIGN_CHG_HR INT NOT NULL,
    ASSIGN_HOURS float NOT NULL,
    ASSIGN_CHARGE DOUBLE NOT NULL
);

CREATE TABLE job(
	JOB_CODE INT NOT NULL PRIMARY KEY,
    JOB_DESC varchar(50),
    JOB_CHG_HOUR DOUBLE,
    JOB_LAST_UPDATE date
);

ALTER TABLE employee add JOB_CODE int not null;
alter table employee add constraint JOB_CODE_FK foreign key(JOB_CODE) references job(JOB_CODE);

ALTER TABLE project add EMP_NUM int not null;
alter table project add constraint EMP_NUM_FK foreign key(EMP_NUM) references employee(EMP_NUM);

ALTER TABLE assignment add PROJ_NUM int not null;
ALTER TABLE assignment modify EMP_NUM int not null;
alter table assignment add constraint PROJ_NUM_FK foreign key (PROJ_NUM) references project (PROJ_NUM);
alter table assignment add constraint EMP_NUM_FK foreign key (EMP_NUM) references employee (EMP_NUM);

insert into employee(EMP_NUM,EMP,LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,EMP_YEAR)
VALUES(101,'News','John','G','08-nóv.-00',4),
(102,'Senior','David','H','12-júl.-89',15),
(103,'Arbough','June','E','01-des.-96',8),
(104,'Ramoras','Anne','K','15-nóv.-87',17),
(105,'Johnson','Alice','K','01-feb.-93',12),
(106,'Smithfield','William',null,'22-jún.-04',0),
(107,'Alonzo','Maria','D','10-okt.-93',11),
(108,'Washington','Ralph','B','22-ágú.-91',13),
(109,'Smith','Larry','W','18-júl.-97',7),
(110,'Olenko','Gerald','A','11-des.-95',9),
(111,'Wabash','Geoff','B','04-apr.-91',14),
(112,'Smithson','Darlene','M','23-okt.-94',10),
(113,'Joenbrood','Delbert','K','15-nóv.-96',8),
(114,'Jones','Annelise',null,'20-ágú.-93',11),
(115,'Bawangi','Travis','B','25-jan.-92',13),
(116,'Pratt','Gerald','L','05-mar.-97',8),
(117,'Williamson','Angie','H','19-jún.-96',8),
(118,'Frommer','James','J','04-jan.-05',0)


