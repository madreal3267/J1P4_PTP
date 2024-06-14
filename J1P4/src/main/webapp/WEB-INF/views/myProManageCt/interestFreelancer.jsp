<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/interestFreelancer.jsp</h1> <hr>
	
<section>	
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>관심 프리랜서 관리</h1>
				북마크한 프리랜서를 관리할 수 있습니다.	
			</div>
		</div>
	</div>	
</section>
	
	<section>
		<select class="pull-right">
	 		<option>정렬방식</option>
	 		<option></option>
		 	<option selected>정렬방식</option>
		 	<option>포트폴리오 많은 순</option>
		 	<option>최근 업데이트 순</option>	
		</select>
	 	<c:forEach var="free" items="${interestFreelancerList}">
	 		<hr>
			<div style=" background-color: white; padding:10px; width: 300px; height: auto; cursor: pointer;" onclick="#">
				[프로필사진]<br><!-- DB.user 정보 -->
				<b>${free.name }</b>
				분야 <b>${free.work_field }</b> | [레벨] <b>${free.job_level }</b><br>
				경력 <b>${free.yeoncha }</b> 년차 |
				학력 <b>${free.school_type }</b>
				지역 <b>${free.region } ${free.district }</b><br>
				<button type="button" class="btn btn-warning" >${free.skills }</button><br>
				근무경력 | 포트폴리오 <br>
				${free.career_count } | ${free.portfolio_count }
				[한줄소개] ${free.oneline_bio } <br>
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
	
	