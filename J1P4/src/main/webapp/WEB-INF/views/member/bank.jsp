<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head> 
    <meta charset="UTF-8">
    <title>계좌관리</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->
  
  
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

  
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
<body>

<h1>계좌관리</h1>
<form action="/J1P4_PTP/member/bank" method="post" >
<h2>등록된 계좌</h2><br>
<input type="hidden" value="${sessionScope.user_id}" name="user_id">
<div class="banklist"></div>
<!-- [추가하기] 클릭시 추가되는 은행명/계좌/예금주-->

<div id="inputPt"></div>
<!-- <!-- [+계좌 추가]클릭시 [select버튼] 출력되는 공간 -->

<div role="button" class="addBank">+계좌 추가</div>
<br>
<br>
<button type="submit">등록하기</button>
</form>



<h1>회원정보 - 사업자 & 개인/팀</h1>
<form action="/J1P4_PTP/member/addinfo" method="post" name="jumin_form">
<input type="hidden" value="${sessionScope.user_id}" name="user_id">
<div class="form-group">		
	<label>회원유형</label>
	<select id="select_type" name="user_type" >
	<option>회원유형 선택</option>		
	<option value="개인">개인</option>		
	<option value="모임">팀</option>
	<option value="사업자">사업자</option>
	</select>
<!-- <input type="button" value="확인" class="typeButton">	 -->
</div>

<div class="business"></div>
<!--회원유형별 정보  -->
<br>
<br>
주소 <input type="text" name="addr">
<input type="button" value="우편번호 찾기"><br>
나머지주소 <input type="text" name="addr">
<h1>연락처 정보</h1>
핸드폰 번호 <input type="text" name="phone_no"><br>
전화번호 <input type="text" name="phone_no"><br>
세금계산서용 이메일 <input type="email" name="tax_email"><br>
<button type="submit">등록하기</button>
</form>



<h1>신원인증</h1>
<form action="/J1P4_PTP/member/" method="post">
<div>
<%-- <c:if test="${sessionScope.user_type.equals.('사업자') }"> --%>
<div class="type_business">
회원유형<input type="text" value="${sessionScope.user_type }" readonly="readonly"><br>
사업자등록번호 <input type="text" name="business_registration">
<input type="button" value="확인" onclick="juminCheck()"><br>	
법인명 <input type="text" name="team_nm"><br>
대표자명 <input type="text" name="rep_nm"><br>
사업장 소재지 <input type="text" name="addr"><br>
<button type="submit">등록</button>
</div>
<%-- </c:if> --%>
<%-- <c:if test="${sessionScope.user_type.equals.('팀') || sessionScope.user_type.equals.('개인')}"> --%>
<div class="type_pt">
회원유형<input type="text" value="${sessionScope.user_type}" readonly="readonly"><br>
이름(한글실명) <input type="text" name="name"><br>
주민등록번호 <input type="text" name="jumin_no">
<input type="button" value="확인" onclick="juminCheck()"><br>
<button type="submit">등록</button>
</div>
<%-- </c:if> --%>
</div>
</form>










<!-- 주민번호 유효성 스크립트 시작 -->
<div id="result"></div>
<script type="text/javascript">
	function juminCheck(){//주민번호 유효성 검사 메서드
		
		let form = document.jumin_form; //주민번호 폼
		let jumin = form.jumin_no.value; //주민번호값
		jumin = jumin.split(''); //주민번호 한자리씩 쪼갯 배열에 담기

		let ckarr = [2,3,4,5,6,7,8,9,2,3,4,5]; //곱해줄 숫자 배열
		
		for(let i=0; i<jumin.length-1; i++){
			jumin[i] = jumin[i] * ckarr[i]
		}
	
		let juminlast = jumin[jumin.length-1]; //주민번호 마지막자리
		
		//각 자리의 숫자를 모두 더함
		let sum =0;
		for(let i=0; i<jumin.length-1; i++){
			sum += jumin[i];
		}
		
		// 11로 나눈 나머지 값을 구함
		sum = sum % 11;
		// 11에서 결과값을 뺌(단, 마지막 결과가 두자리인 경우다시 10으로 나눈 나머지 값을 구함)
		sum = 11-sum;
		if(sum>9){
			sum = sum % 10;
		}
		
		//결과가 주민등록번호 마지막 자리와 일치하면 유효한 주민등록번호임
		if(sum == juminlast){
			document.getElementById('result').innerHTML = '유효한 주민등록번호 입니다.';
		}
		if(sum != juminlast && juminlast != undefined){
			document.getElementById('result').innerHTML = '유효하지 않은 주민등록번호 입니다.';
		}
		
	}
	
	
	
	

</script> 



 <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
 
 
 <!-- 스크립트시작 -->
 <script type="text/javascript">
 
 $(function(){
	 $('.addBank').click(function(){
		$('#inputPt').html(
		'<div class="form-group">'+		
		'<label>은행선택</label>'+
		'<select class="select_Bank">'+
		'<option>부산은행</option>'+		
		'<option>국민은행</option>'+
		'<option>신한은행</option>'+		
		'<option>우리은행</option>'+	
		'<option>하나은행</option>'+		
		'<option>기업은행</option>'+	
		'<option>카카오뱅크</option>'+		
		'</select>'+		
		'</div>'+		
		'<div class="form-group">'+
		'<label>예금주</label>'+		
		'<input type="text" class="name" placeholder="예금주">'+		
		'</div>'+		
		'<div class="form-group">'+		
		'<label>계좌번호</label>'+
		'<input type="number" class="account" placeholder="계좌번호">'+
		'<button type="button" class="addButton">추가</button>'+
		'</div>	'); 
		
		$(function(){
			$('.addButton').click(function(){ //addButton = 추가버튼
				var bank = $('.select_Bank').val();
				var name = $('.name').val();
				var account = $('.account').val();
				
				if(bank==null || name=="" || account==""){
 					alert("빈칸을 모두 입력해주세요.");
					return;
				}
				
				$('.banklist').prepend(
				"은행명 : "+bank+" 예금주 : "+name+ " 계좌번호 : "+account+ '<br>'+
				'<input type="hidden" value="'+bank+'" name="bank_nm">'+
				'<input type="hidden" value="'+name+'" name="depositor">'+
				'<input type="hidden" value="'+account+'" name="account">'
				);
				
				
			});
		});
		
		
		
	 });
	  
	 
 });
 
 
 
 
//  $(function(){
// 	$('.typeButton').click(function(){
// 		var type = $('.select_type').val();
		document.querySelector("#select_type").addEventListener ("change",function(){
			let type = this.value;
		if(type=="사업자"){
			$('.business').html(
				'담당자명 <input type="text" name="name"><br>'+
				'회사명 <input type="text" name="team_nm"><br>'+
				'대표자명 <input type="text" name="rep_name"><br>'+
				'설립일 <input type="date" name="est_date"><br>');
		} 
		
		if(type=="개인"){
			$('.business').html(
				'이름 <input type="text" name="name"><br>'+
				'생년월일 <input type="date" name="birth_date">');
			
		}
		if(type=="모임"){
			$('.business').html(
			'담당자명 <input type="text" name="name"><br>'+
			'팀명 <input type="text" name="team_nm"><br>'+
			'팀 대표명자 <input type="text" name="rep_name"><br>'+
			'설립일 <input type="date" name="est_date"><br>');
		}
		
			
			
		});
// 	});
	 
	 
	 
//  });
 
 </script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 


</body>
</html>