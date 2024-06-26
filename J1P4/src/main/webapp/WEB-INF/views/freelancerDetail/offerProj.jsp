<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body {
font-family: "Nanum Gothic", sans-serif !important;
}
</style>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>프로젝트 제안하기</title>
</head>

<body>
	<h1>프로젝트 제안하기(offerProj.jsp)</h1>

	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#offerModal">
	  제안하기
	</button>

<!-- 제안하기 모달창 시작 -->
<form id="fm1">

<div class="modal fade" id="offerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	    
	
	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 제안하기</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->		
				
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	프리랜서에게 제안할 프로젝트를 골라주떼욤 (❁´◡`❁)
	<hr>
		<!-- 아코디언 시작 본문 -->
		<div class="accordion accordion-flush" id="accordionFlushExample">
 			<c:forEach var="proj" items="${proj }">
 			<div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown" >
		   	<input type="hidden" name="free_no" value=4>
		   	<!-- 프리랜서 상세페이지 주소값 파라미터에서 value값 받아오기 ${params.free_no } -->
		   	<input type="radio" name="proj_no" class="mx-3" value="${proj.proj_no }"> 
   			<div class="accordion-item" style="width: 700px;">
   			<h2 class="accordion-header">
		    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${proj.proj_no }" aria-expanded="false" aria-controls="flush-collapse${proj.proj_no }">
		        ${proj.proj_title } 
		    </button>
    		</h2>
    			<div id="flush-collapse${proj.proj_no }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body">
				     분야 : ${proj.work_field }<br>
				     예상 시작일 : ${proj.start_date }<br>
				     머니머니 : ${proj.proj_cost }<br>
				     상세내용 : ${proj.proj_content }
					</div>
				</div>
			</div>
  			</div>
 			</c:forEach> 
		</div>
		<!-- 아코디언 본문 끝 -->
		
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  <input type="button" class="btn btn-primary" id="submitButt" value="제안"
	  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#offerModalSucc">
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	
</div>
</div>
</div>
	
</form>
<!-- 제안하기 모달창 끝 -->

<!-- 제안 성공 후 모달창 시작 -->
<div class="modal fade" id="offerModalSucc" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	

	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 제안완료</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->	
	
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	<h1>제안 성공했삼</h1>
	<h3>축하축하룽💃🏼🕺 축하축하룽👯‍♀️ 축하축하룽🧚🏻‍♀️ 축하축하룽🤸‍♀️축하축하룽🤹 축하축하룽🎷 축하축하룽🎸 축하축하룽🎤
	축하축하룽🎻 축하축하룽🚀 축하축하룽🎡 축하축하룽🎇 축하축하룽🎉 축하축하룽🎊 축하축하룽🎀 축하축하룽🛍 축하축하룽🎁</h3>
	
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	  
</div>
</div>
</div>
<!-- 제안 성공 후 모달창 끝 -->

<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- JQuery 자바스크립트 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script>
$(function() {
	$("#submitButt").click(function() {
		$.ajax({
			url : "/freelancerDetail/offerProj",
			type : "POST",
			data : $("#fm1").serialize(),
			success : function() {
			},
			error : function() {
				alert("오류발생");
			}
		});
	});
});
</script>
</body>
</html>