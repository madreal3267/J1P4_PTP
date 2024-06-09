<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManage/proposeFreelancer.jsp</h1> <hr>
	
	<section>
	<h1>제안한 프리랜서</h1>
	프로젝트 진행상태를 확인할 수 있습니다.
	</section>
	
	<section>
		<table border="1">
			<tr>
				<td>프로젝트 이름</td>
				<td>프리랜서 이름</td>
				<td>기술</td>
				<td>경력</td>
				<td>지원 여부 확인</td>
			</tr>
	 	<c:forEach var="freelancerVO" items="${proposeFreelancerList}">
			<tr>
				<td><a href="#">프로젝트 이름</a></td>
				<td><a href="#">프리랜서 이름</a></td>
				<td>기술</td>
				<td>경력</td>
				<td><b>디비 확인 ${freelancerVO.free_id }</b></td>
			</tr>
		</c:forEach>			
		</table>
	</section>

<%@ include file="../include/footer.jsp" %>
	
	