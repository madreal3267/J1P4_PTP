<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>views/member/login.jsp</h1>
 	
 	<fieldset>
 	<legend>로그인</legend>
 	<form action="/member/login" method="post">
 		아이디 : <input type="text" name="user_id"><br>
 		비밀번호 : <input type="password" name="user_pw"><br>
 		<input type="submit" value="로그인"><br>
 		
 	</form>
 	</fieldset>
 	
 	
 	
 	
</body>
</html>