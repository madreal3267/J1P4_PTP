<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>views/member/accountInfo.jsp</h1>
 	<h2>계정설정 페이지</h2>
 
	아이디 : ${memberVO.user_id }<br> 
	프로필 사진 <input type="file" name="profile">
	<input type="button" value="업로드" onclick=""><br>
	비밀번호 : ${memberVO.user_pw}
	<input type="button" value="수정"><br>
	수정할 비밀번호 <input type="password" name="user_pw"><br>
	수정할 비밀번호 확인 <input type="password" name="user_pw"><br>
	<input type="button" value="취소" onclick="">
	<input type="button" value="저장" onclick=""><br>
	연락처 <input type="number" name="phone_no">
	<input type="button" value="수정"><br>
	회원탈퇴 <input type="button" value="회원탈퇴">
  
 
 
 
</body>
</html>