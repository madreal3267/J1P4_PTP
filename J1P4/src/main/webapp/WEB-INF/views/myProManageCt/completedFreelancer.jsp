<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/ctHeader.jsp"%>

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
	<div class="card overflow-hidden card-2" >
		<div class="row no-gutters row-bordered row-border-light">

		    <!-- 사이드 메뉴 시작 -->
			<div class="col-md-3 pt-0" >
				<div class="list-group list-group-flush account-settings-links" style="width:274px;">
					<h4 class="font-weight-bold py-1 mx-4 my-3">내 프로젝트 관리</h4>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/interestFreelancer">관심 프리랜서</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/proposeFreelancer">제안한 프리랜서</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/underReviewProject">검수중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/temSaveProject">임시저장</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/regFailedProject">등록실패</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/recruitingProject">지원자 모집중 </a>
					<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/myProManageCt/ctContractProject">계약 진행중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/ctOngoingProject">프로젝트 진행중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/waitEvaluationFreelancer">평가대기중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManageCt/completedFreelancer">완료한 프로젝트</a>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

	<div class="col-md-9">
		<div class="tab-content">
			<div class="tab-pane fade active show"  >
				<!-- card body 시작 -->
				<div class="card-body border-start" >
					<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
						<h4 class="font-weight-bold mx-4 my-3">완료한 프로젝트</h4>
						프리랜서에게 정산이 완료된 프로젝트를 확인 할 수 있습니다.
					</div><br>
					<div>		
						1. 평가를 완료한 프리랜서 목록입니다.<br>
					  	2. 프리랜서가 남긴 평가는 [프로필 관리] > [프리랜서의 평가]에서 확인할 수 있습니다.<br>
					  	3. 공정하게 평가를 작성할 수 있도록 상호 평가가 완료되거나 작성 기한이 종료된 뒤에 평가가 공개됩니다 .
					</div>
					<hr>
					<c:forEach var="cflDTO" items="${completedFreelancerList}">
						<div class="box-header with-border">
							<h4>${cflDTO.name }</h4>
							${cflDTO.proj_title }<br>
								<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${cflDTO.free_no}">수정하기</button>
							<div class="rating-display">
								<c:set var="score" value="${cflDTO.score}" />
								<c:forEach begin="1" end="5" var="i">
								
									<span class="star ${cflDTO.score >= (i * 2)-1 ? 'filled' : ''}">
										<c:choose>
											<c:when test="${cflDTO.score >= i * 2}">
												<i class="fa fa-star"></i>
											</c:when>
											<c:when test="${cflDTO.score >= (i * 2) - 1}">
												<i class="fa fa-star-half-empty"></i>
											</c:when>
											<c:otherwise>
												<i class="fa fa-star-o"></i>
											</c:otherwise>
										</c:choose>
									</span>
		 
										<!-- 모달창 생성하기 -->
										<div class="modal fade text-center" id="modal-${cflDTO.free_no}">
											<div class="modal-dialog">
												<div class="modal-content">
													<form action="/myProManageCt/completedFreelancer" method="post">
														<div class="modal-header">
															<h4 class="modal-title">프로젝트 평가하기</h4>
															<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															별점을 매겨주세요<br>
														<fieldset class="rate">
													<input type="radio" id="rating10-${cflDTO.free_no}" name="score" value="10" <c:if test="${cflDTO.score == 10}">checked</c:if>><label for="rating10-${cflDTO.free_no}" title="5점"></label> 
													<input type="radio" id="rating9-${cflDTO.free_no}" name="score" value="9" <c:if test="${cflDTO.score == 9}">checked</c:if>><label class="half" for="rating9-${cflDTO.free_no}" title="4.5점"></label> 
													<input type="radio" id="rating8-${cflDTO.free_no}" name="score" value="8" <c:if test="${cflDTO.score == 8}">checked</c:if>><label for="rating8-${cflDTO.free_no}" title="4점"></label> 
													<input type="radio" id="rating7-${cflDTO.free_no}" name="score" value="7" <c:if test="${cflDTO.score == 7}">checked</c:if>><label class="half" for="rating7-${cflDTO.free_no}" title="3.5점"></label> 
													<input type="radio" id="rating6-${cflDTO.free_no}" name="score" value="6" <c:if test="${cflDTO.score == 6}">checked</c:if>><label for="rating6-${cflDTO.free_no}" title="3점"></label> 
													<input type="radio" id="rating5-${cflDTO.proj_no}" name="score" value="5" <c:if test="${cflDTO.score == 5}">checked</c:if>><label class="half" for="rating5-${cflDTO.free_no}" title="2.5점"></label> 
													<input type="radio" id="rating4-${cflDTO.free_no}" name="score" value="4" <c:if test="${cflDTO.score == 4}">checked</c:if>><label for="rating4-${cflDTO.free_no}" title="2점"></label> 
													<input type="radio" id="rating3-${cflDTO.free_no}" name="score" value="3" <c:if test="${cflDTO.score == 3}">checked</c:if>><label class="half" for="rating3-${cflDTO.free_no}" title="1.5점"></label> 
													<input type="radio" id="rating2-${cflDTO.free_no}" name="score" value="2" <c:if test="${cflDTO.score == 2}">checked</c:if>><label for="rating2-${cflDTO.free_no}" title="1점"></label> 
													<input type="radio" id="rating1-${cflDTO.free_no}" name="score" value="1" <c:if test="${cflDTO.score == 1}">checked</c:if>><label class="half" for="rating1-${cflDTO.free_no}" title="0.5점"></label>
												</fieldset>
															<hr>
															<textarea name="content" placeholder="프로젝트를 평가해주세요" rows="4" cols="50">${cflDTO.content}</textarea>
															<input type="hidden" name="ct_no" value="${cflDTO.ct_no }">
															<input type="hidden" name="proj_no" value="${cflDTO.proj_no }">										
															<input type="hidden" name="free_no" value="${cflDTO.free_no }">										
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
															<button type="submit" class="btn btn-primary">등록하기</button>
														</div>
													</form>	
												</div>			
											</div>
										</div>
										</c:forEach>
									<div>${cflDTO.score}</div>
									</div>
									${cflDTO.content }
								</div><hr>
							</c:forEach>
						</div>
					</div>
				</div>		
			</div>	
		</div>
	</div>
</div>

<!-- '평가하기'로 페이지 이동시 생성 modal 창 -->
<div class="modal fade" id="myModal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">평가하기 성공</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>평가가 성공적으로 완료되어'종료된 프로젝트'의 '완료한 프로젝트'로 이동합니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary pull-left" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 수정하기 완료시 생성 모달창 -->
<div class="modal fade" id="myModal2" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">평가 수정 완료</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>성공적으로 평가를 수정하였습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary pull-left" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- Jquery 사용 -->
<script>
	$(document).ready(function() {
		
		// 지원하기 성공 정보 전달
		var result = "${msg}";
		if (result == "evaluateOK") {
			$("#myModal").modal("show");
		}
		if (result == "modifyOK") {
			$("#myModal2").modal("show");
		}
	});
</script>

</body>
</html>
	