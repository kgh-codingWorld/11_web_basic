<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
</head>
<body>

	<!-- 
	
		1. 중복확인 버튼을 클릭하면 id를 ajaxEx05_연습 Servlet으로 전송한다.
		
		2. 전송된 아이디가 String[] userList = {"user1" , "user2" , "user3" , "user4" , "user5"}; 포함되어있으면 
		   - id가 result인 엘리먼트에 "중복된 아이디 입니다."를 출력한다.
		   
		3. 전송된 아이디가 포함되어있지 않으면
		   - id가 result인 엘리먼트에 "사용가능한 아이디 입니다."를 출력한다.
	
	 -->

	<p>
		id : <input type="text" id="id">
			 <input type="button" id="duplicatedIdCheck" value="중복확인"> 
			 <span id="result"></span>
	</p> 
	
</body>
</html>