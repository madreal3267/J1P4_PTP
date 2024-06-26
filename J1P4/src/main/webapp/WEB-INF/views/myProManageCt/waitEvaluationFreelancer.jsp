<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
								<h4 class="font-weight-bold mx-4 my-3">평가 대기 중</h4>
								프리랜서에게 정산이 완료된 프로젝트를 확인할 수 있습니다.
							</div><br>				
							<i class="fa fa-fw fa-exclamation"></i>평가는 평가 기간 내에만 작성하실 수 있습니다.<hr>
						<c:forEach var="freeDTO" items="${waitEvaluationFreelancerList}">
							<p>
								<b>${freeDTO.name }</b><br>
								${freeDTO.proj_title}<br>
								작성기간 <fmt:formatDate value="${freeDTO.mod_date }" pattern="yyyy-mm-dd"/>
								<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#modal-${freeDTO.free_no}">평가하기</button>
							</p>
								<!-- 모달창 생성하기 -->
								<div class="modal fade  text-center" id="modal-${freeDTO.free_no}">
									<div class="modal-dialog">
										<div class="modal-content">
											<form action="/myProManageCt/waitEvaluationFreelancer" method="post">
												<div class="modal-header">
													<h4 class="modal-title">프리랜서 평가하기</h4>
													<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													별점을 매겨주세요<br>
													<fieldset class="rate">
														<input type="radio" id="rating10-${freeDTO.free_no}" name="score" value="10"><label for="rating10-${freeDTO.free_no}" title="10점"></label> 
														<input type="radio" id="rating9-${freeDTO.free_no}" name="score" value="9"><label class="half" for="rating9-${freeDTO.free_no}" title="9점"></label> 
														<input type="radio" id="rating8-${freeDTO.free_no}" name="score" value="8"><label for="rating8-${freeDTO.free_no}" title="8점"></label> 
														<input type="radio" id="rating7-${freeDTO.free_no}" name="score" value="7"><label class="half" for="rating7-${freeDTO.free_no}" title="7점"></label> 
														<input type="radio" id="rating6-${freeDTO.free_no}" name="score" value="6"><label for="rating6-${freeDTO.free_no}" title="6점"></label> 
														<input type="radio" id="rating5-${freeDTO.free_no}" name="score" value="5"><label class="half" for="rating5-${freeDTO.free_no}" title="5점"></label> 
														<input type="radio" id="rating4-${freeDTO.free_no}" name="score" value="4"><label for="rating4-${freeDTO.free_no}" title="4점"></label> 
														<input type="radio" id="rating3-${freeDTO.free_no}" name="score" value="3"><label class="half" for="rating3-${freeDTO.free_no}" title="3점"></label> 
														<input type="radio" id="rating2-${freeDTO.free_no}" name="score" value="2"><label for="rating2-${freeDTO.free_no}" title="2점"></label> 
														<input type="radio" id="rating1-${freeDTO.free_no}" name="score" value="1"><label class="half" for="rating1-${freeDTO.free_no}" title="1점"></label>
													</fieldset>
													<hr>
													<textarea name="content" placeholder="프리랜서를 평가해주세요" rows="4" cols="50"></textarea>
													<input type="hidden" name="ct_no" value="${freeDTO.ct_no }">									
													<input type="hidden" name="free_no" value="${freeDTO.free_no }">											
													<input type="hidden" name="proj_no" value="${freeDTO.proj_no}">											
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary">등록하기</button>
												</div>
											</form>	
										</div>
									</div>
								</div><hr>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>
	