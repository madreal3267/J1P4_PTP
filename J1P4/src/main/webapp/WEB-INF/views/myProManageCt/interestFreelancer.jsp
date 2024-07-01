<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/ctHeader.jsp"%>

<style>
.project-item {
    position: relative;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-bottom: 10px;
}
</style>

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
						<h4 class="font-weight-bold mx-4 my-3">관심 프리랜서 관리</h4>
						북마크한 프리랜서를 관리할 수 있습니다.	
					</div><br>	
			 	<c:forEach var="free" items="${interestFreelancerList}">
					<div class="project-item" style="cursor: pointer;" onclick="location.href='/board/detailListFreeC?free_no=${free.free_no}'">
						[프로필사진]
						<b>${free.name }</b>
						분야 <b>${free.work_field }</b> | 레벨 <b>${free.job_level }</b><br>
						경력 <b>${free.yeoncha }</b> 년차 |
						학력 <b>${free.school_type }</b> | 
						지역 <b>${free.region } ${free.district }</b>	
						<table style="border: 1px solid black;"class="text-center pull-right ">
							<tr>
								<th>근무경력</th>
								<th>포트폴리오</th>
							</tr>
							<tr>
								<td>${free.career_count }</td>
								<td>${free.portfolio_count }</td>
							</tr>
						</table><br>				
							<!-- 스킬 버튼 생성 test -->
							<c:set var="skillList" value="${free.skills }" />
							<c:forEach  items="${fn:split(skillList, ',')}" var="skill">
								<span class="badge text-bg-info">
									<c:out value="${skill}" />
								</span>	
							</c:forEach><br><br>	
						<span style="float: right;">[한줄소개] ${free.oneline_bio }</span> 
						<br>
					</div>
				</c:forEach>
					</div>
			</div>
		</div>
	</div>	
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
	