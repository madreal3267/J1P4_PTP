<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/header.jsp" %>

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
					<form action="/myProManage/endApplyProject" method="post">
						<input type="hidden" name="free_no" value="${projDTO.free_no }">
						<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
						<input type="submit" value="목록에서 삭제" >
					</form>
					등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-mm-dd"/>
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
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">동작 X</button>
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
	