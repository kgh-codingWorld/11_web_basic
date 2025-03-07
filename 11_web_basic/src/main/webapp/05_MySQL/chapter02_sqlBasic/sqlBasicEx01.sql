/*

	# 데이터 조작어 (DML : Data Manipulation Language) 
	
		[ SELECT문 ] 
	
		- 테이블에 저장되어 있는 데이터를 조회하거나 검색하기 위한 명령어
		
		
		[ 레코드 출력 형식 ]
	    
	   - SELECT  컬럼명1, 컬럼명2, ...  
	   	  FROM 테이블명 
	   	  
	   - SELECT  	컬럼명1, 컬럼명2, ...  
	   	 FROM 		테이블명
	   	 WHERE 	    조건절
	   	 GROUP BY   그룹컬럼명
	   	 HAVING 	그룹핑 조건절
	   	 ORDER BY   정렬방식
	   	 LIMIT	    출력 개수 지정
	   	 
	   	 
	   [ SELECT문의 실행 순서 ]
	   
	   - FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY > LIMIT
	   	 
	   	  
	
	   EX)
	   
		   1) 전체 컬럼 조회
		   SELECT  
					* 
		   FROM 
					MEMBER;
		   
		   2) 특정 컬럼 조회
		   SELECT 
					NO,
					NAME 
		   FROM 
					MEMBER;

*/

CREATE DATABASE SQL_BASIC;
USE SQL_BASIC;

CREATE TABLE SELECT_EX (	
	PRODUCT_CD 		VARCHAR(20),
	PRODUCT_NM 		VARCHAR(100),
	PRICE			INT,
	REG_DT			TIMESTAMP
);


# 실습을 위한 데이터 셋팅 예시
INSERT INTO SELECT_EX VALUES ('P10001' , '게이밍마우스패드' , 24850 , '2020-02-11'),
						     ('P10002' , '조립 PC' , 1000000 , '2020-06-30'),
						     ('P10003' , '브리츠 2채널 스피커' , 30750 , '2020-08-08'),
						     ('P10004' , '기계식키보드 화이트(청축)', 38150 , '2020-12-30'),
						     ('P10005' , '기계식키보드 화이트(적축)', 38150 , '2020-12-30'),
						     ('P10006' , '기계식키보드 화이트(갈축)', 38150 , '2020-12-30'),
						     ('P10007' , '기계식키보드 화이트(흑축)', 95450 , '2020-12-30'),
						     ('P10008' , 'USB 8GB', 2870 , '2021-01-07'),
						     ('P10009' , 'USB 16GB' , 3510 , '2021-06-27'),
						     ('P10010' , 'USB 32GB' , 5100 , '2021-09-20'),
						     ('P10011' , 'USB 64GB' , 6200 , '2021-09-20'),
						     ('P10012' , 'USB 128GB' , 11400 , '2021-09-20'),
						     ('P10013' , '허브 USB' , 14900 , '2021-12-20'),
						     ('P10014' , '멀티탭 USB' , 10600 , '2021-12-20'),
						     ('P10015' , '연장케이블 USB' , 4950 , '2021-12-20');
						   
# 예시 1) 전체 컬럼 조회
SELECT * FROM SELECT_EX;

SELECT *
FROM   SELECT_EX;

SELECT 
		*
FROM 
		SELECT_EX;

# 예시 2) PRODUCT_CD 컬럼만 조회
SELECT PRODUCT_CD
FROM   SELECT_EX;
		
# 예시 3) PRODUCT_CD , PRODUCT_NM 컬럼만 조회	
SELECT PRODUCT_CD , PRODUCT_NM
FROM   SELECT_EX;
		
# 예시 4) PRODUCT_CD , PRODUCT_NM , PRICE컬럼만 조회	  
SELECT PRODUCT_CD , PRODUCT_NM , PRICE
FROM   SELECT_EX;
		
# 예시 5) PRODUCT_CD , PRODUCT_NM , PRICE , REG_DT 컬럼만 조회	
SELECT PRODUCT_CD , PRODUCT_NM , PRICE , REG_DT
FROM   SELECT_EX;

SELECT *
FROM   SELECT_EX;
		
# 예시 6) 컬럼을 적는 순서에 따라 출력되는 순서가 달라진다.
SELECT REG_DT , PRICE , PRODUCT_NM , PRODUCT_CD
FROM   SELECT_EX;
		
