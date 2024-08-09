<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/freeHeader.jsp"%>

<style>
.project-item {
    position: relative;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-bottom: 10px;
}

.apply-form {
    position: absolute;
    top: 40px;
    right: 20px;
}

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
			<div class="tab-pane fade active show">
				<!-- card body 시작 -->
				<div class="card-body border-start" >
					<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
						<h4 class="font-weight-bold mx-4 my-3">지원중</h4>
						지원한 프로젝트를 확인할 수 있습니다.
					</div><br>		
						1. 현재 지원중인 프로젝트 목록입니다. <br>
						2. 클라이언트는 프로젝트의 지원자 모집 마감 이후, 최대 10일간 지원자 검토 기간을 가집니다. <br>
						3. 프로젝트 지원 결과는 클라이언트의 지원자 검토가 완료되면 안내해 드립니다. <br>
						4. 클라이언트가 미팅을 원하는 경우, 캐프리에서 개별적으로 연락을 드립니다.<br>
					<br>
	 
					 <c:forEach var="projDTO" items="${applyingProjectList}">
						 <div class="project-item">
							<c:choose>
								<c:when test="${projDTO.proj_status == '모집중'}">
									<span style="background-color: #31b9a9;" class="badge">모집중</span>
								</c:when>
								<c:otherwise>
									<span style="background-color: #31b9a9;" class="badge">모집종료</span>
								</c:otherwise>
							</c:choose>			
										 					 
						 	<h4><a id="linkG" href="/board/detailList?proj_no=${projDTO.proj_no }">${projDTO.proj_title }</a></h4> 
						 
						 	예상 금액 <b><fmt:formatNumber value="${projDTO.proj_cost }" pattern="#,###"/>원</b> | 예상 기간 ${projDTO.work_period }일<br>
							${projDTO.work_field }	|  ${projDTO.region } ${projDTO.district } | 
						<!-- 스킬 나열 -->
							<c:set var="skillList" value="${projDTO.skill_nm }" />
							<c:forEach items="${fn:split(skillList, ',')}" var="skill">
								<span style="background-color: #31b9a9;" class="badge">
									<c:out value="${skill}" />
								</span>
							</c:forEach>
							
							<!-- 하트위치 -->
							<c:if test="${not empty projDTO.meeting_dt and not empty projDTO.meeting_pc}">
								<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${projDTO.proj_no}">제안 확인</button>
							</c:if>
							<form class="apply-form"  action="/myProManage/applyingProject" method="post">
								<input type="hidden" name="free_no" value="${projDTO.free_no }">
								<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
								<input class="btn btn-dark" type="submit" value="지원 취소"> 
							</form>
							<span style="float: right;">등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-mm-dd"/></span>
						 </div>
						 
			 <!--제안 확인 modal 창 -->
				<div class="modal fade" id="modal-${projDTO.proj_no}" style="display: none;">
					<form action="/myProManageCt/agreeContract" method="post">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">클라이언트가 사전미팅을 제안했습니다..</h4>
								<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
								
									<label for="md">미팅 날짜</label><input id="md" type="datetime-local" name="meeting_dt" value="${projDTO.meeting_dt }" readonly="readonly"><br>
									<label for="mp">미팅 장소와 내용</label><br>
									<textarea id="mp" name="meeting_pc" rows="6" cols="80" readonly="readonly">${projDTO.meeting_pc }</textarea>
									<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
									<input type="hidden" name="free_no" value="${projDTO.free_no }">								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-bs-dismiss="modal">닫기</button>
								<input type="submit" class="btn btn-dark" value="제안 동의">
							</div>
						</div>
					</div>
					</form>
				</div> 
				 </c:forEach>
			</div>
		</div>
	</div>

<!-- '지원하기'로 페이지 이동시 생성 modal 창 -->
<div class="modal fade" id="myModal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">지원하기 성공</h4>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>프로젝트에 지원하여 '지원내역'-'지원중'으로 이동합니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 지원 취소시 생성 모달창 -->
<div class="modal fade" id="myModal2" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">지원 취소 성공</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>성공적으로 '지원중' 프로젝트에서 지원을 취소하였습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(document).ready(function() {
		
		var result = "${msg}";

		// 지원 취소 성공 정보 전달 
		if (result == "deletApply") {
			$("#myModal2").modal("show");
		}
	});
</script>
<%@ include file="../include/footer.jsp" %>