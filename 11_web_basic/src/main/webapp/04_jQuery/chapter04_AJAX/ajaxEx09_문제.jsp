<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
</head>
<body>

	<!-- 
	
		1. ajaxEx09_연습 Servlet에서 전송된 1000 ~ 9999 인증 숫자를 화면에 출력한다.
	
		2. 인증하기 버튼을 누를때 authenticationNumber와 tryAuthentication를 ajaxEx09_연습 Servlet으로 전송한다.
		
		3. ajaxEx09_연습 Servlet에서 인증번호 일치여부를 판별하여 반환하여
		   인증이 되면 id가 result인 엘리먼트에 초록색 글씨로 "인증 되었습니다."를 출력하고
		   인증이 되지 않으면 id가 result인 엘리먼트에 빨간색 글씨로 "인증에 실패하였습니다."를 출력한다.
	
	 -->
	

	<p>인증번호 : !!!전송된인증번호출력!!!</p>
	<p>
		인증번호 입력 : <input type="text" id="tryAuthentication"/>
		<input type="hidden" id="authenticationNumber" value="!!!전송된인증번호입력!!!"/>
	</p>
	<span id="result"></span>
	<p><input type="button" id="authenticationBtn" value="인증하기"/></p>

</body>
</html>