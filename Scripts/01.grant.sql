-- 怨꾩젙 異붽� 諛� 沅뚰븳 遺��뿬

-- �젒�냽�옄 �솗�씤
SELECT USER FROM DUAL;

-- 怨꾩젙 �깮�꽦
DROP USER spring5 CASCADE;
CREATE USER spring5 IDENTIFIED BY rootroot;

-- 沅뚰븳 異붽�
GRANT CONNECT, RESOURCE, CREATE SYNONYM, CREATE VIEW 
   TO spring5;
   
-- 怨꾩젙 �솗�씤
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'spring5';