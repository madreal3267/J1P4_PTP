<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../include/login.jsp"></c:import>
<form action="/J1P4_PTP/member/login" class="form-horizontal" method="post" name="loginform">

 	<div style="text-align: center; margin-bottom: 30px;">
<a href="/J1P4_PTP/main/home">
  <img src="${pageContext.request.contextPath}/resources/ptp_logo.png" alt="logo" height="100" class="nav-r1"/>
  </a>
  <br>
  <div style="margin-top: 30px; font-size: 20px;">
  IT 프로젝트 고민은 이제 끝!  <br>
PTP에서 성공적인 IT 프로젝트를 경험하세요.
  </div>
 	</div>
<div class="container light-style flex-grow-1 container-p-y" style="width:500px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">

<div style="text-align: center;">
<div style="margin-top: 30px;">
<input type="text" name="user_id" class="inputInfo" id="inputEmail3" placeholder=" 아이디 또는 이메일">
<input type="password" name="user_pw" class="inputInfo" id="inputPassword3" placeholder=" 비밀번호">
</div>


<button class="rounded-3 roginButt" type="button" id="loginButton">로그인</button>
</div>

</div>
</div>
</div>
<div id="aLinkId">
<a href="/J1P4_PTP/member/insert" class="register aLink">회원가입</a> &nbsp;|&nbsp;
<a href="/J1P4_PTP/member/idfind" class="idfind aLink">아이디 찾기</a>  &nbsp;|&nbsp;
<a href="/J1P4_PTP/member/pwfind" class="pwfind aLink">비밀번호 찾기</a>
</div>

</form>


    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
    
    
    <script type="text/javascript">
    //로그인 공백처리
	 $(document).ready(function(){
    
    $('#loginButton').click(function(){
		
		 var userid = document.loginform.user_id.value;
		 var userpw = document.loginform.user_pw.value;
		
		
		if(userid==""){
			alert("아이디를 입력해주세요.");
			return;
		}
		if(userpw==""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		$('#loginButton').attr("type","submit");
		location.href = '/J1P4_PTP/member/loginmain';
		 
	 	});
	
    
	 });

    
    
    </script>
    
    
    
<%@ include file="../include/footer.jsp" %>
	