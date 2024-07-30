<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
<script src="04_jQuery/js/jquery-3.7.1.min.js"></script>
<script>

	$().ready(function(){
		
		$("#like , #dislike").click(function(){
			
			let param;
			let elementId;
			if ($(this).val() == "좋아요") {
				param = {
					"likeCnt" : $("#likeCnt").text()	
				}
				elementId = "likeCnt";
			}
			else if ($(this).val() == "싫어요") {
				param = {
					"dislikeCnt" : $("#dislikeCnt").text()	
				}
				elementId = "dislikeCnt";
			}
			
			$.ajax({
				
				url : "ajaxEx10_정답예시",
				type : "post",
				data : param,
				success : function(data) {
					$("#" + elementId).text(data);
				}
			
			});
			
		});	
		
	});
	
</script>
</head>
<body>

	<!-- 
	
		1. 좋아요 혹은 싫어요 버튼을 누를 때 productId와 likeCnt 혹은 dislikeCnt를 ajaxEx10_연습 Servlet으로 전송한다.
		
		2. ajaxEx10_연습 Servlet에서 likeCnt 혹은 dislikeCnt를 1증가시켜서 반환한다.
		   
		3. 증가된 숫자를 id가 likeCnt 혹은 dislikeCnt에 출력한다.
	
	 -->

	<img src="04_jQuery/images/pic_1.jpg" width="100" height="100">	
	<input type="hidden" id="productId" value="product1" />
	<p>좋아요 : <span id="likeCnt" style="color:red;">0</span> </p>
	<p>싫어요 : <span id="dislikeCnt" style="color:green;">0</span></p>
	<p>
		<input type="button" id="like" value="좋아요"/>
		<input type="button" id="dislike" value="싫어요"/>
	</p>

</body>
</html>