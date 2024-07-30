<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax workflow</title>
<script>

	$().ready(function(){
		
		$("#startBtn").click(function(){
			
				
				// 2) 데이터를 서버(servlet)로 전송 [3번 절차는 servlet에서 진행]
				// 4) 화면 업데이트
			
		});
		
	});
</script>
</head>
<body>

	<p id="resultMsg"></p>
	<!-- 1) AJAX Workflow 시작 -->
	<p>
		<input type="text" id="testData" />
		<input type="button" id="startBtn" value="AJAX work flow" /> 
	</p>
	
</body>
</html>