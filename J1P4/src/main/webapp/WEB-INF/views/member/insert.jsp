<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
  <style type="text/css">
  .id_ok{
  color:#008000;
  display: none;;
  }
  .id_no{
  color:#6A82FB;
  display: none; 
  }
  
  </style>
  
  
    <meta charset="UTF-8">
    <title>프투프 - 회원가입</title>
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
      <!-- jQuery 2.1.4 -->
    <script src="./resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
    
<body>

<div class="box box-info">
<div class="box-header with-border">
<h3 class="box-title">회원가입</h3>
</div>


<form class="form-horizontal" method="post">

<div class="box-body">

<div class="form-group">
<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
<div class="col-sm-10">
<input type="email" name="user_email" class="form-control" id="inputEmail3" placeholder="Email">
</div>
</div>


<div class="form-group">
<label for="inputEmail3" class="col-sm-2 control-label">이름</label>
<div class="col-sm-10">
<input type="text" name="name" class="form-control" id="inputEmail3" placeholder="Name">
</div>
</div>


<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">아이디</label>
<div class="col-sm-10">
<input type="text" name="user_id" class="form-control" id="id"  placeholder="아이디를 입력해주세요.">

<!-- id ajax 중복체크 -->
<span class="id_ok">사용 가능한 아이디입니다.</span>
<span class="id_no">중복된 아이디입니다.</span>
</div>
</div>

<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
<div class="col-sm-10">
<input type="password" name="user_pw" class="form-control" id="inputPassword3" placeholder="Password">
</div>
</div>

<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호 확인</label>
<div class="col-sm-10">
<input type="password" name="user_pw" class="form-control" id="inputPassword3" placeholder="PasswordCheck">
</div>
</div>


</div>



<!-- 버튼설정 -->
<div class="col-md-6">
<button type="submit" class="btn btn-primary btn-block"><i class="fa fa-bell" ></i>회원가입</button>
<button type="submit" class="btn btn-info btn-block btn-flat"><i class="fa fa-bell"></i>구글 계정으로 회원가입</button>
<button type="submit" class="btn btn-danger btn-block btn-sm"><i class="fa fa-bell"></i>카카오톡 계정으로 회원가입</button>
</div>


</form>
</div>



    <!-- Bootstrap 3.3.2 JS -->
    <script src="./resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='./resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="./resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="./resources/dist/js/demo.js" type="text/javascript"></script>
 
  <script type="text/javascript">
  

  // 아이디 입력값을 가져오고, 입력값을 서버로 전송하고-> 똑같은 아이디가 있는지 체크한 후
  // 사용 가능 여부를 아이디 입력창 아래에 표시
  
 $(document).ready(function(){
	 $('#id').keydown(function(){
		 var id = $('#id').val();
  		 //alert("아이디");
		 $.ajax({
				url:"/member/idcheck",
				type: 'post',
				data:{id:id},
				success:function(res){
					
					if(res !== 1 && id.length > 0){//사용가능
						$('.idok').css("display", "inlice-block");
						$('.idno').css("display", "none");
					}else if(res ==1 && id.length > 0){//사용불가
						$('.idno').css("display", "inlice-block");
						$('.idok').css("display", "none");
					}else{//아무것도 입력 안했을때
						$('.idok').css("display", "none");
						$('.idno').css("display", "none");
					}
					
				},
				error:function(request, error){
					alert("에러");
				}
			});
		 
	 });
	 
	 
 });
 
 
// 	function checkId() {
// 	var id = $('#id').val(); //id값이 "id"인 입력값을 저장
// 	$.ajax({
// 		url:"/member/idcheck", //controller에서 요청받을주소
// 		type: 'post',
// 		data:{"id":id},
// 		success:function(res){ //컨트롤러에서 넘어온 res 값을 받음
			
// 			if(res == 0){//사용가능
// 				$('.id_ok').css("display", "inlice-block");
// 				$('.id_no').css("display", "none");
// 			}else if(res == 1){//사용불가
// 				$('.id_no').css("display", "inlice-block");
// 				$('.id_ok').css("display", "none");
// 			}else{//아무것도 입력 안했을때
// 				$('.id_ok').css("display", "none");
// 				$('.id_no').css("display", "none");
// 			}
			
// 		},
// 		error:function(request, error){
// 			alert("에러");
// 		}
// 	});
// }; 
  
 </script> 
  
  
  </body>
  
  
  
  
  
  
  
</html>

	
