<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
		<div style=" background-color: white; padding:10px; width: 350px; height: 160px; cursor: pointer; display:inline-block;" class="text-center">
			<h4><b>${tspl.proj_title }</b></h4>		
			분야 | ${tspl.work_field } || 작업기간 | ${tspl.work_period } <br>
			단가 | ${tspl.proj_cost } || 작업 내용 | ${tspl.proj_content } <br>
			${tspl.reg_date }<br>
			<!-- <button type="submit" class="btn btn-warning" >이어서 작성하기</button> -->
			<%-- <button type="submit" class="btn btn-warning" onclick="location.href=enroll/getSavedProj?proj_no=${tspl.proj_no}'">이어서 작성하기</button> --%>
			<button type="submit" class="btn btn-warning" 
			onclick="location.href='/enroll/getSavedProj?proj_no=${tspl.proj_no}'">이어서 작성하기</button>
			
			<button type="submit" class="btn btn-danger" >삭제하기</button>
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
		
		// http://localhost:8088/enroll/getSavedProj?proj_no=412
// 		$(".btn-warning").click(function(){
// 			$("form[role='form']").attr("action","/myProManageCt/temSaveProject");
// 			$("form[role='form']").submit();			
			
// 		});				
		// '삭제하기' 버튼 클릭시 삭제 후 
		$(".btn-danger").click(function(){
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
</body>
</html>
	
	