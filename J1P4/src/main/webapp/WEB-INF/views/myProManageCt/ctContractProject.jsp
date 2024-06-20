<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/ctContractProject.jsp</h1>
<!--  -->
<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
<h3><b>AAA BB계약</b> 이란?</h3>
	 	AAA BB계약은 계약서 날인 과정을 온라인으로 진행할 수 있는 편리한 계약 시스템입니다.
	 	<div>
	 	<b>[AAA BB 계약 절차]</b> <br>
	 		1. 업데이트된 계약서를 충분히 검토 후 계약 내용에 동의 해주세요. <br>
	 		2. 클라이언트, AAA, 프리랜서 모두의 계약서 검토가 완료되면 계약서 날인이 시작됩니다. <br>
	 		3. 계약서는 AAA 간편날인, 서명날인, 도장 날인 총 3가지 방법으로 날인 할 수 있습니다.
	 	</div>
			</div>
		</div>
	</div>
</section>	
<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
		<h3>계약 진행 중</h3>
		계약이 진행 중인 프로젝트를 확인 할 수 있습니다.
			</div>
		</div>
	</div>
</section>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<table class="table table-bordered bg-light table-striped">
					<tr class="text-center">
						<td>프로젝트 번호</td>
						<td>프로젝트 이름</td>
						<td>담당 매니저</td>
						<td>진행 상태</td>
					</tr>
					<c:forEach var="copDTO" items="${ctContractProjectList}">
						<tr>
							<td>${copDTO.proj_no }</td>
							<td>${copDTO.proj_title }</td>
							<td>${copDTO.manager_nm }</td>
							<td>
		                   ${copDTO.proj_status} 진행중
							</td>
						</tr>
					</c:forEach>
				</table>
			</section>
		</div>
	</div>
</div>
<!--  -->
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
	