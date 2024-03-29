	REPLACE()
--scott

--SELECT 
SELECT * FROM EMP e;
SELECT * FROM DEPT d

SELECT
	EMPNO,
	ENAME,
	JOB
FROM
	emp;

SELECT
	EMPNO,
	MGR,
	DEPTNO
FROM
	emp;
	
SELECT DISTINCT deptno FROM EMP e ;
SELECT empno as 사원번호, MGR 매니저번호, deptno "부서 번호" FROM EMP e ;

SELECT EMPNO, SAL, SAL * 12 + COMM AS 연봉 FROM EMP e ;

SELECT * FROM EMP ORDER BY SAL DESC ;
SELECT * FROM EMP ORDER BY SAL ASC ;
SELECT empno, ename, sal FROM EMP ORDER BY EMPNO DESC ;

SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC ;
SELECT * FROM EMP ORDER BY DEPTNO, SAL DESC ;

SELECT * FROM EMP e WHERE DEPTNO = 30 OR SAL >= 1000;
SELECT * FROM EMP e WHERE DEPTNO = 30;
SELECT * FROM EMP e WHERE SAL >= 1000;
SELECT * FROM EMP e WHERE SAL >= 1000 ORDER BY SAL  DESC;

SELECT * FROM EMP e WHERE EMPNO = 7782;

SELECT  * FROM EMP e  WHERE DEPTNO = 30 AND JOB ='SALESMAN';

SELECT * FROM EMP e  WHERE EMPNO = 7499 AND DEPTNO = 30;
SELECT * FROM EMP e  WHERE DEPTNO = 30 OR JOB = 'SALESMAN';

SELECT * FROM EMP e WHERE ENAME >= 'F';

SELECT * FROM EMP e WHERE SAL != 3000;
SELECT * FROM EMP e WHERE SAL <> 3000;
SELECT * FROM EMP e  WHERE SAL ^= 3000;

SELECT * FROM EMP e  WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- in
SELECT * FROM EMP e  WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT  * FROM EMP e WHERE HIREDATE > '1981-10-31';

SELECT  * FROM EMP  WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP e WHERE ENAME LIKE 'S%';
SELECT * FROM EMP e WHERE ENAME LIKE '_L%';

SELECT * FROM EMP e WHERE ENAME LIKE '%AM%';

SELECT  * FROM EMP e WHERE COMM IS NULL ;

SELECT * FROM EMP e WHERE MGR  IS NULL ;
SELECT * FROM EMP e WHERE MGR  IS NOT NULL ;

SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10;
SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 20;

SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10
UNION 
SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 20;


SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10
UNION 
SELECT ename, empno, sal, deptno FROM EMP e WHERE DEPTNO = 20;

SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10
UNION ALL 
SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 20;

SELECT empno, ename, sal, deptno FROM EMP 
MINUS 
SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10;

SELECT empno, ename, sal, deptno FROM EMP 
INTERSECT  
SELECT empno, ename, sal, deptno FROM EMP e WHERE DEPTNO = 10;

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)  FROM EMP e ;

SELECT * FROM EMP e WHERE ENAME = UPPER('clark');
SELECT * FROM EMP e WHERE LOWER(ENAME)= 'clark';

SELECT ENAME, LENGTH (EName) FROM EMP e ;

SELECT LENGTH ('한글') FROM DUAL ;

SELECT ENAME, LENGTHB (EName) FROM EMP e ;

SELECT LENGTH ('한글'), LENGTHB('한글')  FROM DUAL ;

SELECT * FROM EMP e WHERE LENGTH(ENAME) >= 6;

SELECT job, SUBSTR(job,1,2),SUBSTR(job,3,2), SUBSTR(job,5)  FROM EMP e ;
SELECT job, SUBSTR(job,-1,2),SUBSTR(job,-3,2), SUBSTR(job,-5)  FROM EMP e ;

SELECT
	INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
	INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2,
	INSTR('HELLO, ORACLE!', 'L',2 ,2) AS INSTR_3
FROM
	DUAL; 

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 FROM DUAL ; 

