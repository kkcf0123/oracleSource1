CREATE TABLE emp(empno number);
INSERT INTO emp values(1);

CREATE  TABLE booktbl(
	CODE NUMBER(4)PRIMARY KEY,
	TITLE NVARCHAR2(50) NOT NULL,
	WRITER NVARCHAR2(10) NOT NULL,
	PRICE NUMBER(8) NOT NULL
);

ALTER TABLE "C##TEST2".BOOKTBL MODIFY PRICE NUMBER(8,0) NOT NULL;
ALTER TABLE "C##TEST2".BOOKTBL MODIFY CODE NUMBER(4,0);
ALTER TABLE "C##TEST2".BOOKTBL MODIFY WRITER NVARCHAR2(10);
ALTER TABLE "C##TEST2".BOOKTBL MODIFY TITLE NVARCHAR2(50);


INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1000, 'JAVA PROGRAMMING NOOBS', 'PARK', 28500);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1001, 'JAVA PROGRAMMING NOOBS1', 'PARK1', 28501);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1002, 'JAVA PROGRAMMING NOOBS2', 'PARK2', 28502);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1003, 'JAVA PROGRAMMING NOOBS3', 'PARK3', 28503);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1004, 'JAVA PROGRAMMING NOOBS4', 'PARK4', 28504);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1005, 'JAVA PROGRAMMING NOOBS5', 'PARK5', 28505);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)
VALUES(1006, 'JAVA PROGRAMMING NOOBS6', 'PARK6', 28506);

SELECT * FROM BOOKTBL WHERE CODE = 1000;
SELECT * FROM BOOKTBL WHERE WRITER = 'PARK1';
SELECT * FROM BOOKTBL WHERE PRICE  = 28506;

UPDATE BOOKTBL SET PRICE = 28500 WHERE CODE = 1000;
UPDATE BOOKTBL SET PRICE = 28501, TITLE = '' WHERE CODE = 1001;

DELETE FROM BOOKTBL b WHERE CODE = 1002;

CREATE  TABLE MEMBERTBL(
	USERID NVARCHAR2(20)PRIMARY KEY,
	PASSWORD NVARCHAR2(20) NOT NULL,
	NAME NVARCHAR2(10) NOT NULL,
	EMAIL NVARCHAR2(50) NOT NULL
);

INSERT INTO MEMBERTBL(USERID, PASSWORD, NAME, EMAIL) VALUES("HONG", "HONG", "HONG1", "HONG@NAVER.COM");


CREATE TABLE todotbl(
	NO NUMBER(8) PRIMARY KEY,
	title nvarchar2(100) NOT NULL,
	create_at DATE DEFAULT sysdate,
	completed char(1) DEFAULT '0',
	description nvarchar2(1000));
	
-- create sequence (todo_seq)
CREATE SEQUENCE todo_seq;

INSERT INTO TODOTBL (NO, TITLE, DESCRIPTION)
VALUES(todo_seq.nextval, '자바환경설정', '자바환경설정 및 정리');

SELECT * FROM TODOTBL t WHERE NO = 1; 
UPDATE TODOTBL SET COMPLETED = '1' WHERE NO=1;
UPDATE TODOTBL SET COMPLETED =?, DESCRIPTION =? WHERE NO = ?;

ALTER TABLE BOOKTBL ADD description nvarchar2(1000);


CREATE TABLE BOARDTBL(
	BNO NUMBER(4)PRIMARY KEY,
	NAME NVARCHAR2(10) NOT NULL,
	PASSWORD NVARCHAR2(20) NOT NULL,
	TITLE NVARCHAR2(20) NOT NULL,
	CONTENT NVARCHAR2(1000) NOT NULL,
	ATTACH NVARCHAR2(100),
	RE_REF NUMBER(8) NOT NULL,
	RE_LEV NUMBER(8) NOT NULL,
	RE_SEQ NUMBER(8) NOT NULL,
	READ_COUNT NUMBER(8) DEFAULT 0,
	REGDATE DATE DEFAULT SYSDATE);
	
CREATE SEQUENCE BOARD_SEQ;

ALTER TABLE "C##TEST2".BOARDTBL RENAME TO BOARD;

INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, ATTACH , RE_REF ,RE_LEV, RE_SEQ) VALUES(board_seq.nextval,'홍길동','12345','게시판 작성','게시판 작성', NULL, board_seq.currval, 0,0);
	
SELECT bno, TITLE, NAME, REGDATE, READ_COUNT FROM BOARD WHERE BNO = 1 ORDER BY BNO;

SELECT * FROM BOARD b WHERE title=? OR content = ? OR name = ? ORDER BY bno
SELECT BNO, NAME, PASSWORD , TITLE, CONTENT, ATTACH WHERE BNO =?
UPDATE  BOARD SET TITLE =?, description = ? WHERE PASSWORD =?
DELETE FROM BOARD WHERE BNO=? AND PASSWORD = ?;

-- subquery
INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, RE_REF ,RE_LEV, RE_SEQ) 
(SELECT board_seq.nextval, name, password, title, content, board_seq.currval, re_lev, re_seq FROM BOARD);

SELECT count(*) FROM BOARD b ;

-- 첫번째 댓글
-- re_ref:원본글 re_ref 번호
-- re_lev: 원본글 re_lev + 1
-- re_seq: 원본글 re_seq + 1
INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, attach, RE_REF ,RE_LEV, RE_SEQ)
VALUES(board_seq.nextval,'re:홍길동','re:12345','re:게시판 작성','re:게시판 작성', NULL, 710, 1, 1);

-- 두번째 댓글
-- re_seq : 댓글 정렬 시 낮을 수록 최신글
-- 기존 댓글의 re_seq 값 + 1 한 후에 insert
-- re_ref = 원본글의 re_ref and re_seq > 원본글의 re_seq값
UPDATE BOARD SET RE_SEQ = RE_SEQ + 1 WHERE RE_REF = 710 AND RE_SEQ > 0;
INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, attach, RE_REF ,RE_LEV, RE_SEQ)
VALUES(board_seq.nextval,'re:홍길동','re:12345','re:게시판 작성','re:게시판 작성', NULL, 710, 1, 1);

SELECT bno, title, name, REGDATE , READ_COUNT , RE_LEV  FROM BOARD b ORDER BY re_ref DESC, RE_SEQ asc;

-- paging
-- rownum
SELECT rownum, bno, title FROM BOARD b  ORDER BY bno DESC ;

-- subQuery
SELECT rownum, bno, title, name, regdate, read_count, re_lev
FROM (SELECT rownum, bno, title, name, regdate, read_count, re_lev
	FROM BOARD b WHERE bno > 0
	ORDER BY re_ref DESC, re_seq ASC)
	WHERE rownum <= 10;
	
SELECT rownum, bno, title, name, regdate, read_count, re_lev FROM (
	SELECT rownum AS rnum, A.*
	FROM (
		SELECT bno, title, name, regdate, read_count, re_lev
		FROM BOARD b WHERE bno > 0 AND title LIKE ?
		ORDER BY re_ref DESC, re_seq ASC) A
	WHERE rownum <= ?) 
WHERE rnum > ?;