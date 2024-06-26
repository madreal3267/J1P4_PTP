<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/login.jsp" %>

<!-- <div class="select-card client-input checked" style="width: 232px; margin-right: 20px;"> -->
<!-- <input id="category_development" name="categories" type="checkbox" value="development" class=""> -->
<!-- <label class="input-replacer" for="category_development"></label><div class="select-card-content"> -->
<!-- <img class="select-card-img inherit-select-card-img" src="/static/renewal/img/project/submit/select_card_icon_development.svg"> -->
<!-- <img class="select-card-img active-select-card-img" src="/static/renewal/img/project/submit/select_card_icon_development_selected.svg"> -->
<!-- <p class="body-2-medium">개발</p></div></div> -->

<form action="/member/registerEmailChage" method="post">
<div style="text-align: center; margin-bottom: 30px;">
<a href="/main/home">
  <img src="../resources/ptp_logo.png" alt="logo" height="100" class="nav-r1"/>
  </a>
  <br>
  <div style="margin-top: 30px; font-size: 20px;">
<h4><b>이메일 인증 성공!</b></h4>  <br>
가입하고자 하는 유형을 선택해주세요.
  </div>
 	</div>
<div class="container light-style flex-grow-1 container-p-y" style="width:750px;">
 <div class="card overflow-hidden card-2" style="padding-top:50px; margin-top:50px;">
  <div class="row no-gutters row-bordered row-border-light">

	<!--input 아이디랑 label for 이름이 같아야함 !! -->
	  <input type="hidden" value="${user_id }" name="user_id"> <!-- 아이디값을 세션에 담아 보내주는 것!! 히든은 숨겨서 보내줌 -->
	  <div style="text-align: center !important; margin-bottom: 20px;">
 	  <input type="radio" value="클라이언트" name="user_cf" class="btn-check userCf" id="radioClient">
      <label for="radioClient" class="btn btn-outline-dark p-5 ">
      적절한 인재 찾기를 희망하는
      <h4><b>🙆‍♂️ 클라이언트</b></h4> </label>
      <input type="radio" value="프리랜서" name="user_cf" class="btn-check userCf" id="radioFreelancer">
      <label for="radioFreelancer" class="btn btn-outline-dark p-5">마음에 드는 프로젝트를 찾는
      <h4><b>🙇 프리랜서</b></h4></label>
	  </div><br>

<div class="inputType" style="margin-bottom: 20px;"></div> <!-- 개인/팀/사업자 버튼 -->
<br>
<div class="inputOk" style="text-align: center; margin-bottom:40px;"></div> <!-- 완료버튼 -->
      
</div>
</div>
</div>

</form>


<script type="text/javascript">

$(function(){
	$('.userCf').click(function(){
		
		$('.inputType').html(
		'<div style="text-align: center;"><input type="radio" value="개인" name="user_type" class="btn-check" id="radioIndividual">'+
		'<label for="radioIndividual" class="btn btn-outline-dark userType p-4" style="padding:30px;"><h4><b>🙋 개인</b></h4></label>'+
		' <input type="radio" value="팀" name="user_type" class="btn-check" id="radioTeam">'+
		'<label for="radioTeam" class="btn btn-outline-dark userType p-4"><h4><b>👨‍👩‍👧‍👦 팀</b></h4></label>'+
		' <input type="radio" value="사업자" name="user_type" class="btn-check" id="radioBusiness">'+
		'<label for="radioBusiness" class="btn btn-outline-dark userType p-4"><h4><b>🏢 개인/법인 사업자</b></h4></label></div>');
		
		
	$(function(){
	$('.userType').click(function(){
		$('.inputOk').html(
		'<div style="text-align: center;><button type="submit" class="ok btn btn-outline-dark btn-sm px-5"><h4><b>완료</b></h4></button></div>'		
		);
		
			});
	
	
		});
		
	});
	
	
});

</script>





<!-- 부트스트랩 css 5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<%@ include file="../include/footer.jsp" %>