SELECT * FROM EMP e  WHERE INSTR(ENAME, 'S') > 0;
SELECT
	'010-1234-5678' AS REPLACE_BEFORE,
	REPLACE('010-1234-5678', '-', '') AS REPLACE_1,
	REPLACE('010-1234-5678', '-') AS REPLACE_2,
	REPLACE('010-1234-5678', '-', ' ') AS REPLACE_3
FROM
	DUAL;
	
SELECT CONCAT(EMPNO,ENAME), CONCAT(EMPNO,ENAME,JOB) FROM EMP e WHERE ENAME ='SCOTT';
SELECT CONCAT(EMPNO,ENAME) FROM EMP e WHERE ENAME ='SMITH';

SELECT '['|| ' __Oracle__ ' ||']' AS trimBefore, 
'['|| TRIM(' __Oracle__ ')||']' AS trim FROM DUAL ;

SELECT '['|| ' __Oracle__ ' ||']' AS trimBefore, 
'['|| TRIM(LEADING '_' FROM '__Oracle__')||']' AS trim_leading,
'['|| TRIM(LEADING '_' FROM '__Oracle__')||']' AS trim_both
FROM DUAL ;

SELECT ROUND(1234.5678) AS ROUND,
ROUND(1234.5678, 0) AS ROUND1,
ROUND(1234.5678, 1) AS ROUND2,
ROUND(1234.5678, 2) AS ROUND3,
ROUND(1234.5678, -1) AS ROUND_minus1,
ROUND(1234.5678, -2) AS ROUND_minus2
FROM DUAL ;


SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC0,
TRUNC(1234.5678, 1) AS TRUNC1,
TRUNC(1234.5678, 2) AS TRUNC2,
TRUNC(1234.5678, -1) AS TRUNC_minus1,
TRUNC(1234.5678, -2) AS TRUNC_minus2
FROM DUAL;

--ceil, floor
SELECT
	CEIL (3.14),
	FLOOR(3.14),
	CEIL (-3.14),
	FLOOR(-3.14)
FROM
	DUAL ;

--mod
SELECT 11/5, MOD (11,5) FROM DUAL ;

--date
SELECT SYSDATE , CURRENT_DATE , CURRENT_TIMESTAMP  FROM DUAL ;
SELECT SYSDATE , SYSDATE + 1, SYSDATE -1 FROM DUAL;
SELECT SYSDATE , ADD_MONTHS(SYSDATE,3) FROM DUAL ;

SELECT
	EMPNO ,
	ENAME ,
	HIREDATE ,
	ADD_MONTHS(HIREDATE, 360)
FROM
	EMP e;

SELECT
	EMPNO ,
	ENAME ,
	HIREDATE ,
	SYSDATE ,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS month1,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS month2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS month3
FROM
	EMP e ;

SELECT SYSDATE , NEXT_DAY(SYSDATE, '월요일') , LAST_DAY(SYSDATE) FROM dual;

-- data type
SELECT EMPNO , ENAME , EMPNO + '500' FROM EMP e WHERE ENAME = 'FORD';
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE , TO_CHAR(SYSDATE, 'YY/MM/DD HH:MI:SS AM') FROM DUAL ;

SELECT 1300 -'1500', '1300' + 1500 FROM DUAL ;

SELECT TO_NUMBER('1,300','999,999') + TO_NUMBER('1,500','999,999') FROM DUAL ;
SELECT TO_CHAR(sal, '999,999.00') AS sal1 , TO_CHAR(sal, '000,999,999.00')AS SAL2 FROM EMP e ;

SELECT TO_DATE('2024-01-24') AS today1, TO_DATE('20240124') AS today2 FROM DUAL  ;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31') FROM DUAL ;

SELECT EMPNO , ENAME , sal, COMM , SAL + COMM  FROM EMP e;

SELECT EMPNO , ENAME , sal, COMM ,  SAL + NVL( COMM , 0 ) FROM EMP e;

SELECT EMPNO , ENAME , sal, COMM , NVL2( COMM , 'O','X' ) FROM EMP e;

