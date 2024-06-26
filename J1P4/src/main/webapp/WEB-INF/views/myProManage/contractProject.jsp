<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/freeHeader.jsp"%>

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
			<div class="tab-pane fade active show"  >
				<!-- card body 시작 -->
				<div class="card-body border-start" >
					<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
						
			<h3>
				<b>프투프 안전계약</b> 이란?
			</h3>
			프투프 안전계약은 계약서 날인 과정을 온라인으로 진행할 수 있는 편리한 계약 시스템입니다.
			<div>
				<b>[프투프 안전 계약 절차]</b> <br> 
				1. 업데이트된 계약서를 충분히 검토 후 계약 내용에 동의해주세요. <br> 
				<b>2. 클라이언트, AAA, 프리랜서 모두의 계약서 검토가 완료되면 프투프가 계약서를 업로드 합니다.</b><br>
			</div>	
			<h4 class="font-weight-bold mx-4 my-3">계약 진행 중</h4>
			계약이 진행 중인 프로젝트를 확인 할 수 있습니다.
			</div>	<br>
				<div class="col-md-12">
					<div class="box box-default">
						<div class="box-header with-border">
							<section>
								<table class="table table-bordered bg-light table-striped">
									<tbody>
										<tr class="text-center">
											<th>프로젝트 번호</th>
											<th>프로젝트 이름</th>
											<th>클라이언트</th>
											<th>담당 매니저</th>
											<th>진행 상태</th>
										</tr>
										<c:forEach var="conProj" items="${contractProjectList}">
											<tr>
												<td>${conProj.proj_no }</td>
												<td>
													<a id="linkG" href="/board/detailList?proj_no=${conProj.proj_no }">${conProj.proj_title }</a>
												</td>
												<td>${conProj.ct_id }</td>
												<td id="mn">${conProj.manager_nm }</td>
												<td>${conProj.proj_status } 진행중</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
						</div>
					</div>
				</div>
				</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  -->
<script type="text/javascript">
	$(document).ready(function(){
		
		// 담당 매니저 
		var mn = "${conProj.manager_nm}";
		if(mn == "" || mn == null){
			$("#mn").text("매니저 미정");
		}
		
	});

</script> 
</body>
</html>