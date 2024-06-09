<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManage/underReviewProject</h1> <hr>
	
	<section>
	<h1>검수 중</h1>
	현재 상담 대기중인 프로젝트를 확인할 수 있습니다.
	</section>
	
	<section>
		<table border="1">
			<tr>
				<td>프로젝트 이름</td>
				<td>모집기간</td>
				<td>진행상태</td>
				<td>수정 / 삭제</td>
			</tr>
	 	<c:forEach var="projectVO" items="${underReviewProjectList}">
			<tr>
				<td>프로젝트 이름</td>
				<td>모집기간</td>
				<td>DB연결 확인 - 프로젝트 no : ${projectVO.proj_no }</td>
				<td><button>수정</button><button>삭제</button></td>
			</tr>
		</c:forEach>			
		</table>
	</section>

<%@ include file="../include/footer.jsp" %>
	
	