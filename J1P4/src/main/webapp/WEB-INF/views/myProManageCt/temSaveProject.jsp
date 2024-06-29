<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jQuery 2.1.4 -->
<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<%@ include file="../include/ctHeader.jsp"%>

<!-- 폼태그 -->
<form role="form" action="" method="post">
	<input type="hidden" name="proj_no" value="${tspl.proj_no }">
</form>

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
	<div class="col-md-9">
		<div class="tab-content">
			<div class="tab-pane fade active show"  >
			<!-- 사이드 메뉴 끝 -->
				<!-- card body 시작 -->
				<div class="card-body border-start" >
					<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
						<h4 class="font-weight-bold mx-4 my-3">임시 저장</h4>
						작성 중 임시 저장한 프로젝트를 확인할 수 있습니다.
					</div><br>	
	
	<c:forEach var="tspl" items="${temSaveProjectList}">
		<div style=" background-color: white; padding:10px; width: 350px; height: 180px; cursor: pointer; display:inline-block; border: 1px solid gray; border-radius: 10px;" class="text-center">
			<h4><b>${tspl.proj_title }</b></h4>		
			<span style="background-color: #31b9a9;" class="badge">분야</span>${tspl.work_field } <span style="background-color: #31b9a9;" class="badge">작업기간</span>${tspl.work_period } <br>
			<span style="background-color: #31b9a9;" class="badge">단가</span>${tspl.proj_cost } <span style="background-color: #31b9a9;" class="badge">작업내용</span>
				<c:set var="content" value="${tspl.proj_content}" />
					<c:choose>
					    <c:when test="${fn:length(content) > 8}">
					        ${fn:substring(content, 0, 8)}...
					    </c:when>
					    <c:otherwise>
					        ${content}
					    </c:otherwise>
					</c:choose> <br>
			<span style="background-color: #31b9a9;" class="badge">등록일</span>${tspl.reg_date }<br>
			<button type="submit" class="btn btn-outline-dark" 
			onclick="location.href='/enroll/getSavedProj?proj_no=${tspl.proj_no}'">이어서 작성하기</button>
			
			<button type="submit" class="btn btn-dark" >삭제하기</button>
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

	
<script type="text/javascript">
	$(document).ready(function(){
				
		// '삭제하기' 버튼 클릭시 삭제 후 
		$(".btn-dark").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/temSaveProject");
			$("form[role='form']").submit();			
			
		});
		
		// 삭제 후 페이지 로딩시 모달창 생성
		var result = "${msg}";
		
		if(result == "deleteProject"){
			Swal.fire({
			  icon: "info",
			  title: "삭제 완료",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
	});	
</script>	
<%@ include file="../include/footer.jsp" %>
	