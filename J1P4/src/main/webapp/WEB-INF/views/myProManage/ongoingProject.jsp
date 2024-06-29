<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/freeHeader.jsp"%>

<style>
#linkG {color: black; text-decoration: none; font-weight: bolder;}
#linkG:hover {
	color: #31b9a9;
}
</style>

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
	<div class="card overflow-hidden card-2" >
		<div class="row no-gutters row-bordered row-border-light">

		    <!-- 사이드 메뉴 시작 -->
			<div class="col-md-3 pt-0">
				<div class="list-group list-group-flush account-settings-links" style="width:274px;">
					<h4 class="font-weight-bold py-1 mx-4 my-3">내 프로젝트 관리</h4>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/interestProject">관심프로젝트</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/proposedProject">제안받은 프로젝트</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/applyingProject">지원중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/endApplyProject">지원종료</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/contractProject">계약 진행중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/ongoingProject">프로젝트 진행중</a>
					<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/myProManage/waitEvaluationProject">평가대기중</a>
					<a class="list-group-item list-group-item-action" 
					href="${pageContext.request.contextPath}/myProManage/completedProject">완료한 프로젝트</a>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

	<div class="col-md-9">
		<div class="tab-content">
			<div class="tab-pane fade active show"  >
				<!-- card body 시작 -->
				<div class="card-body border-start" >
					<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
						<h4 class="font-weight-bold mx-4 my-3">프로젝트 진행 중</h4>
						계약 완료 후 업무를 진행하는 단계의 프로젝트를 확인할 수 있습니다.
					</div><br>
					1. 진행중 <br> 
					2. 프로젝트 완료 후 정산요청 <br> 
					3. 정산금 대기중.
					<hr>
						<div class="col-md-12">
							<div class="box box-default">
								<div class="box-header with-border">
									<section>
										<table class="table table-bordered bg-light table-striped">
											<tbody>
												<tr class="text-center">
													<th>프로젝트 번호</th>
													<th>프로젝트 이름</th>
													<th>클라이언트</th>
													<th>담당 매니저</th>
													<th>진행 상태</th>
												</tr>
												<c:forEach var="onpro" items="${ongoingProjectList}">
													<tr>
														<td>${onpro.proj_no }</td>
														<td>
															<a id="linkG" href="/board/detailList?proj_no=${onpro.proj_no }">${onpro.proj_title }</a>
														</td>
														<td>${onpro.ct_id }</td>
														<td>${onpro.manager_nm }</td>
														<td>${onpro.proj_status }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</section>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
</div>
<%@ include file="../include/footer.jsp" %>