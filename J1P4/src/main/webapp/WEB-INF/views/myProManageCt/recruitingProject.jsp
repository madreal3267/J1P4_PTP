<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/recruitingProject.jsp</h1>
	
	<section>
	<h1>지원자 모집중</h1>
	지원자를 모집 중인 프로젝트를 관리할 수 있습니다.	
	</section>
	
	<section>
	
	 <c:forEach var="projectVO" items="${recruitingProjectList}">
	 <div>
	 	<h3>${projectVO.proj_title }</h3> 
	 	예상 금액 ${projectVO.proj_cost } | 예상 기간 ${projectVO.work_period } <br>
		${pojectVO.work_filed }	| 서울시 강남구 <!-- 지역 el표현식 --> | <button>자바<!-- 기술 el표현식 --></button><br>
		등록일자 ${projectVO.reg_date }
		<input type="button" value="수정하기">
	 </div>
	 </c:forEach>
	</section>

<!-- 외형만 복사. 작동원리 탐구 필요. -->
<div class="row">
	<div class="col-sm-5">
		<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 31 to 40 of 57 entries</div>
	</div>
		<div class="col-sm-7">
		<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
			<ul class="pagination">
				<li class="paginate_button previous" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
				<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
				<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
				<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
				<li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
				<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
				<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
				<li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
			</ul>
		</div>
	</div>
</div>




<%@ include file="../include/footer.jsp" %>
	