<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<%@ include file="../include/headerCt.jsp" %>

<!-- 폼태그 -->
<form role="form" action="" method="post">
	<input type="hidden" name="proj_no" value="${tspl.proj_no }">
</form>

	<h1>/myProManage/temSaveProject</h1> <hr>
	
	<section>
	<h1>임시 저장</h1>
	작성 중 임시 저장한 프로젝트를 확인할 수 있습니다.
	</section>
	<c:forEach var="tspl" items="${temSaveProjectList}">
		<div style=" background-color: white; padding:10px; width: 300px; height: 160px; cursor: pointer; display:inline-block;" class="text-center">
			<h4><b>${tspl.proj_title }</b></h4>		
			분야 | ${tspl.work_field } || 작업기간 | ${tspl.work_period } <br>
			단가 | ${tspl.proj_cost } || 작업 내용 | ${tspl.proj_content } <br>
			${tspl.reg_date }<br>
			<!-- <button type="submit" class="btn btn-warning" >이어서 작성하기</button> -->
			<%-- <button type="submit" class="btn btn-warning" onclick="location.href=enroll/getSavedProj?proj_no=${tspl.proj_no}'">이어서 작성하기</button> --%>
			<button type="submit" class="btn btn-warning" 
			onclick="location.href='/enroll/getSavedProj?proj_no=${tspl.proj_no}'">이어서 작성하기</button>
			
			<button type="submit" class="btn btn-danger" >삭제하기</button>
			<br>
		</div>
	</c:forEach>
	


<script type="text/javascript">
	$(document).ready(function(){
		
		// http://localhost:8088/enroll/getSavedProj?proj_no=412
// 		$(".btn-warning").click(function(){
// 			$("form[role='form']").attr("action","/myProManageCt/temSaveProject");
// 			$("form[role='form']").submit();			
			
// 		});				
		// '삭제하기' 버튼 클릭시 삭제 후 
		$(".btn-danger").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/temSaveProject");
			$("form[role='form']").submit();			
			
		});
		
		// 삭제 후 페이지 로딩시 모달창 생성
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
	
	