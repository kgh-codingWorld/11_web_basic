/* 

	# SQL (Structured Query Language)
	
	- SQL(Structured Query Language)은 관계형 데이터베이스 관리 시스템(RDBMS)의 데이터를 관리하기 위해 설계된 특수 목적의 프로그래밍 언어이다. 	
	- 관계형 데이터베이스 관리 시스템에서 자료의 검색과 관리 , 데이터베이스 스키마 생성과 수정 , 데이터베이스 객체 접근 조정 관리를 위해 고안되었다. 		
	- 많은 수의 데이터베이스 관련 프로그램들이 SQL을 표준으로 채택하고 있다.		
	- 데이터베이스 언어 SQL 문법의 종류는 다음과 같이 구별된다.
	
		1) 데이터 정의 언어 (DDL : Data Definition Language)   		 Ex) CREATE , DROP , ALTER 
		2) 데이터 조작 언어 (DML : Data Manipulation Language) 		 Ex) SELECT , INSERT , UPDATE , DELETE 
		3) 데이터 제어 언어 (DCL : Data Control Language)	   		 Ex) GRANT , REVOKE
		4) 트랜잭션 제어 언어 (TCL : Transaction Control Language)   EX) COMMIT , ROLLBACK
		
*/
			
	
/*

	[ 데이터 베이스 생성 형식 ]

		- CREATE DATABASE DB_NAME;

		EX) CREATE DATABASE LMS;
			CREATE DATABASE PMS;
			CREATE DATABASE MMS;

*/	

CREATE DATABASE HRMS;

/*
	
    [ 데이터 베이스 사용 형식 ]
		
        1) USE DB_NAME; 쿼리문 사용
		2) 네비게이터 DB명 더블클릭
			
		EX) USE LMS;
			USE PMS;
			USE MMS;

*/

USE HRMS;

/*

	# 테이블 (table)
	
	- 테이블(table)은 데이터베이스에서 행(가로, row, record)과 열(세로, column, field)로 짜여진 표에 기록된 데이터의 집합이다. 

	[ 테이블 생성 형식 ]

	- CREATE TABLE TABLE_NAME(FIELD1 TYPE, FIELD2 TYPE , .....);
	- 테이블명은 복수형태가 아닌 단수형태로 작성한다.
	- 테이블명은 관용적으로 앞에 T , TB를 붙이기도 한다.
	- `역따옴표(백틱)를 사용하여 테이블이름 또는 컬럼 이름을 나타내기도 한다.
	
	   [ 데이터 타입 ] 
	
		1) 숫자
		 
			- TINYINT , INT , BIGINT , 등
		
		2) 실수
		
			- DOUBLE
		
		3) 문자열 
				
			3-1) CHAR(고정길이)
				
				- 고정길이 문자열 저장.
				- 최대 255Byte 저장 가능
				- 고정길이보다 작을경우 공백으로 채워서 저장
						
			3-2) VARCHAR(최대길이) 
				
				- 가변길이 문자열 저장.
				- 최대 255Byte 저장 가능
				- 최대길이보다 작을경우 해당만큼의 데이터만 저장
				
			3-3) TEXT (대용량)
				
        
        4) 불리언 : BOOLEAN
        	
        		- MySQL에서 BOOLEAN은 true  > 1 
        							  false > 0 으로 인식하여 사용
          
		5) 날짜  : DATE(날짜) , DATETIME(날짜+시간) , TIMESTAMP(날짜+시간) , 등
        
        
	   EX)
	   CREATE TABLE PRODUCT (
			PRODUCT_CD 		BIGINT,
			PRODUCT_NM 		VARCHAR(50),
			PRICE  			INT,
			DELIVERY_PRICE  INT,
			ENROLL_DT 		TIMESTAMP,
			ACTIVE_YN 		CHAR(1)
	   );
	   

	 	[ 자주 사용되는 컬럼명 축약어 ]
	 	
	 	1. CODE      > CD (ORDER_CD , ITEM_CD , PARTNER_CD , DEPT_CD)
	 	2. NAME      > NM (ORDER_NM , ITEM_NM , PARTNER_NM , DEPT_NM)
	 	3. DATE      > DT (JOIN_DT , REG_DT , START_DT , MODIFY_DT , ENROLL_DT)
	 	4. NUMBER    > NO (REPLY_NO , BOARD_NO , NOTICE_NO) 
	 	5. COUNT     > CNT (LOGIN_USER_CNT , CLIENT_CNT , MANAGER_CNT , EMPLOYEE_CNT)
	 	6. AMOUNT    > AMT (STOCK_AMT , RENTAL_FEE_AMT , PO_AMT)
	 	7. QUANTITY  > QTY (ORDER_QTY , PRODT_ORDER_QTY , ORDER_QTY_IN_BASE_UNIT , PROD_QTY_IN_ORDER_UNIT)
	 	8. FLAG      > FL (ENROLL_FL , ENROLL_FL , ENROLL_FL) 
	 	9. YES OR NO > YN (AGREE_YN)
 	
 */

