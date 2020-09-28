SELECT USER FROM DUAL;

--DROP TABLE TRI_TEST;
--DROP SEQUENCE TRI_TEST_SEQ;
--DROP TRIGGER TRI_MEMBER_SEQ; 


create table MEMBER (
	ID number primary key,
	EMAIL varchar(255) unique,
	PASSWORD varchar(100),
	NAME varchar(100),
	REGDATE date
);

CREATE SEQUENCE MEMBER_ID_SEQ
	START WITH 1
	INCREMENT BY 1;
	
-- 트리거를 이용하여 자동으로 번호가 입력되도록
--DROP SEQUENCE MEMBER_SEQ;
CREATE OR REPLACE TRIGGER TRI_MEMBER_ID_SEQ
BEFORE INSERT ON MEMBER
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.ID IS NULL THEN 
		SELECT MEMBER_ID_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
	END IF;
END ;
--DELETE FROM PRODUCT;














/* 새 테이블 */
DROP TABLE TITLE 
	CASCADE CONSTRAINTS;

/* 부서 */
DROP TABLE DEPARTMENT 
	CASCADE CONSTRAINTS;

/* 사원 */
DROP TABLE EMPLOYEE 
	CASCADE CONSTRAINTS;

/* 새 테이블 */
CREATE TABLE TITLE (
	TITLE_NO NUMBER NOT NULL, /* 직책번호 */
	TITLE_NAME VARCHAR2(10) NOT NULL /* 직책명 */
);

COMMENT ON TABLE TITLE IS '새 테이블';

COMMENT ON COLUMN TITLE.TITLE_NO IS '직책번호';

COMMENT ON COLUMN TITLE.TITLE_NAME IS '직책명';

CREATE UNIQUE INDEX PK_TITLE
	ON TITLE (
		TITLE_NO ASC
	);

CREATE UNIQUE INDEX UIX_TITLE
	ON TITLE (
		TITLE_NAME ASC
	);

ALTER TABLE TITLE
	ADD
		CONSTRAINT PK_TITLE
		PRIMARY KEY (
			TITLE_NO
		);

ALTER TABLE TITLE
	ADD
		CONSTRAINT UK_TITLE
		UNIQUE (
			TITLE_NAME
		);

/* 부서 */
CREATE TABLE DEPARTMENT (
	DEPT_NO NUMBER NOT NULL, /* 부서번호 */
	DEPT_NAME VARCHAR2(20), /* 부서명 */
	FLOOR NUMBER(2) /* 위치 */
);

COMMENT ON TABLE DEPARTMENT IS '부서';

COMMENT ON COLUMN DEPARTMENT.DEPT_NO IS '부서번호';

COMMENT ON COLUMN DEPARTMENT.DEPT_NAME IS '부서명';

COMMENT ON COLUMN DEPARTMENT.FLOOR IS '위치';

CREATE UNIQUE INDEX PK_DEPARTMENT
	ON DEPARTMENT (
		DEPT_NO ASC
	);

CREATE UNIQUE INDEX UIX_DEPARTMENT
	ON DEPARTMENT (
		DEPT_NAME ASC
	);

ALTER TABLE DEPARTMENT
	ADD
		CONSTRAINT PK_DEPARTMENT
		PRIMARY KEY (
			DEPT_NO
		);

ALTER TABLE DEPARTMENT
	ADD
		CONSTRAINT UK_DEPARTMENT
		UNIQUE (
			DEPT_NAME
		);

/* 사원 */
CREATE TABLE EMPLOYEE (
	EMP_NO NUMBER NOT NULL, /* 사원번호 */
	EMP_NAME VARCHAR2(20) NOT NULL, /* 사원명 */
	TNO NUMBER, /* 직책 */
	MANAGER NUMBER, /* 직속상사 */
	SALARY NUMBER, /* 급여 */
	DNO NUMBER, /* 부서 */
	HIREDATE DATE /* 입사일 */
);

COMMENT ON TABLE EMPLOYEE IS '사원';

COMMENT ON COLUMN EMPLOYEE.EMP_NO IS '사원번호';

COMMENT ON COLUMN EMPLOYEE.EMP_NAME IS '사원명';

COMMENT ON COLUMN EMPLOYEE.TNO IS '직책';

COMMENT ON COLUMN EMPLOYEE.MANAGER IS '직속상사';

COMMENT ON COLUMN EMPLOYEE.SALARY IS '급여';

COMMENT ON COLUMN EMPLOYEE.DNO IS '부서';

COMMENT ON COLUMN EMPLOYEE.HIREDATE IS '입사일';

