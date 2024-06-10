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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>프로젝트 제안하기(offerProj.jsp)</h1>
<%-- 	${proj } --%>

	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
	  제안하기
	</button>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">
	    
<div class="modal-header">
<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 제안하기</h1>
<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
	      
<!-- 모달 본문 -->      
 <div class="modal-body">
		
프리랜서에게 제안할 프로젝트를 골라주떼욤 (❁´◡`❁)
<hr>
		
<div class="accordion accordion-flush" id="accordionFlushExample">
 
<form action="/freelancerDetail/offerProj" method="post">
 <c:forEach var="proj" items="${proj }">
  <div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown" >
   <input type="hidden" name="free_no" value=6>
   <!-- 프리랜서 상세페이지 주소값 파라미터에서 value값 받아오기 ${param.free_no } -->
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
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <input type="submit" class="btn btn-primary" value="제안">
      </div>
 </div>
</div>
</div>
</div>
</form>
<!-- </form> -->
<!--   <div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown" > -->
<!--    <input type="radio" name="r1" class="mx-3" value="proj_no">  -->
<!--    <div class="accordion-item" style="width: 700px;"> -->
<!--     <h2 class="accordion-header"> -->
<!--       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne"> -->
<!--         프로젝트 제목  -->
<!--       </button> -->
<!--     </h2> -->
<!--     <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample"> -->
<!--       <div class="accordion-body"> -->
<!--       동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 -->
<!-- 	  무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세 남산 위에 저 소나무 철갑을 두른 듯 -->
<!-- 	  바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세 -->
<!-- 	  </div> -->
<!--     </div> -->
<!--    </div> -->
<!--   </div> -->
  
<!--   <div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown"> -->
<!--    <input type="radio" name="r1" class="mx-3" value="proj_no">  -->
<!--    <div class="accordion-item" style="width: 700px;"> -->
<!--     <h2 class="accordion-header"> -->
<!--       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo"> -->
<!--         절대 누르지 마시오 -->
<!--       </button> -->
<!--     </h2> -->
<!--     <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample"> -->
<!--       <div class="accordion-body"> -->
<!--       하 죠낸 하기 싫다 하지만 해야지 내가 선택했는데.. -->
<!--       우리 할 수 있을까..? 이제 10일 남음 근데 합치고 테스트할 거 생각하면 -->
<!--       7일 밖에 안 남은 셈임 아직도 오류 많은데 가능할까 잉잉 -->
<!--       </div> -->
<!--     </div> -->
<!--    </div> -->
<!--   </div> -->
  
<!--   <div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown"> -->
<!--    <input type="radio" name="r1" class="mx-3" value="proj_no"s> -->
<!--    <div class="accordion-item" style="width: 700px;"> -->
<!--     <h2 class="accordion-header"> -->
<!--       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree"> -->
<!--         내가 만든 꾸끼 🍪 -->
<!--       </button> -->
<!--     </h2> -->
<!--     <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample"> -->
<!--       <div class="accordion-body"> -->
<!--       내가 만든 쿠키 너를 위해 구웠지 But you know that it ain’t for free, -->
<!--       yeah 내가 만든 쿠키 너무 부드러우니 (what?) 자꾸만 떠오르니 (ayy) -->
<!-- 	  </div> -->
<!--     </div> -->
<!--    </div> -->
<!--   </div> -->
  
<!-- </div> -->



	
<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>