<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head> 
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


<form class="form-horizontal" method="post" name="form_join">

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
<input type="text" name="user_id" class="form-control" id="userid"  placeholder="아이디를 입력해주세요.">
<span id=check></span>
</div>
</div>

<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
<div class="col-sm-10">
<input type="password" name="user_pw" class="pass" id="pw1" placeholder="Password">
<span id=checkpass2></span>
</div>
</div>

<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호 확인</label>
<div class="col-sm-10">
<input type="password" name="user_pw2" class="pass" id="pw2" placeholder="PasswordCheck">
<span id=checkpass></span>
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
	 
	 $('#userid').keyup(function(){
		 var userid = $('#userid').val();
  		 //alert("아이디");
		 $.ajax({
				url:"/member/idcheck",
				type: "get",
				data:{userid:userid},
				success:function(res){
					
					let input_id = document.form_join.user_id.value; //name=user_id값
					
					//아이디 유효성검사
					let check_id = /^[a-z0-9_-]{6,12}$/;
		 			let memberid = $('#userid').val();
		 			
					if(input_id.length==0){ //아무것도 입력안한상태
 						$('#check').html('아이디는 6~12자리 영어,숫자만 사용 가능합니다.').css('color','black')
					}else if((res ==1)  || (!check_id.test(memberid))){ // 사용불가
						$('#check').html('중복된 아이디거나, 조건에 맞지않습니다.').css('color','red')
					}else if(res != 1){//사용가능
						$('#check').html('사용 가능한 아이디입니다.').css('color','green')
					}
					
					
				},
				error:function(request, error){
					alert("에러");
				}
			});
		 
	 });
	 
	
	 //비밀번호 유효성검사 , 비밀번호 재확인
	 $('.pass').keyup(function(){
		 
		 let check_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		 let memberpw = $('#pw1').val();
		 
		 var pass1 = $('#pw1').val();
		 var pass2 = $('#pw2').val();
		 

		//비밀번호 조건 일치/불일치
		if(!check_pw.test(memberpw)){
			$('#checkpass2').html('8~20자리의 영어,숫자,특수문자 조합으로 입력해주세요.').css('color', 'black');
		}else{
			$('#checkpass2').html('비밀번호가 조건에 일치합니다.').css('color', 'green');
		}
		
		//비밀번호 재확인
		if(check_pw.test(memberpw)){
			if(!pass1=="" || !pass2==""){
			if(pass1 == pass2){
				$('#checkpass').html('비밀번호가 일치합니다.').css('color','green')
			}else if(pass1 != pass2){
				$('#checkpass').html('비밀번호를 다시 확인해주세요.').css('color', 'red');
			}
			
			}
		}		
			
		let input_id = document.form_join.user_id.value; //name=user_id값
		 
	 });
	 
	 
	 //회원가입 공백 처리
	 function checkBlank(){
		 var useremail = document.form_join.user_email.value;
		 var username = document.form_join.name.value;
		 var userid = document.form_join.user_id.value;
		 var userpw = document.form_join.user_pw.value;
		 var userpw2 = document.form_join.user_pw2.value;
		 if(useremail==""|| username==""||userid==""|| userpw==""|| userpw2==""){
			 alert("모든 빈칸을 작성해주세요.");
		 	return false;
		 }
		
		 	return true;
	 }
	 
	 
	 
	 


	 
 });
 
 </script> 
  
  
  </body>
  
  
  
  
  
  
  
</html>

	
