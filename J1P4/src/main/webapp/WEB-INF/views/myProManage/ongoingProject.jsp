<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/headerMPM_F.jsp"%>

<h1>/myProManage/ongoingProject.jsp</h1>
<br>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>프로젝트 진행 중</h1>
			계약 완료 후 업무를 진행하는 단계의 프로젝트를 확인할 수 있습니다.
		</div>
	</div>
</div>
<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				1. 진행중 <br> 2. 프로젝트 완료 후 정산요청 <br> 3. 정산금 대기중.
			</div>
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
							<c:forEach var="onpro" items="${ongoingProjectList}">
								<tr>
									<td>${onpro.proj_no }</td>
									<td>${onpro.proj_title }</td>
									<td>${onpro.ct_id }</td>
									<td>${onpro.manager_nm }</td>
									<td>${onpro.proj_status }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</section>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>