# 예시 7) 테이블에 존재하지 않는 연산 데이터를 조회 할 수 있다. AS 키워드로 별칭을 지정할 수 있으며 별칭은 생략할 수 있다.
SELECT PRICE ,
	   PRICE * 0.1 			AS ADDITIONAL_TEXT, #ALIAS(별명, 별칭)
	   PRICE + PRICE * 0.1	TOTAL_PRICE #AS 키워드는 생략 가능
FROM   SELECT_EX;

/*
	
	# 비교 연산자

		>   	 : 크다.
		<   	 : 작다.
		>=  	 : 크거나 같다.
		<=  	 : 작거나 같다. 
		=   	 : 같다.    		(! 자바의 == 연산자와 다르다.)
		<> , !=  : 다르다.


	- (중요)문자열 및 날짜 데이터도 대소동등 비교 연산이 가능하다.
	- 자바의 조건식과 같이 WHERE 뒤에 조건식에 해당하는 데이터를 조회할 수 있다.

*/


# 예시 8) 가격이 10000원 이하의 상품 전체 컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRICE <= 10000;
		
# 예시 9) 가격이 10000원 초과의 상품 전체 컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRICE > 10000;
		
# 예시 10) 상품코드가 'P10001'인 상품 전체 컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRODUCT_CD = 'P10001';
		
# 예시 11) 상품코드가 'P10001'이 아닌 상품 전체 컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRODUCT_CD != 'P10001';
			
# 예시 12) 상품등록 날짜가 2021년 이후부터의 상품의 전체 컬럼 조회		
SELECT *
FROM   SELECT_EX
WHERE  REG_DT >= '2021-01-01';
		
		
/*

	# DISTINCT 
	
		- 중복을 제거한 값을 컬럼을 조회한다.
		

*/

# 예시 13) 상품등록 날짜를 중복을 제거하여 조회
SELECT REG_DT
FROM   SELECT_EX;
		
SELECT DISTINCT REG_DT
FROM   SELECT_EX;

/*

	# 논리연산자 ( and , or , not )
	
		- 자바와 같다.
		- not > and > or 의 연산 순위를 가진다.

*/

# 예시 14) 상품코드가 'P10001' , 'P10003' , 'P10005'인 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRODUCT_CD = 'P10001'
OR     PRODUCT_CD = 'P10003'
OR 	   PRODUCT_CD = 'P10005';		

# 예시 15) 상품가격이 20000 ~ 50000인 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRICE >= 20000 AND PRICE <= 50000; 
		
# 예시 16) 상품가격이 20000 ~ 50000이 아닌 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  NOT (PRICE >= 20000 AND PRICE <= 50000); 
		
# 예시 17) 상품가격이 20000 ~ 50000이면서 2021년도 등록상품의 전체컬럼 조회		
SELECT * 
FROM   SELECT_EX
WHERE  (PRICE >= 20000 AND PRICE <= 50000)
AND    (REG_DT >= '2020-01-01' AND REG_DT <= '2020-12-31');
		
# 예시 18) 상품 등록날짜가 2020년도 1~3월 , 2021년도 1~3월 등록상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX 
WHERE  (REG_DT >= '2020-01-01' AND REG_DT <= '2020-03-31')
OR     (REG_DT >= '2021-01-01' AND REG_DT <= '2021-03-31');

/*		
	
    # between 
    
		- 2개의 범위 사이의 값을 조회할 때 사용한다. ( 시작값과 종료값 포함 ) 
        
        [ 형식 ]
		
			컬럼 BETWEEN 시작값 AND 종료값  
        
    
    # in 
	
		- 특정 값이 있으면 포함된 값을 조회한다.
		
		[ 형식 ]
        
			IN (값1,값2,...값N)
    
*/


		
# 예시 19) 상품가격이 20000 ~ 50000인 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRICE BETWEEN 20000 AND 50000; # < > 형태는 사용불가

# 예시 20) 상품가격이 20000 ~ 50000이 아닌 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRICE NOT BETWEEN 20000 AND 50000; 
		
# 예시 21) 2021년에 등록된 상품의 전체컬럼 조회		
SELECT *
FROM   SELECT_EX 
WHERE  REG_DT BETWEEN '2021-01-01' AND '2021-12-31';
		
# 예시 22) 2021년에 등록되지 않은 상품의 전체컬럼 조회		
SELECT *
FROM   SELECT_EX 
WHERE  NOT REG_DT BETWEEN '2021-01-01' AND '2021-12-31';
		
