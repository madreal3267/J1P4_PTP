<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/interestProject.jsp</h1> <hr>
	
	<section>
	<h1>관심 프로젝트</h1>
	관심 프로젝트로 추가한 프로젝트를 확인할 수 있습니다.	
	</section>
	
	<section>
	<p>
	1. 관심 프로젝트로 추가한 프로젝트 목록입니다. <br>
	2. [프로젝트 지원하기]버튼을 클릭하여 해당 프로젝트에 지원할 수 있습니다. <br>
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
	 
	 <c:forEach var="projectVO" items="${interestProjectList}">
	 <div>
	 	<h2>${projectVO.proj_title }</h2> 
	 	예상 금액 ${projectVO.proj_cost } | 예상 기간 ${projectVO.work_period } <br>
		${pojectVO.work_filed }	| 지역 el표현식 | <button>기술 el표현식</button>
		<!-- 하트위치 -->
		<input type="submit" value="지원하기">
		등록일자 ${projectVO.reg_date }
	 </div>
	 </c:forEach>
	</section>

<!-- 외형만 복사. 작동원리 탐구 필요. -->
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
	<ul class="pagination">
		<li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
		<li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
		<li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
	</ul>
</div>

<%@ include file="../include/footer.jsp" %>
	
	