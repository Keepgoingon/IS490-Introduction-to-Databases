CREATE TABLE JINRANY2_A3_CLIENT
( CLIENTID  NUMBER(9) NOT NULL,
LastNM VARCHAR2(40) NOT NULL,
FirstNM VARCHAR2(40) NOT NULL,
STREETADDRESS VARCHAR2(100),
CITY VARCHAR2(20),
STATE VARCHAR2(20),
ZIP VARCHAR2(20),
HOMEPHONE VARCHAR2(20),
WORKPHONE VARCHAR2(20) ,
HOMESIZE NUMBER,
NUMBATH INT,
PRIMARY KEY(CLIENTID));
alter table JINRANY2_A3_CLIENT rename  column HOMESIZE to HOUSESIZE;
grant select on JINRANY2_A3_CLIENT to GSLISDM
grant select on JINRANY2_A3_CLIENT to jguo24

CREATE TABLE JINRANY2_A3_WORK 
(WORKNAME VARCHAR2(40) NOT NULL, 
COSTHOUR VARCHAR2(40), 
ISPACKAGE VARCHAR2(40), 
DESCRIPTION VARCHAR2(200), 
PRIMARY KEY (WORKNAME));
grant select on JINRANY2_A3_WORK to GSLISDM
grant select on JINRANY2_A3_WORK to jguo24

CREATE TABLE JINRANY2_A3_CONTAIN 
(PACKAGENM VARCHAR2(200) NOT NULL, 
WORKNM_INCLUDED VARCHAR2(200) NOT NULL, 
PRIMARY KEY (PACKAGENM, WORKNM_INCLUDED),
FOREIGN KEY (PACKAGENM) REFERENCES JINRANY2_A3_WORK (WORKNAME)
ON DELETE CASCADE, 
FOREIGN KEY (WORKNM_INCLUDED)REFERENCES JINRANY2_A3_WORK (WORKNAME)
ON DELETE CASCADE);
grant select on JINRANY2_A3_CONTAIN to GSLISDM
grant select on JINRANY2_A3_CONTAIN to jguo24

CREATE TABLE JINRANY2_A3_PETCOMMENT 
(PETCOMMENT VARCHAR2(40) NOT NULL, 
CLIENTID NUMBER(9) NOT NULL , 
PRIMARY KEY (PETCOMMENT, CLIENTID),
FOREIGN KEY (CLIENTID)REFERENCES JINRANY2_A3_CLIENT(CLIENTID)
ON DELETE CASCADE);
grant select on JINRANY2_A3_PETCOMMENT to GSLISDM
grant select on JINRANY2_A3_PETCOMMENT to jguo24

CREATE TABLE JINRANY2_A3_PURCHASE 
(SCHEDULED_DATE DATE NOT NULL, 
ACTUAL_TIME VARCHAR2(20 ), 
ESTIMATED_TIME VARCHAR2(20 ), 
WORKNM VARCHAR2(40) NOT NULL, 
CLIENTID NUMBER(9) NOT NULL, 
PRIMARY KEY (WORKNM, CLIENTID, SCHEDULED_DATE),
FOREIGN KEY (CLIENTID)REFERENCES JINRANY2_A3_CLIENT (CLIENTID)
ON DELETE CASCADE, 
FOREIGN KEY (WORKNM) REFERENCES JINRANY2_A3_WORK(WORKNAME)
ON DELETE CASCADE);
grant select on JINRANY2_A3_PURCHASE to GSLISDM
grant select on JINRANY2_A3_PURCHASE to jguo24


INSERT INTO JINRANY2_A3_CLIENT
VALUES ('00000001','Payton','Antonsen','1000 W Stoughton','Urbana',
'IL','61801','2176789098','2178909876','2100','4');
INSERT INTO JINRANY2_A3_CLIENT
VALUES ('00000002','Geogri','Ma','1001 W Stoughton','Urbana',
'IL','61801','2173467898','2174567898','2300','3');
INSERT INTO JINRANY2_A3_CLIENT
VALUES ('00000003','Matas','Howse','1002 W Stoughton','Urbana',
'IL','61801','2175898432','2173058910','1600','2');
INSERT INTO JINRANY2_A3_CLIENT
VALUES ('00000004','Holger','Shea','1th','Champaign',
'IL','61802','2173890987','2174767923','2400','3');
INSERT INTO JINRANY2_A3_CLIENT
VALUES ('00000005','Alexander','Rais','2th','Champaign',
'IL','61802','2174987654','2175689098','1200','1');

