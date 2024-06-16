<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/proposedProject.jsp</h1> <hr>
	
	<section>
	<h1>제안받은 프로젝트</h1>
	클라이언트에게 지원을 제안받은 프로젝트를 확인할 수 있습니다.	
	</section>
	<section>
	<p>
	1. 클라이언트에게 제안받은 프로젝트 목록입니다. <br>
	2. 지원 완료한 프로젝트의 경우, 목록에서 지원 내역으로 이동합니다. <br>
	3. 지원자 모집이 마감되면, 목록에서 자동으로 삭제됩니다.  <br>
	4. 프로젝트 내용을 충분히 검토 후, 실제 진행 가능한 프로젝트에 지원하세요. <br>
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
	 
	<c:forEach var="projDTO" items="${proposedProjectList}">
	 	<div>
	 		<h2>${projDTO.proj_title }</h2> 
	 		예상 금액 ${projDTO.proj_cost } | 예상 기간 ${ProjectDTO.work_period } <br>
			${projDTO.work_field }	| ${projDTO.region } ${projDTO.district } | <button>${projDTO.skill_nm }</button>
			<!-- 하트위치 -->
			<form action="/myProManage/proposedProject" method="post">
				<input type="hidden" name="free_no" value="${projDTO.free_no }">
				<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
				<input type="submit" value="지원하기"> 
			</form>
			등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-mm-dd"/>
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