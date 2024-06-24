<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/headerMPM_F.jsp"%>

<h1>/myProManage/contractProject.jsp</h1>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3>
				<b>AAA BB계약</b> 이란?
			</h3>
			AAA BB계약은 계약서 날인 과정을 온라인으로 진행할 수 있는 편리한 계약 시스템입니다.
			<div>
				<b>[AAA BB 계약 절차]</b> <br> 
				1. 업데이트된 계약서를 충분히 검토 후 계약 내용에 동의해주세요. <br> 
				<!-- 2. 클라이언트, AAA, 프리랜서 모두의 계약서 검토가 완료되면 계약서 날인이 시작됩니다.<br>  -->
				<b>2. 클라이언트, AAA, 프리랜서 모두의 계약서 검토가 완료되면 AAA가 계약서를 업로드 합니다.</b><br>
				<!-- 3. 계약서는 AAA 간편날인, 서명날인, 도장 날인 총 3가지 방법으로 날인 할 수 있습니다.<br> -->
				<b>3. 삭제</b>
			</div>
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3>계약 진행 중</h3>
			계약이 진행 중인 프로젝트를 확인 할 수 있습니다.
		</div>
	</div>
</div>
<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">1. 계약서 업로드</div>
		</div>
	</div>

	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<section>
					<table class="table table-bordered bg-light table-striped">
						<tbody>
							<tr class="text-center">
								<td>프로젝트 번호</td>
								<td>프로젝트 이름</td>
								<td>클라이언트</td>
								<td>담당 매니저</td>
								<td>진행 상태</td>
							</tr>
							<c:forEach var="conProj" items="${contractProjectList}">
								<tr>
									<td>${conProj.proj_no }</td>
									<td>${conProj.proj_title }</td>
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

</section>

<!--  -->
<script type="text/javascript">
	$(document).ready(function(){
		
		// 담당 매니저 
		var mn = "${conProj.manager_nm}";
		if(mn == ""){
			$("#mn").text("매니저 미정");
		}
		
	});

</script> 



<%@ include file="../include/footer.jsp"%>
