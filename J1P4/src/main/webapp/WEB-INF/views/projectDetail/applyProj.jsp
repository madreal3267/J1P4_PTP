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
<title>프리랜서 지원하기</title>
</head>
<body>
	<h1> 프리랜서 지원하기(applyProj.jsp)</h1>
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#applyModal">
	  지원하기
	</button>

<!-- 지원하기 모달창 시작 -->
<form id="fm1">

<div class="modal fade" id="applyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	    
	
	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 지원하기</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->		
				
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	<div class="m-2">
	최근 프로필 업데이트일은 ㅇㅇㅇ입니다. 
	<a href="" >내 프로필 관리 ></a>
	</div>
	<hr>
	<div class="m-2">
	해당 스펙 및 경험이 있다면 체크 부탁드립니다. (❁´◡`❁)
	</div>
		
	<c:forEach var="skill" items="${skill }" varStatus="status">
	<div class="border border-1 rounded-3 m-2 p-4" role="group" style="width: 230px; display: inline-block;">
	<input type="hidden" name="free_no" value=4>
	<!-- value에 원활한 테스트를 위해 임시로 상수 4를 넣음 추후 세션으로 아이디값을 받아 select로 free_no를 받아 넣을 예정 -->
	<input type="hidden" name="proj_no" value=101>
	<!-- value에 원활한 테스트를 위해 임시로 상수 101을 넣음 추후 상세 페이지 주소줄에서 파라미터값을 받아 넣을 예정  -->
	<h4><span class="badge bg-warning">${skill.skill_nm }</span></h4>
	<input type="radio" value="${skill.skill_nm }" name="skillCheck${status.count}" id="radioSk${status.index}">
	<label for="radioSk${status.index}"> 있음 </label>
	<input type="radio" value="${skill.skill_nm } 없음" name="skillCheck${status.count}" id="radioSk_${status.count}">
	<label for="radioSk_${status.count}"> 없음 </label>
	<!-- count : 1부터 시작 / index : 0부터 시작 -->
	</div>

	</c:forEach>
	<hr>
	<div class="m-2">
	남기는 글
	</div>
	<div>
	<textarea rows="10" cols="88" name="content" class="m-2"></textarea>
	</div>
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  <input type="button" class="btn btn-primary" id="submitButt" value="지원"
	  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#applyModalSucc">
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	
</div>
</div>
</div>
	
</form>
<!-- 지원하기 모달창 시작 -->

<!-- 지원 성공 후 모달창 시작 -->
<div class="modal fade" id="applyModalSucc" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	

	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 지원완료</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->	
	
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body" style="text-align: center;">
	<h3>프로젝트 지원이 완료되었습니다.</h3>
	<h5>지원한 프로젝트 현황은 [내 프로젝트 관리]에서 확인 가능합니다.</h5>
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
<!-- 지원 성공 후 모달창 끝 -->

<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- JQuery 자바스크립트 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script>
$(function() {
	$("#submitButt").click(function() {
		$.ajax({
			url : "/projectDetail/applyProj",
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