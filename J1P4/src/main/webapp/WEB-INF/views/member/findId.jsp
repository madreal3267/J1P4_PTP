<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 찾기 로직</h1>
<h2>아이디 찾기를 성공했을때 이동할 페이지</h2>
	<div class="card o-hidden border-0 shadow-lg my-5"></div>
        
               
                    
                           <div class="jumbotron">
  <h2> 아이디는 : ${member.user_id } </h2><br/>
  		
  		<c:choose> 
  			<c:when test="${empty member}">
  			<p>조회결과가 없습니다.</p>
  			</c:when>
  			<c:otherwise>
  			<p>${member.user_id }</p>
  			</c:otherwise>
  		
  		</c:choose>
  		
  	<h2>입니다</h2>
  <button type="submit" class="btn btn-primary" onclick="location.href='/member/login'">로그인페이지</button>
  <button type="submit" class="btn btn-primary" onclick="location.href='/member/main'">메인페이지</button>
  
  
</div>

</body>
</html>