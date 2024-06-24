<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../include/login.jsp"></c:import>
<form class="form-horizontal" method="post" name="form_join" id="form1">

<div style="text-align: center; margin-bottom: 30px;">
<a href="/main/home">
  <img src="../resources/ptp_logo.png" alt="logo" height="100" class="nav-r1"/>
  </a>
  <br>
  <div style="margin-top: 30px; font-size: 20px;">
  함께 나눌수록 더욱 커지는 가치,<br>
IT 전문가 세상 PTP에 오신것을 환영합니다.<br>
  </div>
 	</div>
 	
 	<div class="container light-style flex-grow-1 container-p-y" style="width:500px; ">
 <div class="card overflow-hidden card-2" style="padding: 10px;" >
  <div style="font-size: 25px; padding-left: 26px; font-weight: bolder;">
  회원가입
  </div>
  </div>
  </div>
 	
 	
<div class="container light-style flex-grow-1 container-p-y" style="width:500px; margin-bottom: 100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">


<div style="padding-left: 50px; padding-top: 20px; margin-bottom: 20px;">
<label for="inputEmail3" class="insertFont">이메일</label>
<div class="col-sm-10">
<input type="email" name="user_email" class="email inputInfo" id="inputEmail3" placeholder="이메일">
</div>

<label for="inputEmail3" class="insertFont">이름</label>
<div class="col-sm-10">
<input type="text" name="name" class="inputInfo" id="inputEmail3" placeholder="이름">
</div>


<label for="inputPassword3" class="insertFont">아이디</label>
<div class="col-sm-10">
<input type="text" name="user_id" class="inputInfo" id="userid" placeholder="아이디">
<span id=check style="font-size: 14px;"></span>
</div>

<label for="inputPassword3" class="insertFont">비밀번호</label>
<div class="col-sm-10">
<input type="password" name="user_pw" class="pass inputInfo" id="pw1" placeholder="비밀번호">
<span id=checkpass2 style="font-size: 14px;"></span>
</div>

<label for="inputPassword3" class="insertFont">비밀번호 확인</label>
<div class="col-sm-10">
<input type="password" name="user_pw2" class="pass inputInfo" id="pw2" placeholder="비밀번호 확인">
<span id=checkpass style="font-size: 14px;"></span>
</div>

</div>



<div style="text-align: center; margin-bottom: 20px;">
<button type="button" class="rounded-3 roginButt" id="insertMember">회원가입</button>
</div>



</div>
</div>
</div>
</form>

<div class="container">
	<footer class="py-3 my-4">
	<ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
    </ul>
    <p class="text-center text-body-secondary">© 2024-06-06 Zip-Ga-Go-Ship-Da, Inc</p>
   </footer>
</div>



 
 
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
						$('#check').html('중복된 아이디거나, 조건에 맞지 않습니다.').css('color','red')
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
			$('#checkpass2').html('8~20자리의 영어,숫자,특수문자 조합으로 입력해주세요.').css('color', 'red');
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
	 
	 

	 
 });
 
	 //회원가입 공백 처리
	 $('#insertMember').click(function(){
		 var useremail = document.form_join.user_email.value;
		 var username = document.form_join.name.value;
		 var userid = document.form_join.user_id.value;
		 var userpw = document.form_join.user_pw.value;
		 var userpw2 = document.form_join.user_pw2.value;
		
		if(useremail==""){
			alert("모든 칸을 입력해주세요");
			return;
		}
		if(username==""){
			alert("모든 칸을 입력해주세요");
			return;
		}
		if(userid==""){
			alert("모든 칸을 입력해주세요");
			return;
		}
		if(userpw==""){
			alert("모든 칸을 입력해주세요");
			return;
		}
		if(userpw2==""){
			alert("모든 칸을 입력해주세요");
			return;
		} 
		$('#insertMember').attr("type","submit");
		location.href = '/member/insert';
		 
	 });
	

	 
 </script> 
  
  
  </body>
  
  
  
  
  
  
  
</html>

	
