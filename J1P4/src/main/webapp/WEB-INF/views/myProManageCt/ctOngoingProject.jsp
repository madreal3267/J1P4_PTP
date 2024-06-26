<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@ include file="../include/ctHeader.jsp"%>

<!-- 폼태그 -->
<form role="form" action="/myProManageCt/payment" method="post">
	<input type="hidden" name="proj_no" value="${copDTO.proj_no }">
	<input type="hidden" name="free_no" value="${copDTO.free_no }">
	<input type="hidden" name="ct_no" value="${copDTO.ct_no }">	
</form>
<form role="form" action="/myProManageCt/requestSettlement" method="post">
	<input type="hidden" name="proj_no" value="${copDTO.proj_no }">
	<input type="hidden" name="free_no" value="${copDTO.free_no }">
	<input type="hidden" name="ct_no" value="${copDTO.ct_no }">	
</form>

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
								<h4 class="font-weight-bold mx-4 my-3">프로젝트 진행 중</h4>
								진행 중 프로젝트를 확인할 수 있습니다..
							</div><br>	
							<table class="table table-bordered bg-light table-striped">
								<tr class="text-center">
									<th>프로젝트 번호</th>
									<th>프로젝트 이름</th>
									<th>담당 매니저</th>
									<th>진행 상태</th>
								</tr>
								<c:forEach var="copDTO" items="${ctOngoingProjectList}">
									<tr>
										<td>${copDTO.proj_no }</td>
										<td><a id="linkG" href="/board/detailList?proj_no=${copDTO.proj_no }">${copDTO.proj_title }</a></td>
										<td>${copDTO.manager_nm }</td>
										<td class="text-center">
					                        <c:choose>
					                            <c:when test="${copDTO.proj_status == '계약'}">
													<form role="form" action="/myProManageCt/payment" method="post">
														<input type="hidden" name="proj_no" value="${copDTO.proj_no }">
														<input type="hidden" name="free_no" value="${copDTO.free_no }">
														<input type="hidden" name="ct_no" value="${copDTO.ct_no }">
														<input type="hidden" name="proj_cost" value="${copDTO.proj_cost }">
					                                <input style="background-color: #31b9a9; color: white;" type="submit" class="btn" value="결제하기">
														
													</form>
					                            </c:when>
						                            <c:otherwise>
														<form role="form" action="/myProManageCt/requestSettlement" method="post">
															<input type="hidden" name="proj_no" value="${copDTO.proj_no }">
															<input type="hidden" name="free_no" value="${copDTO.free_no }">
															<input type="hidden" name="ct_no" value="${copDTO.ct_no }">
						                               <input type="submit" class="btn btn-dark" value="완료하기">										
														</form>		                               
						                            </c:otherwise>
					                        </c:choose>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		 
		// '결제하기' 버튼 클릭시 대금, 대금 지불 여부, 정산요청 컬럼 변경
		$(".btn-warning").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/payment");
			$("form[role='form']").submit();			
			
		});

		// '완료하기' 버튼 클릭시 정산요청 컬럼값 변경, 프리랜서 '진행중' 
		$(".btn-dark").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/requestSettlement");
			$("form[role='form']").submit();			
			
		});
		
		var result = "${msg}";
		
		// 결제하기 후 페이지 로딩시 모달창 생성
		if(result == "payment"){
			Swal.fire({
			  icon: "info",
			  title: "성공적으로 대급이 입급되었습니다.",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
		
		// 완료하기 후 페이지 로딩시 모달창 생성
		if(result == "requestSettlement"){
			Swal.fire({
			  icon: "info",
			  title: "성공적 정산요청!",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
	})	
</script>

</body>
</html>
	