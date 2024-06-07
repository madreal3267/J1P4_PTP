<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>views/member/info.jsp</h1>
	<h2>회원정보 페이지</h2>
	
	프리랜서 형태 ${user_type } <br>
	담당자명 <input type="text" name="name"><br>
	팀명/회사명 <input type="text" name="team_nm"><br>
	대표자명 <input type="text" name="rep_nm"><br>
	
	설립일 <input type="date" name="est_date"><br>
	주소 <input type="text" name="addr">
	주소찾기 <input type="button" value="우편번호 찾기"><br>
	나머지 주소<input type="text" name="addr"><br>
	
	핸드폰 번호 <input type="number" name="phone_no"><br> 
	전화번호 <input type="number" name="tel_no"><br>
	세금계산서용 이메일 <input type="email" name="tax_email"><br>
	<input type="checkbox" name="check_email" value="가입시 이메일과 동일함">가입시 이메일과 동일함<br>
	<br>
	<input type="button" value="수정">
	<input type="button" value="저장">
	
</body>
</html>