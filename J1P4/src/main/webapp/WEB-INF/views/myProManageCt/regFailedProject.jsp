<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/headerCt.jsp" %>

<h1>/myProManage/regFailedProject.jsp</h1>
<hr>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>등록 실패</h1>
			반려된 프로젝트와 반려 사유를 확인할 수 있습니다.		
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>



				<table class="table table-bordered bg-light">
					<tbody>
						<tr class="text-center">
							<td>프로젝트 번호</td>
							<td>프로젝트 이름</td>
							<td>등록일자</td>
							<td>반려 일자</td>
							<td>수정</td>
						</tr>
						<c:forEach var="projectVO" items="${regFailedProjectList}">
							<tr>
								<td rowspan="2">${projectVO.proj_no }</td>
								<td>${projectVO.proj_title }</td>
								<td>${projectVO.reg_date }
								<td>${projectVO.mod_date }
								<td rowspan="2" class="text-center">
									<form method="POST" name="form">
										<button type="submit" onclick="javascript: form.action='#'" class="btn btn-primary">수정하기</button>
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="3"> ↳ ${projectVO.reject_reason }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>

		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
	
	