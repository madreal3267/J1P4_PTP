<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/headerCt.jsp" %>

<h1>/myProManage/underReviewProject</h1>
<hr>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>검수 중</h1>
			현재 상담 대기중인 프로젝트를 확인할 수 있습니다.		
		</div>
	</div>
</div>

<section>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<table class="table table-bordered bg-light">
					<tbody>
						<tr class="text-center">
							<td>프로젝트 이름</td>
							<td>모집기간</td>
							<td>진행상태</td>
							<td>수정 / 삭제</td>
						</tr>
						<c:forEach var="projectVO" items="${underReviewProjectList}">
							<tr>
								<td>${projectVO.proj_title }</td>
								<td class="text-center">
									<fmt:formatDate value="${projectVO.reg_date }" pattern="yyyy-mm-dd"/>
									~ ${projectVO.deadline }
								</td>
								<td class="text-center">${projectVO.proj_status } </td>
								<td class="text-center">
									<form method="POST" name="form">
										<button type="submit" onclick="javascript: form.action='#'"class="btn btn-primary">수정하기</button>   
										<button type="submit" onclick="javascript: form.action='#'" class="btn btn-danger">삭제하기</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</div>
</section>

<%@ include file="../include/footer.jsp" %>
	
	