# 예시 23) 상품코드가 'P10001' , 'P10003' , 'P10005'인 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRODUCT_CD IN('P10001' , 'P10003' , 'P10005');
#WHERE  PRODUCT_CD = 'P10001' OR PRODUCT_CD = 'P10003' OR PRODUCT_CD = 'P10005';
		
# 예시 24) 상품코드가 'P10001' , 'P10003' , 'P10005'이 아닌 상품의 전체컬럼 조회
SELECT *
FROM   SELECT_EX
WHERE  PRODUCT_CD NOT IN('P10001' , 'P10003' , 'P10005');		

/*

	# like 
    
		- 패턴 매칭기법으로 패턴에 매칭된 데이터만 조회한다. 
		- 데이터 매칭 와일드카드로 %를 사용한다.
        - 데이터 자리수 매칭 와일드 카드로 _를 사용한다.
    
    
*/
				
# 예시 25) 상품명에 'USB'단어가 들어있는 상품의 전체 컬럼 검색
SELECT * 
FROM   SELECT_EX
WHERE  PRODUCT_NM LIKE '%USB%';
#WHERE  PRODUCT_NM = 'USB';
		
# 예시 26) 상품명이 'USB'로 시작하는 상품의 전체 컬럼 검색
SELECT * 
FROM   SELECT_EX
WHERE  PRODUCT_NM LIKE 'USB%';
		
# 예시 27) 상품명이 'GB'로 끝나는 상품의 전체 컬럼 검색
SELECT * 
FROM   SELECT_EX
WHERE  PRODUCT_NM LIKE '%GB'; 
#WHERE  PRODUCT_NM = 'GB';

/*

	# 테이블 조회 정렬 ORDER BY 

		- 오름차순 정렬 ASC와 내림차순 정렬 DESC 2가지가 있다.
        - 조건식이 있을 경우 WHERE절 밑에 작성한다.
		- DESC를 명시하지 않으면 기본 값으로 ASC로 작동한다.
		- 여러가지의 컬럼을 정렬 할 수 있다.
    	- 기본적으로 정렬방식에 컬럼명을 작성하나 인덱스로 작성할 수도 있다.

*/

# 예시 28) 상품의 전체 컬럼 검색 (가격이 낮은 순서대로 정렬)
SELECT 	 *
FROM   	 SELECT_EX
ORDER BY PRICE ASC; #ASCENDING(생략가능), 큰 수부터 오름차순
		
# 예시 29) 상품의 전체 컬럼 검색 (가격이 높은 순서대로 정렬)
SELECT 	 *
FROM   	 SELECT_EX 
ORDER BY PRICE DESC; #큰 수부터 내림차순
		
# 예시 30) 상품의 전체 컬럼 검색 (최근에 등록된 상품순서 , 가격이 낮은순서대로 정렬)
SELECT *
FROM   	 SELECT_EX 
ORDER BY REG_DT DESC ,
		 PRICE  DESC;
		
# 예시 31) 2021년도에 등록된 상품의 전체 컬럼 검색 (가격이 높은 순서대로 정렬)
SELECT   *
FROM   	 SELECT_EX 
WHERE 	 REG_DT BETWEEN '2021-01-01' AND '2021-12-31'
ORDER BY PRICE  DESC; #ORDER BY절은 WHERE절 다음에 위치한다.
		
/*
 
	# LIMIT : 특정 개수만큼 레코드 조회하기
    
    [ 형식 ]
	LIMIT x 	: x row만 조회
	LIMIT x,y   : x번째 부터 y row만 조회
    
    Ex)
		LIMIT 3      : 3row만 조회
		LIMIT 12     : 12row만 조회
		LIMIT 10,3   : 10번째부터 3row만 조회
		LIMIT 100,10 : 100번째부터 10row만 조회
        
 */
 
		
# 예시 32) 가격이 가장 높은 3개의 상품의 전체 컬럼 조회
SELECT	 *
FROM   	 SELECT_EX 
ORDER BY PRICE DESC
LIMIT    3; #LIMIT절은 쿼리문 제일 아래 위치에 작성
		
# 예시 33) 가장 최신에 등록된 3개의 상품의 전체 컬럼 조회
SELECT	 *
FROM   	 SELECT_EX 
ORDER BY REG_DT DESC
LIMIT    3;		
 
# 예시 34) 최신에 등록된 3개의 상품의 전체 컬럼 조회 (5번째 레코드 이후부터 조회)
SELECT	 *
FROM   	 SELECT_EX 
ORDER BY REG_DT DESC
LIMIT    10 , 3; #LIMIT 번째, 개수
 
