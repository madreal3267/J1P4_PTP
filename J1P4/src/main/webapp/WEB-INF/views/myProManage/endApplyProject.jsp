<%@page import="com.itwillbs.domain.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/endApplyProject.jsp</h1>
	
	<section>
	<h1>지원종료</h1>
	지원 종료된 프로젝트를 확인할 수 있습니다.	
	</section>
	
	<section>
	<p>
	프로젝트에 지원하였지만, 클라이언트와의 미팅이 성사되지 않은 프로젝트 목록입니다. <br>
	</p>
	 <select>
	 	<option>정렬방식</option>
	 	<option></option>
	 	<option selected>정렬방식</option>
	 	<option>기본 정렬 순</option>
	 	<option>금액 높은순</option>
	 	<option>지원 적은 순</option>
	 	<option>최신 등록 순</option>
	 	<option>마감 임박 순</option> 	
	 </select>
	 
	<c:forEach var="projectVO" items="${endApplyProjectList}">
	 <div>
	 	<h2>${projectVO.proj_title }</h2> 
	 	예상 금액 ${projectVO.proj_cost } | 예상 기간 ${projectVO.work_period } <br>
		${pojectVO.work_filed }	| 서울시 강남구 <!-- 지역 el표현식 --> | <button>자바<!-- 기술 el표현식 --></button>
		<!-- 하트위치 -->
		<input type="submit" value="목록에서 삭제" >
		등록일자 ${projectVO.reg_date }
	 </div>
	 </c:forEach>
	</section>






<%@ include file="../include/footer.jsp" %>
	