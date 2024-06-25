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
									${projectVO.reg_date.substring(0, 10)} ~ ${projectVO.deadline }
									</td>
									<td class="text-center">${projectVO.proj_status }</td>
									<td class="text-center">
	
									<!-- 수정/삭제 공용 폼 -->
										<form role="form" action="" method="post">
											<input type="hidden" name="proj_no" value="${projectVO.proj_no }">
										</form>
										
									<!-- 제이쿼리 사용 버튼 -->	
			<!-- 수정하기 버튼 프로젝트 수정페이지와 연결 필요 -->									
										<button type="submit" class="btn btn-warning">수정하기</button>
										<button type="submit" class="btn btn-danger">삭제하기</button>
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
		
		// '수정하기' 버튼 클릭시 프로젝트 수정 페이지로 이동
		$(".btn-warning").click(function(){
			$("form[role='form']").attr("action","/m/t");
			$("form[role='form']").submit();
		});
		
		// '삭제하기' 버튼 클릭시 삭제후 현재 페이지로 redirect
		$(".btn-danger").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/underReviewProject");
			$("form[role='form']").submit();
		});
		
	});
</script>

<%@ include file="../include/footer.jsp" %>
	
	