<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/waitEvaluationFreelancer.jsp</h1> <br>
	
	<section>
		<h1>평가 대기 중</h1>
		프리랜서에게 정산이 완료된 프로젝트를 확인할 수 있습니다.
	</section> 
	
	<section>
		<div><i class="fa fa-fw fa-exclamation"></i>평가는 평가 기간 내에만 작성하실 수 있습니다. </div> 
		
		<c:forEach var="freelancerVO" items="${waitEvaluationFreelancerList}">
			<p> ${freelancerVO.free_id }<!-- 유저테이블과 조인후 이름가져오기 -->
				프로젝트 제목<!-- 프로젝트 테이블과 조인후 제목 가져오기 -->
				작성기간 YYYY-MM-DD <!-- 프로젝트 진행중에서 완료하기 누른 날부터 일주일  -->
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
							<h4 class="modal-title">프리랜서 평가하기</h4>
					</div>
					<div class="modal-body">
						<p>프리랜서 평가내용</p>
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
	