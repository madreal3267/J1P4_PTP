<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/headerCt.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<h1>/myProManageCt/underReviewProject</h1>
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
									<%-- <fmt:formatDate value="${projectVO.reg_date }" pattern="yyyy-mm-dd" /> ~ ${projectVO.deadline } --%>
									<span id="reg_date"></span> ~ ${projectVO.deadline }
									</td>
									<td class="text-center">${projectVO.proj_status }</td>
									<td class="text-center">
										<form action="">
											<button type="submit" onclick="javascript: form.action='#'" class="btn btn-primary">수정하기</button>
										</form>
										<form action="/myProManageCt/underReviewProject" method="post">
											<input type="hidden" name="proj_no" value="${projectVO.proj_no }"> 
											<input type="submit" class="btn btn-danger" value="삭제하기">
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

<script>
	$(document).ready(function() {
		
		var datetime = "${projectVO.reg_date}";
		
		if(datetime){
			var date = datetime.slice(0, 7);			
		}
		
		// 결과를 HTML에 출력
		$("#reg_date").text(date);
		
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
	});
</script>
<%@ include file="../include/footer.jsp" %>
	
	