<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->
  
  <!-- 부트스트랩 css 5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<h1>회원 유형</h1>

<!-- <div class="select-card client-input checked" style="width: 232px; margin-right: 20px;"> -->
<!-- <input id="category_development" name="categories" type="checkbox" value="development" class=""> -->
<!-- <label class="input-replacer" for="category_development"></label><div class="select-card-content"> -->
<!-- <img class="select-card-img inherit-select-card-img" src="/static/renewal/img/project/submit/select_card_icon_development.svg"> -->
<!-- <img class="select-card-img active-select-card-img" src="/static/renewal/img/project/submit/select_card_icon_development_selected.svg"> -->
<!-- <p class="body-2-medium">개발</p></div></div> -->

<form action="/J1P4_PTP/member/registerEmailChage" method="post">
   
   <!--input 아이디랑 label for 이름이 같아야함 !! -->
     <input type="hidden" value="${user_id }" name="user_id"> <!-- 아이디값을 세션에 담아 보내주는 것!! 히든은 숨겨서 보내줌 -->
     
      <input type="radio" value="클라이언트" name="user_cf" class="btn-check userCf" id="radioClient">
      <label for="radioClient" class="btn btn-outline-dark">🛠️클라이언트 </label>
      <input type="radio" value="프리랜서" name="user_cf" class="btn-check userCf" id="radioFreelancer">
      <label for="radioFreelancer" class="btn btn-outline-dark">🛠️ 프리랜서</label>

<div class="inputType"></div> <!-- 개인/팀/사업자 버튼 -->

<div class="inputOk"></div> <!-- 완료버튼 -->
</form>
      




<script type="text/javascript">

$(function(){
   $('.userCf').click(function(){
      
      $('.inputType').html(
      '<input type="radio" value="개인" name="user_type" class="btn-check" id="radioIndividual">'+
      '<label for="radioIndividual" class="btn btn-outline-dark userType">🎨개인</label>'+
      '<input type="radio" value="모임" name="user_type" class="btn-check" id="radioTeam">'+
      '<label for="radioTeam" class="btn btn-outline-dark userType">🖋️팀</label>'+
      ' <input type="radio" value="사업자" name="user_type" class="btn-check" id="radioBusiness">'+
      '<label for="radioBusiness" class="btn btn-outline-dark userType">⚙️개인/법인 사업자</label>');
      
      
   $(function(){
   $('.userType').click(function(){
      $('.inputOk').html(
      '<button type="submit" class="ok">완료</button>'      
      );
      
         });
   
   
      });
      
   });
   
   
});

</script>





<!-- 부트스트랩 css 5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</body>
</html>