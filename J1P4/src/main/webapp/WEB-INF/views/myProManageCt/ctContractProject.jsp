<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/ctHeader.jsp"%>

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
	<div class="card overflow-hidden card-2" >
		<div class="row no-gutters row-bordered row-border-light">
		    <!-- 사이드 메뉴 시작 -->
			<div class="col-md-3 pt-0">
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
									<h4 class="font-weight-bold mx-4 my-3"><b>프투프 안전계약</b> 이란?</h4>
									프투프 안전계약은 계약서 날인 과정을 온라인으로 진행할 수 있는 편리한 계약 시스템입니다.
								</div><br>	
								 	<b>[프투프 안전 계약 절차]</b> <br>
							 		1. 업데이트된 계약서를 충분히 검토 후 계약 내용에 동의 해주세요. <br>
							 		<b>2. 클라이언트, AAA, 프리랜서 모두의 계약서 검토가 완료되면 프투프가 계약서를 업로드 합니다.</b><br>
							 		<hr>
						<h4>계약 진행 중</h4>
						계약이 진행 중인 프로젝트를 확인 할 수 있습니다.
					</div>
				</div>
				<table class="table table-bordered bg-light table-striped">
					<tr class="text-center">
						<th>프로젝트 번호</th>
						<th>프로젝트 이름</th>
						<th>담당 매니저</th>
						<th>진행 상태</th>
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
			</div>
		 	</div>							
		</div>
	</div>
</div>
</body>
</html>

	