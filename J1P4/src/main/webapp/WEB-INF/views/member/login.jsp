<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <script src="">
    
    </script>
    
    
    
    <title>로그인 폼</title>
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
<h3 class="box-title">로그인</h3>
</div>


<form action="/member/login" class="form-horizontal" method="post">
<div class="box-body">
<div class="form-group">
<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
<div class="col-sm-10">
<input type="text"  name="user_id" class="form-control" id="inputEmail3" placeholder="ID">
</div>
</div>
<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
<div class="col-sm-10">
<input type="password" name="user_pw" class="form-control" id="inputPassword3" placeholder="Password">
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
<!-- <button type="submit" class="btn btn-default">회원가입</button> -->
<a href="/member/insert" class="register">회원가입</a>
<button type="submit" class="btn btn-info pull-right">로그인</button>
<a href="/member/idfind" class="idfind">아이디 찾기</a>
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
  </body>
</html>

	