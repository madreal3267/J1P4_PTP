<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script>

$(function(){
	
	$("#addButt").click(function(){
		
		$.ajax({
			
			url:"/check.",
			data:{test:$("#ajaxText").val()},
			success:function(data){
				$("#ajaxResult").html(data);
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	
			}
			
		});
		
	});
	
});
</script>
</head>
<body>
	<h1>enrollSuccess.jsp</h1>
	<h2> 프로젝트 등록 성공 하셨습니다 ㅊㅊ </h2>
	<hr>
	<div id="ajaxResult"></div>
	<hr>
	<input type="text" id="ajaxText">
    <input type="button" value="추가하기" id="addButt">
</body>
</html>