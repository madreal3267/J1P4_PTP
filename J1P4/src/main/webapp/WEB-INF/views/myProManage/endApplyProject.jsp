<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/freeHeader.jsp"%>

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
<%
    // 현재 시간을 가져오기 위해 java.util.Date 객체 생성
    java.util.Date currentDate = new java.util.Date();
    request.setAttribute("currentDate", currentDate);
%>

	<div class="col-md-9">
		<div class="tab-content">
			<div class="tab-pane fade active show"  >
			<!-- card body 시작 -->
			<div class="card-body border-start" >
				<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
					<h4 class="font-weight-bold mx-4 my-3">지원종료</h4>
					지원 종료된 프로젝트를 확인할 수 있습니다.	
				</div><br>	
					프로젝트에 지원하였지만, 클라이언트와의 미팅이 성사되지 않은 프로젝트 목록입니다. <br>
				<br>
				<c:forEach var="projDTO" items="${endApplyProjectList}">
				 <div>
				 	<h2>${projDTO.proj_title }</h2> 
				 	예상 금액 ${projDTO.proj_cost } | 예상 기간 ${projDTO.work_period } <br>
					${projDTO.work_field }	|  ${projDTO.region } ${projDTO.district }  |  
				<!-- 스킬 나열 -->
					<c:set var="skillList" value="${projDTO.skill_nm }" />
					<c:forEach items="${fn:split(skillList, ',')}" var="skill">
						<span style="background-color: #31b9a9;" class="badge">
							<c:out value="${skill}" />
						</span>
					</c:forEach>
					
				<!-- 지원 종료 이유 설명 -->
				<c:if test="${projDTO.reject_check == 1}"> 지원해 주셔서 감사드립니다. 이번에는 함께하지 못하지만, 향후 기회를 기대합니다. </c:if>
				<c:if test="${projDTO.deadline < currentDate}"> <p>지원기간이 종료되었습니다. 이번에는 함께하지 못하지만, 향후 기회를 기대합니다.</p> </c:if>
				<!-- 지원 종료 목록에서 삭제 -->	
					<form action="/myProManage/endApplyProject" method="post">
						<input type="hidden" name="free_no" value="${projDTO.free_no }">
						<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
						<input class="btn btn-dark" type="submit" value="목록에서 삭제" >
					</form>
					등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-MM-dd"/>
				 </div> <hr>
				 </c:forEach>
			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>			
<!-- modal 창 -->
<div class="modal fade" id="myModal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">지원 목록에서 삭제하였습니다.</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<p>성공적으로 지원 목록에서 삭제하였습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-right" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- Jquery 사용 -->
<script>
	$(document).ready(function() {
		
		// 지원 목록 삭제 성공 정보 전달
		var result = "${msg}";
		if (result == "deletApply") {
			$("#myModal").modal("show");
		}
	});
</script>

</body>
</html>
	