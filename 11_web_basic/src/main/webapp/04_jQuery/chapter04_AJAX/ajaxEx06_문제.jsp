<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
</head>
<body>

	<!-- 
	
		1. 로그인 버튼을 클릭하면 id , passwd를 ajaxEx06_연습 Servlet으로 전송한다.
		
		2. id 와 passwd가 모두 admin이면 
		   2-1) id가 msg인 엘리먼트에 초록색 글씨로 "로그인 되었습니다."를 출력한다.
		   2-2) id가 id , passwd인 엘리먼트를 disabled 속성을 적용한다.
		
		3. id 와 passwd가 모두 admin이 아니면    
		   3-1) id가 msg인 엘리먼트에 빨간색 글씨로 "아이디와 비밀번호를 확인하세요."를 출력한다.
	
	 -->

	<fieldset>
		<legend>비동기 로그인</legend>
		<p>id : <input type="text" id="id"></p>
		<p>password : <input type="password" id="passwd"></p>
		<p id="msg"></p>
		<input type="button" id="loginBtn" value="로그인">
	</fieldset>
	 
</body>
</html>