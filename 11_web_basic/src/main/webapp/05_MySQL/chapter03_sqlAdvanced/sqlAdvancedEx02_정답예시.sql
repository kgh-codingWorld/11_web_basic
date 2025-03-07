CREATE DATABASE SQL_ADVANCED_PRACTICE;
USE SQL_ADVANCED_PRACTICE;

CREATE TABLE MEMBER_TB(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NM 		VARCHAR(50),
	SEX 			VARCHAR(10),
	NATIONALITY 	VARCHAR(20),
	EMAIL 			VARCHAR(20),
    RESIDENCE		VARCHAR(20)
);

INSERT INTO MEMBER_TB VALUES('user1', '메르켈' , 'f' , '외국' , 'mer@gmail.com'  , '서울');
INSERT INTO MEMBER_TB VALUES('user2', '제임스고슬링' , 'm' , '외국' , 'james@gmail.com' , '서울'); 
INSERT INTO MEMBER_TB VALUES('user3', '신사임당' , 'f' , '내국' , 'shinsa@naver.com' , '경기');
INSERT INTO MEMBER_TB VALUES('user4', '유관순' , 'f' , '내국' , 'yks@naver.com' , '인천');
INSERT INTO MEMBER_TB VALUES('user5', '데니스리치' , 'm' , '외국' , 'denis@gmail.com' , '부산');
INSERT INTO MEMBER_TB VALUES('user6', '팀버너스리' , 'm' , '외국' , 'tim@gmail.com' , '대구');
INSERT INTO MEMBER_TB VALUES('user7', '스티븐워즈니악' , 'm' , '외국' , 'stevenw@gmail.com' , '경기');
INSERT INTO MEMBER_TB VALUES('user8', '선덕여왕' , 'f' , '내국' , 'seonduk@daum.net' , '대구');
INSERT INTO MEMBER_TB VALUES('user9', '스티브잡스' , 'm' , '외국' , 'jobs@gmail.com' , '부산');
INSERT INTO MEMBER_TB VALUES('user10', '빌게이츠' , 'm' , '외국' , 'bill@gmail.com' , '서울');
INSERT INTO MEMBER_TB VALUES('user11', '세종대왕' , 'm' , '내국' , 'seojong@naver.com' , '서울');
INSERT INTO MEMBER_TB VALUES('user12', '이순신' , 'm' , '내국' , 'leess@daum.net' , '부산');


# 1) '내국'인의 회원 수를 조회하기
SELECT
        COUNT(*)
FROM
		MEMBER_TB
WHERE 
		NATIONALITY = '내국';
		
         
# 2) '서울' 지역의 회원 수를 조회하기        
SELECT
        COUNT(*)
FROM
		MEMBER_TB
WHERE 
		RESIDENCE = '서울';
        
        
# 3) '부산' , '대구'에 거주하는 회원 수를 조회하기 
SELECT
        COUNT(*)
FROM
		MEMBER_TB
WHERE 
		RESIDENCE IN ('부산' , '대구');
        

# 4) 성별로 그룹화하여 회원의 수를 조회하기
SELECT	
		SEX,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		SEX;
        
        
# 5) 거주지역별로 그룹화하여 회원 수를 조회하기
SELECT	
		RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		RESIDENCE;
        
        
# 6) 국적별로 그룹화하여 회원 수를 조회하기
SELECT	
		NATIONALITY,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		NATIONALITY;
        
        
# 7) (국적 -> 성)으로 그룹화하여 회원 수를 조회하기
SELECT	
		NATIONALITY,
        SEX,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		NATIONALITY,
        SEX;


# 8) (거주지역 -> 성)으로 그룹화하여 회원 수를 조회하기
SELECT	
		RESIDENCE,
        SEX,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		RESIDENCE,
        SEX;


# 9) (성 -> 거주지역)으로 그룹화하여 회원 수를 조회하기
SELECT	
		SEX,
        RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		SEX,
        RESIDENCE;


# 10) (국적 -> 거주지역 -> 성)으로 그룹화하여 회원 수를 조회하기
SELECT	
		NATIONALITY,
        RESIDENCE,
		SEX,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		NATIONALITY,
        RESIDENCE,
        SEX;


# 11) 도메인별로 그룹화하여 회원 수를 조회하기(SUBSTRING , LOCATE 함수 사용)
SELECT	
		SUBSTRING(EMAIL , LOCATE('@' , EMAIL) + 1) AS DOMAIN,
        COUNT(*)
FROM
		MEMBER_TB
GROUP BY
		DOMAIN;


# 12) 지역별로 그룹화하여 회원 수를 조회하기(서울지역 제외)
SELECT	
        RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
WHERE
		RESIDENCE <> '서울'
GROUP BY
        RESIDENCE;


# 13) '서울' , '경기' , '인천' 지역별로 그룹화하여 회원 수를 조회하되 회원수가 3명 이상일 경우만 조회하기.
SELECT	
        RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
WHERE
		RESIDENCE IN ('서울' , '경기' , '인천')
GROUP BY
        RESIDENCE
HAVING
		COUNT(*) >= 3;
