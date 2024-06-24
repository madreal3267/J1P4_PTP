<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

<!-- 폼태그 -->
<form role="form" action="" method="post">
	<input type="hidden" name="proj_no" value="${copDTO.proj_no }">
	<input type="hidden" name="free_no" value="${copDTO.free_no }">
	
	<input type="hidden" name="ct_no" value="${copDTO.ct_no }">
</form>

	<h1>/myProManageCt/ctOngoingProject.jsp</h1> <br>
	
<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>프로젝트 진행 중</h1>
				진행 중 프로젝트를 확인할 수 있습니다..
			</div>
		</div>
	</div>
</section>	
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<table class="table table-bordered bg-light table-striped">
					<tr class="text-center">
						<td>프로젝트 번호</td>
						<td>프로젝트 이름</td>
						<td>담당 매니저</td>
						<td>진행 상태</td>
					</tr>
					<c:forEach var="copDTO" items="${ctOngoingProjectList}">
						<tr>
							<td>${copDTO.proj_no }</td>
							<td>${copDTO.proj_title }</td>
							<td>${copDTO.manager_nm }</td>
							<td>
		                        <c:choose>
		                            <c:when test="${copDTO.proj_status == '계약'}">
		                                <button type="submit" class="btn btn-warning">결제하기</button>
		                            </c:when>
		                            <c:otherwise>
		                               <button type="submit" class="btn btn-primary">완료하기</button>
		                            </c:otherwise>
		                        </c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</section>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		// '결제하기' 버튼 클릭시 대금결제 API with 기렬
		$(".btn-warning").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/????");
			$("form[role='form']").submit();			
			
		});

		// '완료하기' 버튼 클릭시 정산요청 컬럼값 변경, 프리랜서 '진행중' 
		$(".btn-primary").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/requestSettlement");
			$("form[role='form']").submit();			
			
		});
		
		
		
		// 삭제 후 페이지 로딩시 모달창 생성
		var result = "${msg}";
		
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

<%@ include file="../include/footer.jsp" %>
	