SELECT EMPNO , ENAME , sal, COMM , NVL2(COMM, SAL *12 + COMM, SAL * 12 ) AS vnl FROM EMP e;

--decode / case
SELECT empno, ENAME , job, sal, DECODE(JOB, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05, 'ANALYST', sal , sal * 1.03 )  FROM EMP e;

SELECT
	empno,
	ENAME ,
	job,
	sal, CASE
		JOB WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN sal * 1.05
		WHEN 'ANALYST' THEN SAL * 1
		ELSE sal * 1.03
	END AS UPSAL2,
	DECODE(JOB, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05, 'ANALYST', sal , sal * 1.03 ) AS UPSAL
FROM
	EMP e ;
	
SELECT
	EMPNO,
	ENAME,
	COMM,
	CASE
		WHEN COMM IS NULL THEN '해당없음'
		WHEN COMM = 0 THEN '수당없음'
		WHEN COMM > 0 THEN '수당' || COMM
	END AS COMM_TEXT
FROM
	EMP e ;
	

SELECT
	EMPNO ,
	ENAME,
	SAL,
	TRUNC(SAL / 21.5, 2) AS DAY_PAY ,
	ROUND((SAL / 21.5)/ 8, 1) AS TIME_PAY
FROM
	EMP e
ORDER BY
	EMPNO ASC ;

SELECT
	EMPNO ,
	ENAME ,
	TO_CHAR(HIREDATE,'YYYY/MM/DD')AS HIREDATE ,
	TO_CHAR(ADD_MONTHS(NEXT_DAY(HIREDATE, '월요일'), 3), 'YYYY/MM/DD') AS R_JOB,
	CASE
		WHEN COMM IS NOT NULL THEN COMM
		WHEN COMM = 0 THEN NULL
	END AS COMM
FROM
	EMP e ;
	
SELECT
	EMPNO ,
	ENAME,
	MGR,
	CASE
		WHEN MGR IS NULL THEN '0000'
		WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '75' THEN '5555'
		WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '76' THEN '6666'
		WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '77' THEN '7777'
		WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '78' THEN '8888'
		ELSE TO_CHAR(MGR)
		END AS CHG_MGR,
		DECODE(SUBSTR(TO_CHAR(MGR), 1, 2), NULL, '0000', '75','5555','76','6666','77','7777','78','8888',SUBSTR(TO_CHAR(MGR), 1)) AS CHG_MGR1
FROM
	EMP e ;

SELECT
	EMPNO ,
	ENAME,
	MGR,
	CASE SUBSTR(TO_CHAR(NVL(MGR, 0))1, 2)
		WHEN '00' THEN '0000'
		WHEN '75' THEN '5555'
		WHEN '76' THEN '6666'
		WHEN '77' THEN '7777'
		WHEN '78' THEN '8888'
		ELSE TO_CHAR(MGR)
	END AS CHG_MGR
FROM
	EMP e ;
	
SELECT SUM(SAL), AVG(SAL), COUNT(SAL), MAX(SAL), MIN(SAL)  FROM EMP e;
SELECT SUM(DISTINCT SAL) FROM EMP e ;
SELECT  COUNT(*) FROM EMP e ;
SELECT COUNT(*) FROM EMP e WHERE DEPTNO = 30;
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30;
SELECT MAX(HIREDATE) FROM EMP e WHERE DEPTNO = 20;
SELECT AVG(DISTINCT SAL) FROM EMP e WHERE DEPTNO = 30;

SELECT '10' AS DEPTNO, SUM(SAL) FROM EMP e WHERE DEPTNO = 10
UNION 
SELECT '20' AS DEPTNO, SUM(SAL) FROM EMP e WHERE DEPTNO = 20
UNION 
SELECT '30' AS DEPTNO, SUM(SAL) FROM EMP e WHERE DEPTNO = 30;

--SELECT COLUMN 
--FROM TABLE
--WHERE CONDITION 
--GROUP BY COLUMN 
--ORDER BY CONDITION 

