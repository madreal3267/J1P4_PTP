<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>views/member/insert.jsp</h1>
	
	<fieldset>
	<legend>회원가입</legend>
	<form action="/member/insert" method="post">
		이메일 : <input type="email" name="user_email"><br>
		이름 : <input type="text" name="name"><br>
		아이디 : <input type="text" name="user_id"><br>
		비밀번호 : <input type="password" name="user_pw"><br>
		비밀번호 확인 : <input type="password" name="user_pw"><br>
		<input type="submit" value="회원가입하기"><br>	
	</form>
	</fieldset>
	
	
</body>
</html>