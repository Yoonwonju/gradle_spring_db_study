SELECT ID, EMAIL, PASSWORD, NAME, REGDATE FROM MEMBER;
SELECT ID, EMAIL, PASSWORD, NAME, REGDATE FROM MEMBER WHERE EMAIL = 'test@test.co.kr';
SELECT COUNT(*) FROM MEMBER;

INSERT INTO MEMBER(EMAIL, PASSWORD, NAME, REGDATE)
VALUES('test@test.co.kr', '1111', 'TEST', '2020-09-28');
INSERT INTO MEMBER(EMAIL, PASSWORD, NAME, REGDATE)
VALUES('test2@test.co.kr', '2222', 'TEST2', '2020-09-28');

UPDATE MEMBER
   SET EMAIL
 WHERE ID = ?;

UPDATE MEMBER
   SET NAME = ?, PASSWORD = ?
 WHERE EMAIL = ?;

DELETE FROM MEMBER WHERE EMAIL = ?;

--INSERT INTO DEPARTMENT VALUES(1, '영업', 1);
--INSERT INTO DEPARTMENT VALUES(2, '기획', 2);
--INSERT INTO DEPARTMENT VALUES(3, '개발', 3);
--
--
--INSERT INTO TITLE VALUES(1, '사장');
--INSERT INTO TITLE VALUES(2, '부장');
--INSERT INTO TITLE VALUES(3, '과장');
--INSERT INTO TITLE VALUES(4, '대리');
--INSERT INTO TITLE VALUES(5, '사원');	
--
--
----INSERT INTO EMPLOYEE VALUES (4377, '이성례', 1, NULL, 5000000, 2, sysdate);
----INSERT INTO EMPLOYEE VALUES (3426, '박영권', 3, 4377, 3000000, 1, sysdate);
----INSERT INTO EMPLOYEE VALUES (3011, '이수민', 2, 4377, 4000000, 3, sysdate);
----INSERT INTO EMPLOYEE VALUES (3427, '최종철', 5, 3011, 1500000, 3, sysdate);
----INSERT INTO EMPLOYEE VALUES (1003, '조민희', 3, 4377, 3000000, 2, sysdate);
----INSERT INTO EMPLOYEE VALUES (2106, '김창섭', 4, 1003, 2500000, 2, sysdate);
----INSERT INTO EMPLOYEE VALUES (1365, '김상원', 5, 3426, 1500000, 1, sysdate);
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(4377, '이성래', 1, NULL, 5000000, 2, 'test@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3426, '박영권', 3, 4377, 3000000, 1, 'test1@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3011, '이수민', 2, 4377, 4000000, 3, 'test2@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3427, '최종철', 5, 3011, 1500000, 3, 'test3@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1003, '조민희', 3, 4377, 3000000, 2, 'test4@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(2106, '김창섭', 4, 1003, 2500000, 2, 'test5@test.co.kr', '1234');
--INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1365, '김상원', 5, 3426, 1500000, 1, 'test6@test.co.kr', '1234');
--
----전화번호 추가
--UPDATE EMPLOYEE SET TEL = '010-123-1234'
-- WHERE PASSWD = '1234';
--	
--SELECT * FROM DEPARTMENT;
--SELECT * FROM TITLE;
--SELECT * FROM EMPLOYEE;
--
--
--
--
--
--
--------------------------------------------------------------------------------
--INSERT INTO PRODUCT VALUES(NULL, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'db.jpg', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');
--
--INSERT INTO PRODUCT(CODE,NAME,PRICE,PICTUREURL,DESCRIPTION) VALUES(NULL, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'DB.JPG', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');
--
--INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'DB.JPG', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');
--INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '웹표준을 위한 HTML5', 25000, 'HTML5.JPG', 'HTML5 가이드북. 홈페이지 제작을 위한 필수 선택 HTML 기본 문법...');
--INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, 'DYNAMIC PROGRAMMING BOOK 시리즈-01 오라클 11G + PL/SQL', 25000, 'ORACLE.JPG','DYNAMIC 실무 코칭 프로그래밍 BOOK의 첫번째 책으로, 오라클 11G의 새로운 ...');
--INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, 'VISUAL C++ MFC 윈도우 프로그래밍', 26000, 'MFC.JPG', 'VISUAL C++를 처음 시작하는 독자의 눈높이에 맞춘 VISUAL C++...');
--INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, 'JQUERY AND JQUERY MOBILE : 이해하기 쉽게 풀어쓴', 25000, 'JQUERY.JPG', '소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도 ...');
--
--INSERT INTO PRODUCT VALUES(7, 'JSP & SERVLET BOOK!!!', 500000, 'JSP.JPG', 'JSP와 SERVLET 기초 수업');
--
--UPDATE EMPLOYEE 
--   SET TEL = '053-1111-1111';
--   
--SELECT * FROM PRODUCT;
--
--------------------------------
-----11장, project name web-study-12
--
--
--INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
--VALUES('1234', '성윤정', 'TEST@TEST.CO.KR', '첫방문', '반갑습니다.', '0', '2020-01-14');
--
--SELECT * FROM BOARD;
--
--INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
--VALUES('1234', '아이유', 'TEST1@TEST.CO.KR', '첫방문1', '반갑습니다.1', '0', '2020-02-14');
--INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
--VALUES('1234', '박규영', 'TEST2@TEST.CO.KR', '첫방문2', '반갑습니다.2', '0', '2020-03-14');
--INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
--VALUES('1234', '이유영', 'TEST3@TEST.CO.KR', '첫방문3', '반갑습니다.3', '0', '2020-04-14');