INSERT INTO JINRANY2_A3_WORK
VALUES('Washing Windows','10','NO','Washing the windows');
INSERT INTO JINRANY2_A3_WORK
VALUES('Waxing floor','7','NO','Waxing the floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('Cleaning carpet','11','NO','Steam-cleaning the carpet');
INSERT INTO JINRANY2_A3_WORK
VALUES('Dusting kitchen floor','5','NO','Dusting the kitchen floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('Vacuuming kitchen floor','5','NO','Vacuuming the kitchen floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('Washing kitchen floor','5','NO','Washing the kitchen floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('Polishing furniture','7','NO','Polishing the furniture');
INSERT INTO JINRANY2_A3_WORK
VALUES('Cleaning bathroom floor','6','NO','Cleaning bathroom floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('Cleaning bathtub','9','NO','Cleaning bathtub');
INSERT INTO JINRANY2_A3_WORK
VALUES('Cleaning the cooking bench','7','NO','Cleaning the cooking bench');
INSERT INTO JINRANY2_A3_WORK
VALUES('Once Over Lightly','12','YES','Dusting,vacuuming and washing the kitchen floor');
INSERT INTO JINRANY2_A3_WORK
VALUES('My Mother is Coming','35','YES','Dusting,vacuuming and washing the kitchen floor,
Washing the windows,Steam-cleaning the carpet,Polishing the furniture');
INSERT INTO JINRANY2_A3_WORK
VALUES('All in One','50','YES','Waxing floor,Cleaning the carpet,
Dusting kitchen floor, Vacuuming kitchen floor, Washing kitchen floor, Cleaning bathroom floor,
Cleaning bathtub, Cleaning the cooking bench');

INSERT INTO JINRANY2_A3_CONTAIN
VALUES('Once Over Lightly','Dusting kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('Once Over Lightly','Vacuuming kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('Once Over Lightly','Washing kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Dusting kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Vacuuming kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Washing kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Washing Windows');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Cleaning carpet');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('My Mother is Coming','Polishing furniture');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Waxing floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Cleaning carpet');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Dusting kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Vacuuming kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Washing kitchen floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Cleaning bathroom floor');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Cleaning bathtub');
INSERT INTO JINRANY2_A3_CONTAIN
VALUES('All in One','Cleaning the cooking bench');

INSERT INTO JINRANY2_A3_PETCOMMENT (CLIENTID,Petcomment)
values('00000001','Dog will be shut in the basement');
INSERT INTO JINRANY2_A3_PETCOMMENT (CLIENTID,Petcomment)
values('00000005','Cat is not allowed out');

INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000001','My Mother is Coming',TO_DATE('2017-9-1','YYYY-MM-DD'),
'5','6');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000004','Polishing furniture',TO_DATE('2017-9-1','YYYY-MM-DD'),
'2','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000001','Washing kitchen floor',TO_DATE('2017-9-2','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','All in One',TO_DATE('2017-9-2','YYYY-MM-DD'),
'6','6');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','Polishing furniture',TO_DATE('2017-9-2','YYYY-MM-DD'),
'2','2');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000003','My Mother is Coming',TO_DATE('2017-9-2','YYYY-MM-DD'),
'5','5');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000004','My Mother is Coming',TO_DATE('2017-9-2','YYYY-MM-DD'),
'5','5');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000005','Dusting kitchen floor',TO_DATE('2017-9-3','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','All in One',TO_DATE('2017-9-3','YYYY-MM-DD'),
'6','5');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000003','Polishing furniture',TO_DATE('2017-9-7','YYYY-MM-DD'),
'2','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000003','Washing Windows',TO_DATE('2017-9-7','YYYY-MM-DD'),
'2','2');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000003','Vacuuming kitchen floor',TO_DATE('2017-9-7','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','Washing kitchen floor',TO_DATE('2017-9-13','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000003','Washing kitchen floor',TO_DATE('2017-9-13','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000005','All in One',TO_DATE('2017-9-15','YYYY-MM-DD'),
'6','7');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000004','Once Over Lightly',TO_DATE('2017-9-15','YYYY-MM-DD'),
'6','7');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000001','Once Over Lightly',TO_DATE('2017-9-16','YYYY-MM-DD'),
'6','6');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','Cleaning bathtub',TO_DATE('2017-9-17','YYYY-MM-DD'),
'1','2');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','Cleaning the cooking bench',TO_DATE('2017-09-17','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000002','Cleaning bathroom floor',TO_DATE('2017-09-17','YYYY-MM-DD'),
'1','1');
INSERT INTO JINRANY2_A3_PURCHASE (CLIENTID, WORKNM,SCHEDULED_DATE,
ESTIMATED_TIME,ACTUAL_TIME)
VALUES ('00000001','Cleaning bathroom floor',TO_DATE('2017-09-19','YYYY-MM-DD'),
'1','1');

--a.
SELECT COUNT(CLIENTID) AS NUM_OF_CLIENTS
FROM JINRANY2_A3_CLIENT
WHERE HOUSESIZE>= 2000;

