<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
  
   <script type="text/javascript">
    var msg = "${msg}";
    
    if (msg != "") {
        alert(msg);
    }
	</script>
    
  
  
    <meta charset="UTF-8">
    <title>계정정보 페이지</title>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->
    
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
<body>
<h1>계정설정 페이지</h1>

<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">계정정보</h3>
</div>


<form role="form" action="/member/account" method="post">
<div class="box-body">
<div class="form-group">
<label for="exampleInputEmail1">아이디</label>
<input type="text" class="form-control" name="user_id" id="exampleInputEmail1" placeholder="ID" value="${sessionScope.user_id}" readonly="readonly">
</div>

<div class="form-group">
<label for="exampleInputFile">프로필 사진</label>
<input type="file" id="exampleInputFile" name="profile">
<p class="help-block">Example block-level help text here.</p>
</div>
<button type="submit" class="btn btn-primary">업로드</button>
<br>
<br>

<div class="form-group">
<label for="exampleInputPassword1">현재 비밀번호</label>
<input type="password" class="form-control" id="currpass" name="user_pw" placeholder="Password">
</div>

<button type="button" class="passwordButton" >수정</button>
<br>
<br>
<!-- div사이에 새비밀번호, 새비밀번호 확인, 취소, 수정버튼이 들어가 있음 -->
<div class="inputType"></div> 



<br>
<div class="form-group">
<label for="exampleInputEmail1">연락처</label>
<input type="number" class="form-control" id="exampleInputEmail1" name="phone_no" placeholder="phoneNumber">
</div>
<button type="submit" class="btn btn-primary">수정</button>


</div>
<br>
<br>
<div class="box-footer">
회원탈퇴 <button type="submit" class="btn btn-primary">탈퇴</button>
</div>
</form>
</div>










    <!-- Bootstrap 3.3.2 JS -->
<!--     <script src="./resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> -->
<!--     FastClick -->
<!--     <script src='./resources/plugins/fastclick/fastclick.min.js'></script> -->
<!--     AdminLTE App -->
<!--     <script src="./resources/dist/js/app.min.js" type="text/javascript"></script> -->
<!--     AdminLTE for demo purposes -->
<!--     <script src="./resources/dist/js/demo.js" type="text/javascript"></script> -->



<script type="text/javascript">
/* 비밀번호 수정 버튼을 눌렀을때
passwordButton = 수정 버튼
currpass = 현재비밀번호 id값
*/
      $(function() {
         $('.passwordButton').click(function(){
            var passwordButton = $('.passwordButton').val();
        	 $.ajax({
        		 url:"/member/account",
        		 type:"post",
        		 data:{passwordButton:passwordButton},
        	 	 success:function(member){
        	 		 var user_pw = $('#currpass').val();
        	 		 if(user_pw == passwordButton){
        	 			 
        	 		 
//         	 		 if(member.equals(user_pw)){
        	 			 
		            	$('.inputType').html(
		              '<div class="form-group">'+
		              '<label for="exampleInputPassword1">비밀번호 변경</label>'+
					  '<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">'+
					  '</div>'+'<div class="form-group">'+
					  '<label for="exampleInputPassword1">비밀번호 변경 확인</label>'+
					  '<input type="password" class="form-control" id="exampleInputPassword1" placeholder="PasswordCheck">'+
					  '</div>'+'<button type="submit" class="btn btn-primary">취소</button>'+'<button type="submit" class="btn btn-primary">저장</button>');
        	 		 }else{
        	 			 alert("비밀번호 다시 확인해");
        	 		 }
        	 		 
        	 		 
        	 	 },
        	 	error:function(request, error){
					alert("에러");}
            
       			  });
        	 });
      });

</script>















</body>
</html>