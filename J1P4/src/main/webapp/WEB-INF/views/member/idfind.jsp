<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 --> 
  
    <meta charset="UTF-8">
    
    
    <title>아이디 찾기 폼</title>
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
<h3 class="box-title">아이디 찾기</h3>
</div>


<form action="/member/findId" class="form-horizontal" method="post" name="idform"> 
<div class="box-body">
<div class="form-group">
<label for="inputEmail3" class="col-sm-2 control-label">이름</label>
<div class="col-sm-10">
<input type="text" name="name" class="form-control" id="inputEmail3" placeholder="Name">
</div>
</div>
<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">이메일</label>
<div class="col-sm-10">
<input type="email" name="user_email" class="form-control" id="inputPassword3" placeholder="Email">
</div>
</div>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<div class="checkbox">
<label>
<input type="checkbox"> Remember me
</label>
</div>
</div>
</div>
</div>

<div class="box-footer">
<button type="button" class="btn btn-default" id="idButton">아이디 찾기</button>
<a href="/member/pwfind" class="pwfind">비밀번호 찾기</a>
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

	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
//---------------------------

  $(document).ready(function(){
   $('#idButton').click(function(){
	   
	  var name = document.idform.name.value;  //이름
	  var email = document.idform.user_email.value; //이메일 
	   
	  	if(name==""){
	  		alert("이름을 입력하세요.");
	  		return;
	  	}
	  	if(email==""){
	  		alert("이메일을 입력하세요.");
	  		return;
	  	}
	   
	  	$('#idButton').attr("type","submit");
		location.href = '/member/findId';
	  	
   		});
    
   });



		
		
		
		
		
		
</script>
    
    
  </body>
</html>
