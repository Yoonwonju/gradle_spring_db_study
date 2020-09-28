SELECT TITLE_NO, TITLE_NAME
FROM TITLE;

SELECT DEPT_NO, DEPT_NAME, FLOOR
FROM DEPARTMENT;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, HIREDATE FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE e;


SELECT  *
  FROM TITLE;

SELECT  *
  FROM DEPARTMENT;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, HIREDATE
  FROM EMPLOYEE e ;
  
INSERT INTO EMPLOYEE VALUES (1365, '김상원', 5, 3426, 1500000, 1, 2020-08-30 );

---------------------------

SELECT max(TITLE_NO)+1 FROM TITLE;

SELECT max(DEPT_NO)+1 FROM DEPARTMENT;

INSERT INTO DEPARTMENT VALUES (4, '홍보',  5);

SELECT  *  FROM DEPARTMENT;

DELETE FROM DEPARTMENT WHERE DEPT_NO = 4;

UPDATE DEPARTMENT SET DEPT_NAME = '보홍', FLOOR = '7'  WHERE DEPT_NO = 5;

CREATE OR REPLACE VIEW VW_EMPLOYEE_JOIN AS 
SELECT e.EMP_NO, e.EMP_NAME, e.TNO, e.MANAGER , e.SALARY, e.DNO, e.REGDATE, e.EMAIL , e.TEL , e.PIC_URL, 
       t.TITLE_NAME, d.DEPT_NAME, m.EMP_NAME MANAGER_NAME
  FROM EMPLOYEE e JOIN TITLE t ON e.TNO = t.TITLE_NO 
       LEFT JOIN EMPLOYEE m ON e.MANAGER = m.EMP_NO 
       JOIN DEPARTMENT d ON e.DNO = d.DEPT_NO; 
      
SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, REGDATE, 
       EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME 
  FROM VW_EMPLOYEE_JOIN;

 
SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, REGDATE, TEL, PIC_URL 
  FROM EMPLOYEE;

SELECT MAX(TNO)+1 FROM EMPLOYEE;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, REGDATE, TEL, PIC_URL
  FROM EMPLOYEE 
 WHERE EMP_NO = 3011;

DELETE FROM EMPLOYEE WHERE EMP_NO = 4;

UPDATE EMPLOYEE SET EMP_NAME = '보홍' WHERE EMP_NO = 5;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, REGDATE, TEL, PIC_URL
  FROM EMPLOYEE WHERE EMP_NO = 4377; 
 
 
---------------------------------------------------
--- TRIGGER---
---------------------------------------------------
DROP TABLE TRI_TEST;
DROP TRIGGER TRI_TRI_TEST_AUTOSEQ; 
DROP SEQUENCE TRI_TEST_SEQ;

CREATE TABLE TRI_TEST (
	NO NUMBER PRIMARY KEY,
	TXT VARCHAR2(20)
);

CREATE SEQUENCE TRI_TEST_SEQ
	START WITH 1
	INCREMENT BY 1;
	
-- 트리거를 이용하여 자동으로 번호가 입력되도록

CREATE OR REPLACE TRIGGER TRI_TRI_TEST_AUTOSEQ
BEFORE INSERT ON TRI_TEST
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.NO IS NULL THEN 
		SELECT TRI_TEST_SEQ.NEXTVAL INTO :NEW.NO FROM DUAL;
	END IF;
END ;

INSERT INTO TRI_TEST VALUES(NULL, 'TEST');

SELECT * FROM TRI_TEST;

INSERT INTO TRI_TEST(TXT) VALUES('TEST2');

----------------------------------------------------

SELECT * FROM PRODUCT WHERE CODE = 2;
SELECT * FROM PRODUCT;

SELECT CODE,NAME,PRICE,PICTUREURL,DESCRIPTION FROM PRODUCT;

SELECT CODE,NAME,PRICE,PICTUREURL,DESCRIPTION FROM PRODUCT WHERE 

UPDATE PRODUCT
   SET NAME = '웹표준을 위한 HTML5',PRICE = '12345',PICTUREURL = 'TEST.JPG',DESCRIPTION = '기초책'
 WHERE CODE = 7;

DELETE FROM PRODUCT WHERE CODE = 7;

DROP TABLE PRODUCT;
DROP TRIGGER TRI_TRI_TEST_AUTOSEQ; 
DROP SEQUENCE TRI_TEST_SEQ;


-----------------------------------

SELECT * FROM BOARD;

SELECT NUM,PASS,NAME,EMAIL,TITLE,CONTENT,READCOUNT,WRITEDATE
  FROM BOARD;
 
INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
VALUES('1234', '이유영', 'TEST3@TEST.CO.KR', '첫방문3', '반갑습니다.3', '0', '2020-04-14');


SELECT NUM,PASS,NAME,EMAIL,TITLE,CONTENT,READCOUNT,WRITEDATE
  FROM BOARD
 WHERE NUM = ?;

INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
VALUES(?,?,?,?,?,?,?);

UPDATE BOARD SET PASS=?, NAME=?, EMAIL=?, TITLE=?, CONTENT=?, READCOUNT=?, WRITEDATE=?
 WHERE NUM = ?;

DELETE FROM BOARD WHERE NUM = 30;

UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?;
