-- SELECT * from emp;
-- Select hiredate from emp where ename = 'ALLEN';
-- SELECT * from emp where HIREDATE>='01/01/81' and HIREDATE<='31/12/81';
-- SELECT ENAME,JOB , SAL*6 FROM EMP;
-- SELECT EMP.*, (SAL*12)+2000 FROM EMP;
-- SELECT ENAME,SAL, SAL*12+(SAL*12*10/100) FROM EMP;
-- SELECT ENAME,SAL, SAL+(SAL*10/100) FROM EMP;
-- SELECT ENAME, SAL-(SAL*25/100) FROM EMP;
-- SELECT ENAME, SAL+50 FROM EMP;
-- SELECT ENAME, SAL*12-(SAL*12*10/100) FROM EMP;
-- SELECT SAL,SAL+COALESCE(COMM,0) FROM EMP;
-- SELECT EMP.*, SAL*12 FROM EMP;
-- SELECT ENAME, JOB , SAL-100 FROM EMP;
-- SELECT SAL*12 FROM EMP WHERE ENAME='SMITH';
-- SELECT ENAME FROM EMP WHERE JOB = 'CLERK';
-- SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';
-- SELECT * FROM EMP WHERE SAL>2000;
-- SELECT * FROM EMP WHERE ENAME = 'JONES';
-- SELECT * FROM EMP WHERE HIREDATE>'01-01-81';
-- SELECT ENAME,SAL, SAL*12 ANNUAL_SALARY FROM EMP WHERE SAL*12>12000;
-- SELECT EMPNO FROM EMP WHERE DEPTNO=30;
-- SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE<'01-01-1981';
-- SELECT * FROM EMP WHERE JOB = 'MANAGER';
-- SELECT ENAME , SAL FROM EMP WHERE COMM=1400;
-- SELECT * FROM EMP WHERE COMM>SAL;
-- SELECT EMPNO FROM EMP WHERE HIREDATE<'01-01-87';
-- SELECT * FROM EMP WHERE JOB='ANALYST';
-- SELECT * FROM EMP WHERE SAL>2000;
-- SELECT ENAME, SAL*12 ANNUAL_SALARY FROM EMP WHERE (JOB='MANAGER' OR JOB='CLERK') AND (DEPTNO=10 OR DEPTNO=30);
-- SELECT EMP.*, SAL*12 ANNUAL_SALARY FROM EMP WHERE SAL BETWEEN 1000 AND 4000 AND (SAL*12>15000);
-- SELECT * FROM EMP WHERE DEPTNO != 10 AND DEPTNO !=30;
-- SELECT EMP.*, SAL*12 ANNUAL_SALARY FROM EMP WHERE JOB != 'ANALYST' AND JOB != 'MANAGER';
-- SELECT ENAME,SAL FROM EMP WHERE SAL IN (SELECT SAL FROM EMP GROUP BY SAL HAVING COUNT(*)>1);
-- SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) IN (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO));
-- set pages 100 lines 100;
-- SELECT ename,sal from emp where sal in (SELECT sal from (select sal,rownum as rn from (select sal from emp order by sal desc)) WHERE rn>6 and rownum=1);
-- SELECT * from tab;
-- create table customer (CID CHAR(2) PRIMARY KEY, CNAME VARCHAR(20) NOT NULL, CNO NUMBER(10) UNIQUE NOT NULL CHECK(LENGTH(CNO)=10));
-- CREATE TABLE PRODUCT (PID CHAR(3) PRIMARY KEY, PNAME VARCHAR(20) NOT NULL,PRICE NUMBER(7,2) NOT NULL CHECK(PRICE>0),TYPE VARCHAR(20) NOT NULL, CID CHAR(2) REFERENCES CUSTOMER(CID));
-- DESC CUSTOMER;
-- RENAME PRODUCT TO PRO;
-- ALTER TABLE PRO MODIFY COST NUMBER(5);
-- DESC PRO;
-- TRUNCATE TABLE PRO;
-- SELECT REVERSE('CHANDAN') FROM DUAL;
-- SELECT * FROM RECYCLEBIN;


-- CREATE TABLE JOBS(JOB_ID CHAR(3),JOB_TITLE VARCHAR(20),MIN_SALARY NUMBER(5),MAX_SALARY NUMBER(7));
-- ALTER TABLE JOBS MODIFY MAX_SALARY NUMBER(5) NOT NULL;
-- DESC JOBS;
-- CREATE TABLE REGIONS(REGION_ID CHAR(3), REGION_NAME VARCHAR(20));
-- ALTER TABLE REGIONS MODIFY REGION_NAME VARCHAR(20) NOT NULL;
-- DESC REGIONS;
-- CREATE TABLE COUNTRIES(COUNTRY_ID CHAR(3),COUNTRY_NAME VARCHAR(20),REGION_ID CHAR(3) REFERENCES REGIONS(REGION_ID));
-- ALTER TABLE COUNTRIES MODIFY REGION_ID CHAR(3) NOT NULL;
-- DESC COUNTRIES;
-- CREATE TABLE LOCATIONS(LOCATION_ID CHAR(3) PRIMARY KEY, STREET_ADDRESS VARCHAR(50) NOT NULL,POSTAL_CODE CHAR(6) NOT NULL,CITY VARCHAR(20) NOT NULL,STATE_PROVINCE VARCHAR(20) NOT NULL,COUNTRY_ID CHAR(3) NOT NULL);
-- CREATE TABLE DEPARTMENTS(DEPARTMENT_ID CHAR(3) PRIMARY KEY, DEPARTMENT_NAME VARCHAR(20) UNIQUE NOT NULL,MANAGER_ID CHAR(3) UNIQUE NOT NULL,LOCATION_ID CHAR(3) REFERENCES LOCATIONS(LOCATION_ID));
-- CREATE TABLE EMPLOYESS(EMPLOYEE_ID CHAR(3) PRIMARY KEY, FIRST_NAME VARCHAR(20) NOT NULL,LAST_NAME VARCHAR(20) NOT NULL,EMAIL VARCHAR(50) UNIQUE NOT NULL CHECK(EMAIL LIKE '%@%'), PHONE_NUMBER NUMBER(10) UNIQUE NOT NULL CHECK(LENGTH(PHONE_NUMBER)=10),HIRE_DATE DATE NOT NULL,JOB_ID CHAR(3) NOT NULL REFERENCES JOBS(JOB_ID),SALARY NUMBER(7) NOT NULL,COMMISSION_PCT NUMBER(7) NOT NULL,MANAGER_ID CHAR(3) NOT NULL,DEPARTMENT_ID CHAR(3) NOT NULL REFERENCES DEPARTMENTS(DEPARTMENT_ID));
-- RENAME EMPLOYESS TO EMPLOYEES;
-- CREATE TABLE JOB_HISTORY(EMPLOYEE_ID CHAR(3) NOT NULL REFERENCES EMPLOYEES(EMPLOYEE_ID),START_DATE DATE NOT NULL,END_DATE DATE NOT NULL,JOB_ID CHAR(3) NOT NULL REFERENCES JOBS(JOB_ID),DEPARTMENT_ID CHAR(3) NOT NULL REFERENCES DEPARTMENTS(DEPARTMENT_ID));
