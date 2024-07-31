<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
<script src="04_jQuery/js/jquery-3.7.1.min.js"></script>
<script>
	
	$().ready(function() {
		
		let productIdx = 0;
		
		$("orderQty1").change(function() {
			productIdx = 1;
			submitData(productIdx);
		});
		
		$("orderQty2").change(function() {
			productIdx = 2;
			submitData(productIdx);
		});
				
		$("orderQty3").change(function() {
			productIdx = 3;
			submitData(productIdx);
		});
		
		function submitData(idx) {
			
			let param = {
				"orderQty" : $("#orderQty" + idx).val(),
				"productId" : $("#productId" + idx).val()
			}
			
			$.ajax({
				url : "ajaxEx08_연습",
				type : "post",
				data : param,
				success : function() {
					$("#msg" + idx).text(data + "개 저장되었습니다.");
				}
			});
		}
	});
</script>
</head>
<body>

	<!-- 
	
		1. 주문수량이 달라질 때 각각의 productId와 orderQty를 ajaxEx08_연습 Servlet으로 전송한다.
		
		2. UPDATE SQL을 콘솔에 출력한다.
		   UPDATE PRODUCT
		   SET	  ORDER_QTY = 'orderQty?'
		   WHERE  PRODUCT_ID = 'productId?'
		
		3. id에 맞는 msg 엘리먼트에 "?개 저장되었습니다." 를 출력한다.
	
	 -->

	<h3>카트리스트</h3>
	<table border="1">
		<tr>
			<td>productId1 <input type="hidden" id="productId1" value="product1">
			</td>
			<td>주문 수량
				<select id="orderQty1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>개
			</td>
			<td>
				<span id="msg1" style="color:green"></span>
			</td>
		</tr>
		<tr>
			<td>productId2 <input type="hidden" id="productId2" value="product2">
			</td>
			<td>주문 수량
				<select id="orderQty2">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>개
			</td>
			<td>
				<span id="msg2" style="color:green"></span>
			</td>
		</tr>
		<tr>
			<td>productId3 <input type="hidden" id="productId3" value="product3">
			</td>
			<td>주문 수량
				<select id="orderQty3">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>개
			</td>
			<td>
				<span id="msg3" style="color:green"></span>
			</td>
		</tr>
	</table>

</body>
</html>