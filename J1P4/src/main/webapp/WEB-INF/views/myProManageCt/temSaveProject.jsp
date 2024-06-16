<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManage/temSaveProject</h1> <hr>
	
	<section>
	<h1>임시 저장</h1>
	작성 중 임시 저장한 프로젝트를 확인할 수 있습니다.
	</section>
	<c:forEach var="tspl" items="${temSaveProjectList}">
		<div style=" background-color: white; padding:10px; width: 300px; height: 160px; cursor: pointer; display:inline-block;" class="text-center">
			<h4><b>${tspl.proj_title }</b></h4>		
			분야 | ${tspl.work_field }  작업기간 | ${tspl.work_period } <br>
			단가 | ${tspl.proj_cost }  작업 내용 | ${tspl.proj_content } <br>
			${tspl.reg_date }<br>
			<button type="button" class="btn btn-warning" >이어서 작성하기</button>
			<button type="button" class="btn btn-danger" >삭제하기</button>
			<br>
		</div>
	</c:forEach>
<%@ include file="../include/footer.jsp" %>
	
	