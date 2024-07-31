<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive 예시</title>
<script src="04_jQuery/js/jquery-3.7.1.min.js"></script>
<script>

	$().ready(function(){
		
		$("#ajaxExBtn").click(function(){
			$.ajax({
				url : "ajaxEx033333",
				type : "post",
				//contentType : "전송방식", 받기만 하면 생략 가능
				//data : "전달데이터", 받기만 하면 생략 가능
				// 통신이 성공했을 경우 실행되는 (콜백)함수
				success : function(data , status , xhr) {
					console.log("- 통신 성공 -");
					console.log(data);   // 반환데이터
					console.log(status); // 상태
					console.log(xhr);    // XMLHttpRequest 객체
					
					let checkCnt = $("#checkCnt").text();
					checkCnt++;
					
					$("#checkCnt").text(checkCnt);
					$("#recvData").text(checkCnt + " " + data);
				},
				// 통신이 실패했을 경우 실행되는 (콜백)함수
				error : function(status , xhr , errorThrown) {
					console.log("- 통신 실패 -");
					console.log(xhr);
					console.log(xhr.responseText);
					console.log(status);
					console.log(errorThrown);
					console.log();
				},
				// 통신의 성패 여부와 상관없이 반드시 실행되는 (콜백)함수
				complete : function() {
					console.log("- 반드시 실행되는 함수 -")
					console.log(xhr);
					console.log(status);
				}
			});
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