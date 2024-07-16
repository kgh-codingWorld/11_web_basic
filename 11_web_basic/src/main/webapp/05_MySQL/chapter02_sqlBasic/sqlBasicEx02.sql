/*
	
	# 트랜잭션 제어 언어 (Transaction Control Language) 

		1) COMMIT : 트렌젝션을 데이터베이스에 반영한다.
			
	        - 반드시 커밋 명령어를 실행 해야 트렌젝션(변경)이 database에 적용 된다.
	        - commit명령어를 사용하지 않으면 , 현재 연결상태에서만 변경사항이 보이는 것이고 재접속을 할 경우 변경했던 내용이 반영이 되어있지 않다.
			- 기본적으로 autocommit설정이 되어있는데 중요한 서버(운영)에는 autocommit 설정을 걸지 않는다.
			
		2) SAVEPOINT :  현재 시점을 저장한다. 
			
			- 저장점을 정의하면 롤백할 때 현 시점에서 SAVEPOINT 까지 트랜잭션을 롤백할 수 있다.
	    
	    3) ROLLBACK  : 변경사항을 취소한다. 
	
			- ROLLBACK 은 데이터 변경 사항이 취소되어 데이터의 SAVEPOINT 이전 상태로 복구된다.
	
	
*/

/*

	
	# 데이터 조작어 (DML : Data Manipulation Language) 
	
		[ INSERT문 ]
	
		 - 테이블에 새로운 레코드를 추가한다.
		 - 모든 컬럼의 데이터가 입력되면 필드명 입력을 생략할 수 있다.
	
		[ 레코드(데이터) 추가 형식 ]
   
		- INSERT INTO TABLE_NAME(컬럼명1 , 컬럼명2 , ....) VALUES('VAL1','VAL2',....);
	
   		EX) 
		INSERT INTO MEMBER(NO,NAME,PHONE) VALUES('1','JAMES','111-111');    # 모든 필드의 데이터가 입력
		INSERT INTO MEMBER VALUES('1','JAMES','111-111');					# 모든 필드의 데이터가 입력되어 필드명을 생략
		INSERT INTO MEMBER(NAME) VALUES('JOHN');							# 특정 필드의 데이터만 입력
		
*/

USE SQL_BASIC;
CREATE TABLE INSERT_EX (	
	PRODUCT_CD 		VARCHAR(20),
	PRODUCT_NM 		VARCHAR(100),
	PRICE			INT,
	REG_DT			TIMESTAMP
);

# 예시 1) 전체 컬럼 추가 예시(전체 컬럼은 컬럼명을 명시하지 않아도 된다.)
INSERT INTO INSERT_EX 
VALUES		('P10001' , '모니터 받침대' , 8000 , NOW());

# 예시 2) 특정 컬럼 추가 예시
INSERT INTO INSERT_EX (PRODUCT_CD)
VALUES		('P10002');
		
# 예시 3) 특정 컬럼 추가 예시
INSERT INTO INSERT_EX (PRODUCT_CD , PRODUCT_NM)
VALUES		('P10003' , '블루투스 스피커');
	
# 예시 4) 특정 컬럼 추가 예시
INSERT INTO INSERT_EX (PRODUCT_CD , PRODUCT_NM , PRICE)
VALUES		('P10004' , '기계식 키보드' , 38000);
			
# 예시 5) 특정 컬럼 추가 예시(전체 컬럼은 컬럼명을 명시하지 않아도 된다.)		
INSERT INTO INSERT_EX (PRODUCT_CD , PRODUCT_NM , PRICE , REG_DT)
VALUES		('P10005' , '먼지제거제' , 38000 , NOW());

COMMIT; # AUTO-COMMIT이 되어있으면 프로그램을 나갔다 다시 들어와도 데이터가 남아있지만 그렇지 않다면 COMMIT을 해줘야 한다.
SELECT * FROM INSERT_EX;