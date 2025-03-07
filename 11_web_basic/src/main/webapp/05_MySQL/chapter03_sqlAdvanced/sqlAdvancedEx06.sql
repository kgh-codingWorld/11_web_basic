/*

	# 조인(JOIN) 
    
		- 조인은 두 개 이상의 테이블을 결합하는 연산이다.
		
		- 서로 다른 테이블에서 데이터를 가져오려면 조인 연산을 해야 한다. 
		
		- 주로 주키(PRIMARY KEY)와 참조키(FOREIGN KEY)를 기준으로 테이블을 조인 연산한다.
		
        - 대표적인 조인은 INNER , LEFT(LEFT OUTER), RIGHT(RIGHT OUTER) 조인이 있다.
        
        - INNER JOIN은 INNER를 생략한 JOIN으로 사용가능하다.        Ex) INNER JOIN , JOIN
        - LEFT JOIN은 OUTER를 생략한 LEFT JOIN으로 사용가능하다.    Ex) LEFT OUTER JOIN , LEFT JOIN
        - RIGHT JOIN은 OUTER를 생략한 RIGHT JOIN으로 사용가능하다.  Ex) RIGHT OUTER JOIN , RIGHT JOIN
 		
 		- 테이블명은 주로 별칭을 사용한다.
 		
 		- 체계적이고 효율적인 설계를 위한 '정규화 과정'을 이해해야 한다.
   
   
   		[ ORACLE JOIN 형식]
		
			SELECT
					*
			FROM
					(TABLE1 ALIAS),
					(TABLE2 ALIAS),
			WHERE	(CONDITION)
					
					
		[ ANSI JOIN 형식]
		
			SELECT
					*
			FROM
					(TABLE1 ALIAS)
				INNER(LEFT,RIGHT) JOIN (TABLE2 ALIAS)
									ON (CONDITION)

*/

USE SQL_ADVANCED;

CREATE TABLE CLASS (
	CLASS_CD   VARCHAR(20), #PK(Primary key)
	CLASS_NM   VARCHAR(20),
	LOCATION   VARCHAR(20)
);


CREATE TABLE STUDENT (
    STUDENT_CD 	 VARCHAR(20), #PK(Primary key)
	STUDENT_NM 	 VARCHAR(20),
	CLASS_CD 	 VARCHAR(20)  #FK(Foreign key)
);


INSERT INTO CLASS VALUES("C1" , "C"         , "101호");
INSERT INTO CLASS VALUES("C2" , "JAVA"      , "102호");
INSERT INTO CLASS VALUES("C3" , "PYTHON"    , "201호");
INSERT INTO CLASS VALUES("C4" , "SPRING"    , "202호");
INSERT INTO CLASS VALUES("C5" , "JSP"       , "301호");
INSERT INTO CLASS VALUES("C6" , "FRONT_END" , "302호");
INSERT INTO CLASS VALUES("C7" , "CLOUD"     , "303호");

INSERT INTO STUDENT VALUES("S1"  , "학생1"  , "C1");
INSERT INTO STUDENT VALUES("S2"  , "학생2"  , "C2");
INSERT INTO STUDENT VALUES("S3"  , "학생3"  , "C3");
INSERT INTO STUDENT VALUES("S4"  , "학생4"  , "C4");
INSERT INTO STUDENT VALUES("S5"  , "학생5"  , "C4");
INSERT INTO STUDENT VALUES("S6"  , "학생6"  , "C4");
INSERT INTO STUDENT VALUES("S7"  , "학생7"  , "C5");
INSERT INTO STUDENT VALUES("S8"  , "학생8"  , NULL);
INSERT INTO STUDENT VALUES("S9"  , "학생9"  , NULL);
INSERT INTO STUDENT VALUES("S10" , "학생10" , NULL);

SELECT * FROM CLASS;
SELECT * FROM STUDENT;

# ORACLE(전통) JOIN 조인예시
# SELECT * FROM CLASS , STUDENT; 카테시안곱(자주 발생하는 실수)
SELECT #* 					# 모든 컬럼조회
	   #CLASS 				# CLASS 테이블만 조회
	   #STUDENT 			# STUDENT 테이블만 조회
	   CLASS.CLASS_NM , 	# 필요한 컬럼만 조회
	   STUDENT.STUDENT_NM 	# 필요한 컬럼만 조회
FROM   CLASS , STUDENT
WHERE  CLASS.CLASS_CD = STUDENT.CLASS_CD;


SELECT 	C.CLASS_NM AS CLASS_NM, S.STUDENT_NM AS STUDENT_NM 
FROM 	CLASS C,
		STUDENT S
WHERE 	C.CLASS_CD = S.CLASS_CD;

# INNER(ANSI) JOIN 사용예시  (ANSI : American National Standards Institute)  
SELECT		*
FROM 		CLASS C
INNER JOIN	STUDENT S # INNER 키워드는 생략 가능하다.
ON			C.CLASS_CD = S.CLASS_CD; # JOIN의 조건절을 작성한다.
		   
# LEFT JOIN 사용 예시
SELECT			*
FROM 			CLASS C
LEFT OUTER JOIN	STUDENT S # OUTER 키워드는 생략 가능하다.
ON				C.CLASS_CD = S.CLASS_CD;

# RIGHT JOIN 사용 예시
# STUDENT TABLE 전원 생존 / CLASS TABLE에서 C6,C7은 STUDENT TABLE에 없으므로 NULL 값 처리 
SELECT				*
FROM 				CLASS C
RIGHT OUTER JOIN	STUDENT S # OUTER 키워드는 생략 가능하다.
ON					C.CLASS_CD = S.CLASS_CD;

SELECT 	*
FROM 	CLASS C
JOIN	STUDENT S
ON		C.CLASS_CD = S.CLASS_CD;
			   	 
# (연습 예시 1) 2층에서 수업을 듣는 학생이름 , 과목이름 , 강의실위치를 조회하시오.	
# ORACLE 전통 방식		   	 
SELECT 	S.STUDENT_NM AS STUDENT_NM,
		C.CLASS_NM AS CLASS_NM,
		C.LOCATION AS LOCATION
FROM 	CLASS C,
		STUDENT S
WHERE 	C.CLASS_CD = S.CLASS_CD AND
		SUBSTRING(C.LOCATION,1,1) = '2';

# INNER JOIN 방식
SELECT 		S.STUDENT_NM AS STUDENT_NM,
			C.CLASS_NM AS CLASS_NM ,
			C.LOCATION AS LOCATION
FROM 		CLASS C
INNER JOIN 	STUDENT S
ON			C.CLASS_CD = S.CLASS_CD 
# AND 		SUBSTRING(C.LOCATION , 1 , 1) = '2';
WHERE		SUBSTRING(C.LOCATION , 1 , 1) = '2';

# (연습 예시 2) 각층별로 수업을 듣는 학생수를 조회하고 학생수가 많은 순서대로 조회하시오.
# INNER JOIN 방식
SELECT	 SUBSTRING(C.LOCATION , 1, 1) AS FLOOR,
		 COUNT(STUDENT_CD) AS STUDENT_CNT
FROM 	 CLASS C
JOIN	 STUDENT S
ON		 C.CLASS_CD = S.CLASS_CD
GROUP BY FLOOR
ORDER BY STUDENT_CNT DESC;