SELECT DEPTNO , SUM(SAL) FROM EMP e GROUP BY DEPTNO;
SELECT DEPTNO , AVG(SAL) FROM EMP e GROUP BY DEPTNO;
SELECT DEPTNO , JOB, AVG(SAL) FROM EMP e GROUP BY DEPTNO, JOB ORDER BY DEPTNO;

SELECT DEPTNO, COUNT(DISTINCT DEPTNO) FROM EMP e GROUP BY DEPTNO ORDER BY DEPTNO ;

SELECT DEPTNO, JOB, AVG(SAL) FROM EMP e GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 500 ORDER BY DEPTNO , JOB ;

SELECT DEPTNO, JOB, AVG(SAL) FROM EMP e WHERE SAL <= 3000 GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO , JOB ;

SELECT JOB , COUNT(JOB) FROM EMP e GROUP BY JOB HAVING COUNT(JOB) >= 3 ;

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) FROM EMP e GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO ORDER BY DEPTNO ;

-- JOIN
SELECT * FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO;
SELECT ename, sal, e.DEPTNO , DNAME ,LOC  FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO;
SELECT ename, sal, e.DEPTNO , DNAME ,LOC  FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND e.SAL >=3000;
SELECT * FROM EMP e,SALGRADE s WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL ;
SELECT e.empno, e.ename, e.mgr, e2.ENAME  AS mgr_name FROM EMP e , EMP e2 WHERE e.mgr = e2.EMPNO ;

SELECT e.empno, e.ename, e.mgr, e2.ENAME  AS mgr_name FROM EMP e RIGHT OUTER JOIN EMP e2 on e.MGR = e2.EMPNO ;

SELECT empno, ename, sal, d.DEPTNO , DNAME , LOC  FROM EMP e , DEPT d WHERE sal <= 2500 AND empno <= 9999; 
SELECT empno, ename, job, mgr, HIREDATE , sal, comm, DEPTNO, s.grade, s.LOSAL , s.HISAL  FROM EMP e , SALGRADE s  ;

SELECT DEPTNO, DNAME , empno, ename, e.SAL  FROM EMP e NATURAL JOIN  DEPT d WHERE e.SAL > 2000 ORDER BY DEPTNO asc;

SELECT e.DEPTNO, DNAME , TRUNC(AVG(e.SAL)) AS AVG_SAL, max(e.SAL) AS MAX_SAL, MIN(e.SAL) AS MIN_SAL, COUNT(*)  FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO GROUP BY e.DEPTNO ,DNAME ORDER BY DEPTNO ;
SELECT DEPTNO, DNAME , TRUNC(AVG(e.SAL)) AS AVG_SAL, max(e.SAL) AS MAX_SAL, MIN(e.SAL) AS MIN_SAL, COUNT(*)  FROM EMP e NATURAL JOIN DEPT d GROUP BY DEPTNO, DNAME ORDER BY DEPTNO ;

SELECT
	*
FROM
	EMP e1
JOIN EMP e2 ON
	e1.empno = e2.EMPNO
JOIN EMP e3 ON
	e1.empno = e3.EMPNO;

SELECT d.DEPTNO , dname, empno, ename, job, sal FROM DEPT d JOIN EMP e ON d.DEPTNO = e.DEPTNO ;
SELECT DEPTNO , dname, empno, ename, job, sal FROM DEPT d NATURAL JOIN EMP e ;
SELECT d.DEPTNO , dname, empno, ename, job, sal FROM DEPT d LEFT OUTER JOIN EMP e ON d.DEPTNO = e.DEPTNO ORDER BY DEPTNO ;
SELECT d.DEPTNO , dname, empno, ename, job, sal FROM DEPT d RIGHT OUTER JOIN EMP e ON d.DEPTNO = e.DEPTNO ORDER BY DEPTNO ;