CREATE UNIQUE INDEX PK_EMPLOYEE
	ON EMPLOYEE (
		EMP_NO ASC
	);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT PK_EMPLOYEE
		PRIMARY KEY (
			EMP_NO
		);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT FK_TITLE_TO_EMPLOYEE
		FOREIGN KEY (
			TNO
		)
		REFERENCES TITLE (
			TITLE_NO
		);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT FK_EMPLOYEE_TO_EMPLOYEE
		FOREIGN KEY (
			MANAGER
		)
		REFERENCES EMPLOYEE (
			EMP_NO
		);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT FK_DEPARTMENT_TO_EMPLOYEE
		FOREIGN KEY (
			DNO
		)
		REFERENCES DEPARTMENT (
			DEPT_NO
		);
		
	
----------------------------------------------------------
/* 직책 */	
CREATE TABLE TITLE (
	TITLE_NO NUMBER PRIMARY KEY, /* 직책번호 */
	TITLE_NAME VARCHAR2(10) NOT NULL /* 직책명 */
);


/* 부서 */
CREATE TABLE DEPARTMENT (
	DEPT_NO NUMBER PRIMARY KEY, /* 부서번호 */
	DEPT_NAME VARCHAR2(20), /* 부서명 */
	FLOOR NUMBER(2) /* 위치 */
);
DROP TABLE TITLE;
DROP TABLE DEPARTMENT;

/* 사원 */
CREATE TABLE EMPLOYEE (
    EMP_NO   NUMBER,
    EMP_NAME VARCHAR2(20) NOT NULL,
    TNO      NUMBER,
    MANAGER  NUMBER,
    SALARY   NUMBER,
    DNO      NUMBER,
    EMAIL    varchar2(60) NOT NULL,
    PASSWD   varchar2(60) NOT NULL,
    REGDATE  DATE DEFAULT SYSDATE,
    TEL      char(13),
    PIC_URL  varchar2(100),
    CONSTRAINT EMPLOYEE_EMPNO_PK   PRIMARY KEY (EMP_NO),
    CONSTRAINT EMPLOYEE_TNO_FK     FOREIGN KEY (TNO)     REFERENCES TITLE(TITLE_NO) ON DELETE SET NULL, 
    CONSTRAINT EMPLOYEE_MANAGER_FK FOREIGN KEY (MANAGER) REFERENCES EMPLOYEE(EMP_NO),
    CONSTRAINT EMPLOYEE_SALARY_CK  CHECK (SALARY < 6000000),
    CONSTRAINT EMPLOYEE_DNO_FK     FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DEPT_NO) ON DELETE CASCADE
);


------------------------------------------------------------

-- 접속자 확인
SELECT USER FROM DUAL;

DROP TABLE TRI_TEST;
DROP TRIGGER TRI_TRI_TEST_AUTOSEQ; 
DROP SEQUENCE TRI_TEST_SEQ;

CREATE TABLE PRODUCT (
	code number(5) PRIMARY KEY,
	name varchar2(100),
	price number(8),
	pictureurl varchar2(50),
	description varchar2(1000)
);

CREATE SEQUENCE PRODUCT_SEQ
	START WITH 1
	INCREMENT BY 1;
	
-- 트리거를 이용하여 자동으로 번호가 입력되도록
DROP SEQUENCE PRODUCT_SEQ;
CREATE OR REPLACE TRIGGER TRI_PRODUCT_CODE_AUTOSEQ
BEFORE INSERT ON PRODUCT
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.CODE IS NULL THEN 
		SELECT PRODUCT_SEQ.NEXTVAL INTO :NEW.CODE FROM DUAL;
	END IF;
END ;
DELETE FROM PRODUCT;

DROP TABLE PRODUCT;
DROP TRIGGER TRI_PRODUCT_CODE_AUTOSEQ; 
DROP SEQUENCE PRODUCT_SEQ;


---------------------------------------------------------
---11장, project name web-study-12
CREATE TABLE board(
	num number(5) PRIMARY KEY,
	pass VARCHAR2(30),
	name VARCHAR2(30),
	email VARCHAR2(30),
	title VARCHAR2(50),
	content VARCHAR2(1000),
	readcount NUMBER(4) DEFAULT 0,
	writedate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE BOARD_SEQ START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TRI_BOARD_NUM_AUTOSEQ
BEFORE INSERT ON BOARD
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.NUM IS NULL THEN 
		SELECT BOARD_SEQ.NEXTVAL INTO :NEW.NUM FROM DUAL;
	END IF;
END ;

--
INSERT INTO TRI_TEST VALUES(NULL, 'TEST');

SELECT * FROM TRI_TEST;

INSERT INTO TRI_TEST(TXT) VALUES('TEST2');
--