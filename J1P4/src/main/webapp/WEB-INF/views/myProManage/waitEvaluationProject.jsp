<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/waitEvaluationProject.jsp</h1> <br>
	
	<section>
		<h1>평가 대기 중</h1>
		더 나은 프로젝트 거래 문화를 만들어 나가기 위해 클라이언트를 평가해 주세요.
	</section>
	
	<section>
		<div>평가 기간 내에만 작성하실 수 있습니다. </div> 
	
		<c:forEach var="projectVO" items="${waitEvaluationProjectList}">
			<p> ${projectVO.proj_title }
				${projectVO.ct_no }	
				${projectVO.reg_date }
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
					평가하기
				</button>
			</p>
		</c:forEach>
		<!-- 모달창 생성하기 -->
		<div class="modal fade in" id="modal-default" style="display: block; padding-right: 17px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span></button>
							<h4 class="modal-title">프로젝트 평가하기</h4>
					</div>
					<div class="modal-body">
						<p>One fine body…</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">등록하기</button>
					</div>
				</div>
			</div>
		</div>			
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
	