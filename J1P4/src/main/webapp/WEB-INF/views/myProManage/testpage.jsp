<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<h1>/myProManage/proposedProject.jsp</h1>
<hr>

<section>
	<h1>제안받은 프로젝트</h1>
	클라이언트에게 지원을 제안받은 프로젝트를 확인할 수 있습니다.
</section>
<section>
	<p>
		1. 클라이언트에게 제안받은 프로젝트 목록입니다. <br> 2. 지원 완료한 프로젝트의 경우, 목록에서 지원 내역으로
		이동합니다. <br> 3. 지원자 모집이 마감되면, 목록에서 자동으로 삭제됩니다. <br> 4. 프로젝트
		내용을 충분히 검토 후, 실제 진행 가능한 프로젝트에 지원하세요. <br>
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

	<c:forEach var="projectVO" items="${proposedProjectList}">
		<div>
			<h2>${projectVO.proj_title }</h2>
			예상 금액 ${projectVO.proj_cost } | 예상 기간 ${projectVO.work_period } <br>
			${pojectVO.work_filed } | 지역 el표현식 |
			<button>기술 el표현식</button>
			<!-- 하트위치 -->
			<input type="submit" value="지원하기"> 등록일자 ${projectVO.reg_date }
		</div>
	</c:forEach>
</section>

<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
	<div class="row">
		<div class="col-sm-12">
			<table id="example1"
				class="table table-bordered table-striped dataTable" role="grid"
				aria-describedby="example1_info">
				<thead>
					<tr role="row">
						<th class="sorting_asc" tabindex="0" aria-controls="example1"
							rowspan="1" colspan="1" aria-sort="ascending"
							aria-label="Rendering engine: activate to sort column descending"
							style="width: 218.025px;">프로젝트 제목</th>
						<th class="sorting" tabindex="0" aria-controls="example1"
							rowspan="1" colspan="1"
							aria-label="Browser: activate to sort column ascending"
							style="width: 267.35px;">예상금액</th>
						<th class="sorting" tabindex="0" aria-controls="example1"
							rowspan="1" colspan="1"
							aria-label="Platform(s): activate to sort column ascending"
							style="width: 236.975px;">예상기간</th>
						<th class="sorting" tabindex="0" aria-controls="example1"
							rowspan="1" colspan="1"
							aria-label="Engine version: activate to sort column ascending"
							style="width: 187.15px;">분야</th>
						<th class="sorting" tabindex="0" aria-controls="example1"
							rowspan="1" colspan="1"
							aria-label="CSS grade: activate to sort column ascending"
							style="width: 134.9px;">등록일자</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="projectVO" items="${proposedProjectList}">
					<tr>${projectVO.proj_title }</tr>
					<tr>${projectVO.proj_cost }</tr>
					<tr> ${projectVO.work_period }</tr>
					<tr>${pojectVO.work_filed }</tr>
					<tr>${projectVO.reg_date }</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-7">
			<div class="dataTables_paginate paging_simple_numbers"
				id="example1_paginate">
				<ul class="pagination">
					<li class="paginate_button previous disabled"
						id="example1_previous"><a href="#" aria-controls="example1"
						data-dt-idx="0" tabindex="0">Previous</a></li>
					<li class="paginate_button active"><a href="#"
						aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
					<li class="paginate_button "><a href="#"
						aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
					<li class="paginate_button "><a href="#"
						aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
					<li class="paginate_button "><a href="#"
						aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
					<li class="paginate_button "><a href="#"
						aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
					<li class="paginate_button "><a href="#"
						aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
					<li class="paginate_button next" id="example1_next"><a
						href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>