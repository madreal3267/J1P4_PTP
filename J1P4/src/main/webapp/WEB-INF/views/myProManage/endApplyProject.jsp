<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/headerMPM_F.jsp" %>

<%
    // 현재 시간을 가져오기 위해 java.util.Date 객체 생성
    java.util.Date currentDate = new java.util.Date();
    request.setAttribute("currentDate", currentDate);
%>

	<h1>/myProManage/endApplyProject.jsp</h1>
<section class="content">
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>지원종료</h1>
				지원 종료된 프로젝트를 확인할 수 있습니다.		
			</div>
		</div>
	</div>		
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<section>
					<div>
					프로젝트에 지원하였지만, 클라이언트와의 미팅이 성사되지 않은 프로젝트 목록입니다. <br>
					</div>	
					<select class="pull-right">
					 	<option>정렬방식</option>
					 	<option selected>기본 정렬 순</option>
					 	<option>금액 높은순</option>
					 	<option>지원 적은 순</option>
					 	<option>최신 등록 순</option>
					 	<option>마감 임박 순</option> 	
					 </select>
				<c:forEach var="projDTO" items="${endApplyProjectList}">
				 <div>
				 	<h2>${projDTO.proj_title }</h2> 
				 	예상 금액 ${projDTO.proj_cost } | 예상 기간 ${projDTO.work_period } <br>
					${projDTO.work_field }	|  ${projDTO.region } ${projDTO.district }  |  
				<!-- 스킬 나열 -->
					<c:set var="skillList" value="${projDTO.skill_nm }" />
					<c:forEach items="${fn:split(skillList, ',')}" var="skill">
						<button type="button" class="btn btn-warning">
							<c:out value="${skill}" />
						</button>
					</c:forEach>
					
				<!-- 지원 종료 이유 설명 -->
				<c:if test="${projDTO.reject_check == 1}"> 지원해 주셔서 감사드립니다. 이번에는 함께하지 못하지만, 향후 기회를 기대합니다. </c:if>
				<c:if test="${projDTO.deadline < currentDate}"> <p>지원기간이 종료되었습니다. 이번에는 함께하지 못하지만, 향후 기회를 기대합니다.</p> </c:if>
				<!-- 지원 종료 목록에서 삭제 -->	
					<form action="/myProManage/endApplyProject" method="post">
						<input type="hidden" name="free_no" value="${projDTO.free_no }">
						<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
						<input type="submit" value="목록에서 삭제" >
					</form>
					등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-MM-dd"/>
				 </div>
				 </c:forEach>
				</section>
			</div>
		</div>
	</div>
</section>

<!-- modal 창 -->
<div class="modal fade" id="myModal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">지원 목록에서 삭제하였습니다.</h4>
			</div>
			<div class="modal-body">
				<p>성공적으로 지원 목록에서 삭제하였습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
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

<%@ include file="../include/footer.jsp" %>
	