<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive 예시</title>
<script>

	$().ready(function(){
		
		$("#ajaxExBtn").click(function(){
				
		});
		
	});
</script>
</head>
<body>

	<p><img src="04_jQuery/images/pic_9.jpg" width="200" height="200"></p>
	<h3>데이터 수신 횟수 : <span id="checkCnt">1</span></h3>
	<p><span id="recvData"></span></p> 
	<p><input type="button" id="ajaxExBtn" value="recvData"></p>
	
</body>
</html>