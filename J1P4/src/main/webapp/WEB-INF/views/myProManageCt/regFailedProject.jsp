<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManage/regFailedProject.jsp</h1> <hr>
	
	<section>
	<h1>등록 실패</h1>
	반려된 프로젝트와 반려 사유를 확인할 수 있습니다.
	</section>
	
	<section>
		<table border="1">
			<tr>
				<td>프로젝트 번호</td>
				<td>프로젝트 이름</td>
				<td>등록일자</td>
				<td>반려 일자</td>
				<td>수정</td>
			</tr>
	 	<c:forEach var="projectVO" items="${regFailedProjectList}">
			<tr>
				<td rowspan="2">${projectVO.proj_no }</td>
				<td>${projectVO.proj_title }</td>
				<td>${projectVO.reg_date }</td>
				<td>관리자가 반려한 날짜<!-- 반려하면 DB에 날짜가 저장? --></td>
				<td rowspan="2"><button>수정하기</button></td>
			</tr>
			<tr >
				<td colspan="3">${projectVO.reject_reason }</td>
			</tr>
		</c:forEach>			
		</table>
	</section>

<%@ include file="../include/footer.jsp" %>
	
	