--b.Let X= 'All in One'
SELECT JINRANY2_A3_CONTAIN. WORKNM_INCLUDED, JINRANY2_A3_WORK.COSTHOUR
FROM JINRANY2_A3_WORK, JINRANY2_A3_CONTAIN
WHERE JINRANY2_A3_CONTAIN.PACKAGENM = 'All in One' 
      AND JINRANY2_A3_CONTAIN.WORKNM_INCLUDED = JINRANY2_A3_WORK.WORKNAME;

--c.Let X= 'All in one'      
SELECT (INDIVIDUAL_COST - PACKAGE_COST) AS DISCOUNTS
FROM (SELECT SUM(COSTHOUR) AS INDIVIDUAL_COST
FROM JINRANY2_A3_CONTAIN JOIN JINRANY2_A3_WORK 
ON  JINRANY2_A3_CONTAIN.WORKNM_INCLUDED = JINRANY2_A3_WORK.WORKNAME
WHERE JINRANY2_A3_CONTAIN.PACKAGENM ='All in One'),
(SELECT COSTHOUR AS PACKAGE_COST
FROM JINRANY2_A3_WORK
WHERE WORKNAME ='All in One');

--d.Let X= 'My Mother is Coming'
SELECT FIRSTNM, LASTNM, JINRANY2_A3_PURCHASE.CLIENTID, 
WORKPHONE, HOMEPHONE,HOUSESIZE, NUMBATH, STATE, CITY, STREETADDRESS, 
ZIP, JINRANY2_A3_PURCHASE.WORKNM, ESTIMATED_TIME
FROM JINRANY2_A3_CLIENT INNER JOIN JINRANY2_A3_PURCHASE 
ON JINRANY2_A3_CLIENT.CLIENTID = JINRANY2_A3_PURCHASE.CLIENTID
WHERE JINRANY2_A3_PURCHASE.SCHEDULED_DATE BETWEEN TO_DATE('2017-09-01','YYYY-MM-DD') AND TO_DATE('2017-9-30','YYYY-MM-DD')
AND JINRANY2_A3_PURCHASE.WORKNM = 'My Mother is Coming'
ORDER BY JINRANY2_A3_PURCHASE.SCHEDULED_DATE;

--e.LET client ID = 00000001
SELECT JINRANY2_A3_CLIENT.ClIENTID, JINRANY2_A3_CLIENT.LASTNM, JINRANY2_A3_CLIENT.FIRSTNM,
JINRANY2_A3_CLIENT.WORKPHONE, JINRANY2_A3_CLIENT.HOMEPHONE, JINRANY2_A3_CLIENT.HOUSESIZE, 
JINRANY2_A3_CLIENT.NUMBATH, JINRANY2_A3_CLIENT.STREETADDRESS, JINRANY2_A3_CLIENT.CITY, JINRANY2_A3_CLIENT.STATE,
JINRANY2_A3_CLIENT.ZIP, JINRANY2_A3_PURCHASE.ESTIMATED_TIME
FROM JINRANY2_A3_PURCHASE
       INNER JOIN JINRANY2_A3_CLIENT ON JINRANY2_A3_CLIENT.CLIENTID = JINRANY2_A3_PURCHASE.ClIENTID
 WHERE JINRANY2_A3_CLIENT.CLIENTID = '00000001';

--f.Let date X= 2017-09-02
SELECT JINRANY2_A3_CLIENT.FIRSTNM, JINRANY2_A3_CLIENT.LASTNM, JINRANY2_A3_CLIENT.STREETADDRESS
FROM JINRANY2_A3_CLIENT 
INNER JOIN JINRANY2_A3_PURCHASE 
ON JINRANY2_A3_CLIENT.CLIENTID = JINRANY2_A3_PURCHASE.CLIENTID
WHERE JINRANY2_A3_PURCHASE.SCHEDULED_DATE =TO_DATE('2017-09-02','YYYY-MM-DD');

--g. Let X= 2017-09-01, CLIENTID=00000004, Polishing furniture
SELECT JINRANY2_A3_PURCHASE.CLIENTID, JINRANY2_A3_PURCHASE.WORKNM, 
JINRANY2_A3_PURCHASE.ESTIMATED_TIME * JINRANY2_A3_WORK.COSTHOUR AS TOTAL_COST
FROM JINRANY2_A3_WORK 
INNER JOIN (JINRANY2_A3_PURCHASE INNER JOIN JINRANY2_A3_CLIENT ON JINRANY2_A3_PURCHASE.CLIENTID = JINRANY2_A3_CLIENT.CLIENTID) 
ON JINRANY2_A3_PURCHASE.WORKNM = JINRANY2_A3_WORK.WORKNAME
WHERE JINRANY2_A3_PURCHASE.CLIENTID = '00000004' 
AND (JINRANY2_A3_PURCHASE.WORKNM='Polishing furniture') 
AND JINRANY2_A3_PURCHASE.SCHEDULED_DATE = TO_DATE('2017-09-01','YYYY-MM-DD');

