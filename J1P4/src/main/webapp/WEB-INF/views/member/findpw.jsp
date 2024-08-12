<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 페이지</title>
 <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- jQuery 2.1.4 -->
<script src="./resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
String email = request.getParameter("user_email");
String key = request.getParameter("key");

</script>



<body>

	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">비밀번호 재설정</h3>
		</div>


		<form class="form-horizontal" action="/J1P4_PTP/member/chage" method="post">
			<div class="box-body">
			
				<input type="hidden" name="user_email" value="${param.user_email}" >
				<input type="hidden" name="key"  value="${param.key }">
				 
				 
				
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">새 비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="pass" name="user_pw"
							id="pw1" placeholder="password">
							<span id=checkpass1></span>

					</div>
				</div>
				
				
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">새 비밀번호 확인</label>
					<div class="col-sm-10">
						<input type="password" class="pass" name="user_pw2"
							id="pw2" placeholder="PasswordCheck">
							<span id=checkpass2></span>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"> Remember me
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="box-footer">
				<button type="submit" class="btn btn-default" >비밀번호 재설정하기</button>
			</div>

		</form>
	</div>



	<!-- Bootstrap 3.3.2 JS -->
	<script src="./resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='./resources/plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/app.min.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./resources/dist/js/demo.js" type="text/javascript"></script>
	
	
	<script type="text/javascript">
	 $(document).ready(function(){
		 
		 //비밀번호 유효성검사 , 비밀번호 재확인
		 $('.pass').keyup(function(){
			 
			 let check_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
			 let memberpw = $('#pw1').val();
			 
			 var pass1 = $('#pw1').val();
			 var pass2 = $('#pw2').val();
			 

			//비밀번호 조건 일치/불일치
			if(!check_pw.test(memberpw)){
				$('#checkpass1').html('8~20자리의 영어,숫자,특수문자 조합으로 입력해주세요.').css('color', 'black');
			}else{
				$('#checkpass1').html('비밀번호가 조건에 일치합니다.').css('color', 'green');
			}
			
			//비밀번호 재확인
			if(check_pw.test(memberpw)){
				if(!pass1=="" || !pass2==""){
				if(pass1 == pass2){
					$('#checkpass2').html('비밀번호가 일치합니다.').css('color','green')
				}else if(pass1 != pass2){
					$('#checkpass2').html('비밀번호를 다시 확인해주세요.').css('color', 'red');
				}
				
				}
			}		
				
			
			 
		 });
			 
	 });
	
	
	</script>
	
	
	
	
</body>
</html>