CREATE TABLE EMPLOYEE(
	EMP_NO	 VARCHAR(7),
	FIRST_NM VARCHAR(30),
	LAST_NM  VARCHAR(30),
	GENDER 	 CHAR(1),
	HEIGHT 	 DOUBLE,
	WEIGHT 	 DOUBLE,
	HIRE_DT  DATE
);

CREATE TABLE TITLE(
	EMP_NO	CHAR(7),
	TITLE 	VARCHAR(100),
	FROM_DT DATE,
	TO_DT 	DATE
);

CREATE TABLE SALARY(
	EMP_NO 	CHAR(7),
	SALARY 	INT,
	FROM_DT DATE,
	TO_DT 	DATE
);

CREATE TABLE DEPT(
	DEPT_CD   INT,
	DEPT_NM   VARCHAR(100),
	CREATE_DT CHAR(10)
);


/*

	[ 테이블 관련 정보 확인 형식 ]
	
     1) DESC TABLE_NAME; 쿼리문 사용
     2) 네비게이터 테이블의 정보 단축 아이콘(i)을 클릭하면 편리하게 조회가능
    
    EX) DESC PRODUCT;
    	DESC MEMBER;
    	DESC `ORDER`;
    
*/ 

DESC EMPLOYEE;
DESC SALARY;
DESC TITLE;
DESC DEPT;

/*

	[ 테이블 수정 형식 ]
	
    - 컬럼 추가 , 컬럼 삭제 , 컬럼명 변경 , 테이블명 변경  , 
	  데이터 타입 변경 , 제약사항(키,초깃값,NULL,등등) 변경 등 테이블 관련 정보들을 수정할 수 있다.
    
    - 네비게이터 테이블의 수정 단축 아이콘(몽키스패너)을 클릭하면 편리하게 수정할 수 있다.
    
    - (마지막 컬럼추가)   ALTER TABLE 테이블명 ADD 컬럼명 타입 (제약사항);
    - (첫번째 컬럼추가)   ALTER TABLE 테이블명 ADD 컬럼명 타입 (제약사항) FIRST;
    - (N번째 컬럼추가)    ALTER TABLE 테이블명 ADD 컬럼명 타입 (제약사항) AFTER 앞 컬럼명;
    - (컬럼속성변경)      ALTER TABLE MODIFY 컬럼명 타입;
    - (컬럼이름,속성변경) ALTER TABLE CHANGE 기존컬럼명 새로운컬럼명 타입;
    - (테이블이름변경)    ALTER TABLE RENAME 테이블명;
    
    - (컬럼삭제) ALTER TABLE 테이블명 DROP 컬럼명;
    
    EX) ALTER TABLE `ORDER` ADD ORDER_QTY INT NOT NULL DEFAULT 1;
		ALTER TABLE `ORDER` ADD ORDER_DT DATE;
        ALTER TABLE `ORDER` MODIFY ORDER_DT TIMESTAMP DEFAULT NOW();
        ALTER TABLE `ORDER` CHANGE ORDER_DT ORDER_AT TIMESTAMP;
		ALTER TABLE PRODUCT DROP PUBLISHER_COMMENT;
        
*/ 

ALTER TABLE DEPT ADD MANAGER_CD VARCHAR(30);
ALTER TABLE DEPT MODIFY CREATE_DT VARCHAR(20);
ALTER TABLE DEPT CHANGE CREATE_DT CREATE_DATE DATE;
ALTER TABLE DEPT DROP CREATE_DATE;
ALTER TABLE DEPT RENAME DEPARTMENT;

/*
			
	[ 테이블 삭제 형식 ]
	- DROP TABLE TABLE_NAME;

	EX) DROP TABLE CART;
		DROP TABLE CONTACT;
        DROP TABLE MEMBER;

*/

DROP TABLE EMPLOYEE ;
DROP TABLE SALARY ;
DROP TABLE TITLE ;
DROP TABLE DEPARTMENT ;

/*
	
	[ 데이터 베이스 삭제 형식 ]
	- DROP DATABASE DB_NAME;
		
		EX) DROP DATABASE TEST_DB;
			DROP DATABASE LMS;
            DROP DATABASE PMS;
*/

DROP DATABASE HRMS;


