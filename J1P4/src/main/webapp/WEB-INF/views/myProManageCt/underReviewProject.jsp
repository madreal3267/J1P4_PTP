<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jQuery 2.1.4 -->
<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<%@ include file="../include/ctHeader.jsp"%>

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
						<h4 class="font-weight-bold mx-4 my-3">검수 중</h4>
							현재 상담 대기중인 프로젝트를 확인할 수 있습니다.
						</div><br>	
			
					<table class="table table-bordered table-striped bg-light">
						<tbody>
							<tr class="text-center">
								<th>프로젝트 이름</th>
								<th>모집기간</th>
								<th>진행상태</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="projectVO" items="${underReviewProjectList}">
								<tr>
									<td><a id="linkG" href="/board/detailList?proj_no=${projectVO.proj_no }">${projectVO.proj_title }</a></td>
									<td class="text-center">
									${projectVO.reg_date.substring(0, 10)} ~ ${projectVO.deadline }
									</td>
									<td class="text-center">${projectVO.proj_status }</td>
									<td class="text-center">
	
									<!-- 수정/삭제 공용 폼 -->
										<form role="form" action="" method="post">
											<input type="hidden" name="proj_no" value="${projectVO.proj_no }">
										</form>
										
										<!-- 제이쿼리 사용 버튼 -->	
										<button type="submit" class="btn btn-dark">삭제하기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--  -->
<script>
	$(document).ready(function() {
		
		// 프로젝트 삭제 성공 모달창 생성
		var result = "${msg}";
		
		if(result == "deleteProject"){

			Swal.fire({
			  icon: "info",
			  title: "삭제 완료",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}	

		// '삭제하기' 버튼 클릭시 삭제후 현재 페이지로 redirect
		$(".btn-danger").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/underReviewProject");
			$("form[role='form']").submit();
		});
		
	});
</script>

</body>
</html>

	
	