SELECT DEPTNO, DNAME , e.EMPNO, e.ENAME , e.JOB , e.SAL  FROM EMP e NATURAL JOIN DEPT d ORDER BY DNAME asc;
SELECT d.DEPTNO , DNAME , e.EMPNO , e.MGR , e.SAL, s.LOSAL ,s.HISAL , s.GRADE  FROM EMP e , EMP e2 ,DEPT d, SALGRADE s WHERE e.MGR = e2.EMPNO ;
SELECT
	d.DEPTNO,
	dname,
	empno,
	ename,
	mgr,
	sal,
	e.DEPTNO AS DEPTNO1,
	s.GRADE ,
	s.LOSAL ,
	s.HISAL
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	d.DEPTNO = e.DEPTNO
LEFT OUTER JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY
	d.DNAME ;

select COMM ,EMPNO, ENAME  from EMP WHERE COMM > (select COMM  from EMP WHERE ENAME = 'ALLEN');
select HIREDATE , EMPNO ,ENAME  from EMP e WHERE e.HIREDATE <(select HIREDATE from EMP e2 WHERE ENAME ='WARD');

select e.ename, e.sal, e.DEPTNO , d.DNAME from EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO WHERE e.DEPTNO = 20 AND e.SAL  > (select avg(sal) from EMP e2);

select job, EMPNO ,ENAME , e.DEPTNO, SAL, d.DNAME  from EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO WHERE JOB = (SELECT e.job from EMP e WHERE ENAME='ALLEN');


SELECT
	e.EMPNO,
	e.ENAME,
	d.DNAME,
	TO_CHAR(e.HIREDATE) AS hiredate,
	d.LOC ,
	e.SAL ,
	s.grade
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
WHERE
	e.SAL > (
	SELECT
		avg(e.SAL)
	FROM
		EMP e)
ORDER BY
	e.sal DESC, e.EMPNO ASC ;

SELECT
	*
FROM
	(SELECT * FROM EMP e WHERE deptno = 10) E10,
	(SELECT	* FROM	DEPT ) D
WHERE
	e10.deptno = d.deptno;

select EMPNO, ename, job, sal, (SELECT grade FROM SALGRADE s WHERE e.SAL BETWEEN s.losal AND s.hisal) AS grade from EMP e ;

-- create
CREATE TABLE DEPT_TEMP as ( SELECT * FROM DEPT);

CREATE TABLE EMP_TEMP as ( SELECT * FROM EMP);

CREATE TABLE EMP_TEMP2 as SELECT * FROM EMP WHERE 1<>1;

-- insert

INSERT INTO DEPT_TEMP values(70, 'DATABASE', 'BUSAN');

INSERT INTO DEPT_TEMP values(70, 'DATABASE');

INSERT INTO DEPT_TEMP(DEPTNO, DNAME) values(70, 'DATABASE');

INSERT INTO DEPT_TEMP dt (deptno, dname, loc) VALUES (90, 'database', NULL):

INSERT INTO EMP_TEMP et (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(8000, 'HONG', 'MANAGER', 7902, '2015-03-15', 1000, NULL, 50);

INSERT INTO EMP_TEMP et (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(9000, 'SUNG', 'MANAGER', 7782, SYSDATE, 1200, 800, 50);

-- update
UPDATE DEPT_TEMP SET LOC = 'BUSAN';
UPDATE DEPT_TEMP SET LOC = 'SEOUL' WHERE DEPTNO = 50;
UPDATE DEPT_TEMP SET LOC = 'SEOUL', DNAME = 'NETWORK' WHERE DEPTNO = 40;

-- delete
DELETE dept_temp WHERE deptno = 20;
DELETE FROM DEPT_TEMP dt  WHERE deptno = 30;

-- subquery + delete
select * from EMP_TEMP et ;
DELETE
FROM
	EMP_TEMP et
WHERE
	empno IN (
	SELECT
		empno
	FROM
		EMP_TEMP et
	JOIN SALGRADE s ON
		et.sal BETWEEN s.losal AND s.hisal AND s.grade = 3 AND et.deptno=30)
		;
		
UPDATE DEPT_TEMP SET (DNAME, LOC) = (SELECT Dname, loc FROM DEPT d WHERE deptno = 40)
WHERE DEPTNO = 40;

INSERT INTO EMP_TEMP et (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E1.EMPNO,E1.ename, E1.job, E1.MGR ,E1.HIREDATE, E1.SAL, E1.COMM, E1.DEPTNO
FROM EMP E1 JOIN SALGRADE s ON E1.sal BETWEEN s.losal AND s.hisal AND s.grade = 1;

CREATE TABLE EXAM_EMP as SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT as SELECT * FROM DEPT d ;
CREATE TABLE EXAM_SALGRADE as SELECT * FROM SALGRADE s  ;

INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO EXAM_EMP ee (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(7201, 'TEST_USER8', 'STUDENT', 7201, '2018-03-08', 1200, NULL, 80);
COMMIT;

UPDATE EXAM_EMP SET EMPNO = 7208 WHERE ename = 'TEST_USER8';

UPDATE
	EXAM_EMP
SET
	DEPTNO = 70
WHERE
	SAL > (
	SELECT
		AVG(sal)
	FROM
		EXAM_EMP ee
	WHERE
		DEPTNO = 50);

UPDATE
	EXAM_EMP
SET
	sal = sal * 1.1,
	DEPTNO = 80
WHERE
	HIREDATE > (
	SELECT
		min(HIREDATE)
	FROM
		EXAM_EMP ee
	WHERE
		deptno = 50);

DELETE
FROM
	EXAM_EMP ee
WHERE
	empno IN (
	SELECT
		empno
	FROM
		EXAM_EMP ee ,
		SALGRADE s
	WHERE
		sal BETWEEN losal AND hisal
		AND grade = 5);

	
INSERT INTO DEPT_TEMP dt VALUES (55, 'NETWORKS', 'SEOUL');
UPDATE DEPT_TEMP  SET LOC = 'BUSAN' WHERE DEPTNO = 55; 
-- IF DONT HAVE ERROR IN THIS LINE,
COMMIT;

ROLLBACK;
SELECT  * FROM DEPT_TEMP dt ;
DELETE FROM DEPT_TEMP dt WHERE deptno=55;
UPDATE DEPT_TEMP SET DNAME ='WEB' WHERE deptno = 10;
COMMIT;
	

-- ----------------------------------------------------
--CREATE TABLE_NAME(FILED_NAME TYPE CONDITION) 
-- 열 이름 규칙

-- STRING으로 작성 / 30BYTE 이내 / NAME 중복 불가
-- 문자, 숫자, 특문
-- SQL COMMAND는 NAME 불가

CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10),
	JOB VARCHAR2(10),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
);

SELECT * FROM EMP_DDL;
-- EMP테이블 복사해서 EXAM EMP 만듦
CREATE TABLE EXAM_EMP1 AS SELECT * FROM EMP;
-- 빈깡통
CREATE TABLE EXAM_EMP2 AS SELECT * FROM EMP WHERE 1<>1;

-- ALTER - ADD(TABLE) RENAME(COL NAME) MODIFY(DATATYPE)
ALTER TABLE EMP_DDL ADD HP VARCHAR2(15);
-- HP -> MOBILE
ALTER TABLE EMP_DDL RENAME COLUMN HP TO MOBILE;

ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

-- ALTER DROP
ALTER TABLE EMP_DDL DROP COLUMN MOBILE;

RENAME EMP_DDL TO EMP_ALTER;
SELECT * FROM EMP_ALTER;

-- CREATE ALTER DROP
DROP TABLE EMP_ALTER ;
CREATE VIEW VM_EMP20 AS(SELECT * FROM EMP WHERE DEPTNO=20);
SELECT * FROM VM_EMP20;
INSERT INTO VM_EMP20
VALUES(8888,'HONG', 'ANALYST', 7902, SYSDATE, 2500, NULL, 20);

CREATE VIEW VM_EMP30 AS(SELECT * FROM EMP WHERE DEPTNO=30) WITH READ ONLY;
SELECT USER_UPDATABLE_COLUMNS WHERE TABLE_NAME = 'VM_EMP30';


DROP VIEW VM_EMP20;
