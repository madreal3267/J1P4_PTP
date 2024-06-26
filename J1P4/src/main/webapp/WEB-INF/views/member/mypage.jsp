<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 <!-- jQuery 2.1.4 -->
   <script src="./resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->

<!-- 카카오 우편번호 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<!-- ============== 비회원 헤더 ================= -->
<c:if test="${empty sessionScope.user_id }">
<c:import url="../include/header.jsp"></c:import>
</c:if>

<!-- ============== 프리랜서 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('프리랜서') }">
<c:import url="../include/freeHeader.jsp"></c:import>
</c:if>

<!-- ============== 클라이언트 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('클라이언트') }">
<c:import url="../include/ctHeader.jsp"></c:import>
</c:if>

<!-- ============== 로그인 했을 때 담기는 세션 값 (추후 삭제 예정) ================= -->
user_id: ${sessionScope.user_id },
user_cf: ${sessionScope.user_cf },
user_type: ${sessionScope.user_type },
free_no: ${sessionScope.free_no },
ct_no: ${sessionScope.ct_no }

<!-- ============== 페이지 시작 ================= -->
<form action="" method="post" role="form" id="fm01" name="jumin_form"> 
<!-- <form action="/member/addinfo" method="post" >  회원정보-->
<!-- <form action="/member/addidentity" method="post"> 신원인증 -->
<!-- <form action="/member/bank" method="post" > 계좌관리 -->

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">
  
  <!-- 사이드 메뉴 필요할 경우 사용 -->
   <div class="col-md-3 pt-0">
      <div class="list-group list-group-flush account-settings-links" style="width:274px;">
         <h4 class="font-weight-bold py-1 mx-4 my-3">마이페이지</h4>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#userinfo">회원정보</a>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#identity">신원인증</a>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#account">계좌관리</a>
      </div>
   </div>
   <!-- 사이드 메뉴 끝 -->
      
   <div class="col-md-9">
   <div class="tab-content">
   
   
   
      <!-- UI 예시용1 탭 시작 -->
      <div class="tab-pane fade active show" id="userinfo"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">회원정보</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
    <input type="hidden" value="${sessionScope.user_id}" name="user_id100">
	<div class="form-group" style="margin: 30px;">
	
	<label>회원유형</label>
	<select id="select_type" name="user_type" >
	<option>회원유형 선택</option>	
	<option value="개인">개인</option>		
	<option value="모임">팀</option>
	<option value="사업자">사업자</option>
	</select>

	<div class="business"></div>
	<!--회원유형별 정보  -->
	<br>
	<br>
	우편번호 <input type="text" id="sample6_postcode" placeholder="우편번호" name="addr">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark btn-sm"><br>
	주소<input type="text" id="sample6_address" placeholder="주소" name="addr"><br>
	상세주소<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr"> 
	참고항목<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr">

	<br>
	<hr>
	<h4>연락처 정보</h4>
	핸드폰 번호 <input type="text" name="phone_no" onkeyup="this.value = num_mask(this.value)" maxlength="13"><br>
	전화번호 <input type="text" name="phone_no"><br>
	세금계산서용 이메일 <input type="email" name="tax_email"><br><br>
	<button type="button" class="info btn btn-dark btn-sm">등록하기</button>
	</div>
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- UI 예시용1 탭 끝 -->
      
      
      
      
      <!-- UI 예시용2 탭 시작 -->
      <div class="tab-pane fade" id="identity"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">신원인증</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
     <div>
	<c:if test="${sessionScope.user_type.equals('사업자')}">
	<div class="type_business" style="margin: 30px;">
	회원유형<input type="text" value="${sessionScope.user_type }" readonly="readonly" class="type"><br>
	사업자등록번호 <input type="text" name="business_registration" id="brn">
	<input type="button" value="확인" onclick="checkBrn()" class="btn btn-dark btn-sm"><br>
	<div id="resultbrn"></div>
	<input type="hidden" value="" id="result3"> <!-- 유효한 값만 등록되도록 -->
	법인명 <input type="text" name="team_nm" id="brn2"><br>
	대표자명 <input type="text" name="rep_nm" id="brn3"><br>
	사업장 소재지 <input type="text" name="addr" id="brn4"><br><br>
	<button type="button" class="identiBrn" >등록하기</button>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.user_type.equals('개인')}">
	<div class="type_pt" style="margin: 30px;">
	회원유형<input type="text" value="${sessionScope.user_type}" readonly="readonly" class="type"><br>
	이름(한글실명) <input type="text" name="name" id="nameid"><br>
	주민등록번호 <input type="number" name="jumin_no" id="juminid" onkeyup="this.value = jumin_mask(this.value)" maxlength="14">
	<input type="button" value="확인" class="juminButton btn btn-dark btn-sm" onclick="juminCheck()"><br>
	<div id="result"></div>
	
<!-- 	<div id="result2"></div> -->
	<input type="hidden" value="" id="result2">
	
	<button type="button" class="identi btn btn-dark btn-sm">등록</button>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.user_type.equals('모임')}" >
	<div class="type_pt" style="margin: 30px;">
	회원유형<input type="text" value="팀" readonly="readonly" class="type"><br>
	이름(한글실명) <input type="text" name="name" id="nameid"><br>
	주민등록번호 <input type="text" name="jumin_no" id="juminid">
	<input type="button" value="확인" class="juminButton btn btn-dark btn-sm" onclick="juminCheck()"><br>
	<div id="result"></div>
	
<!-- 	<div id="result2"></div> -->
	<input type="hidden" value="" id="result2">
	
	<button type="button" class="identi btn btn-dark btn-sm">등록</button>
	</div>
	</c:if>
        
	</div>
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!--  UI 예시용2 탭 끝-->
      
      
      <!-- UI 예시용3 탭 시작 -->
      <div class="tab-pane fade" id="account"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">계좌관리</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
         <h4 style="margin: 30px;">등록된 계좌</h4><br>
	<input type="hidden" value="${sessionScope.user_id}" name="user_id">
	<div class="banklist"></div>
	<!-- [추가하기] 클릭시 추가되는 은행명/계좌/예금주-->
	
	<div id="inputPt"></div>
	<!-- <!-- [+계좌 추가]클릭시 [select버튼] 출력되는 공간 -->
	
	<div role="button" class="addBank" style="margin: 30px;">+계좌 추가</div>
	<br>
	<br>
	<button type="button" class="bank btn btn-dark btn-sm" id="bankid" style="margin: 30px;">등록하기</button>
	         
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- UI 예시용3 탭 끝 -->
   
   
   
   
   </div>
   </div>
   
  </div>
 </div>
</div>
</form>

<script type="text/javascript">

//$(function(){
//	$('.typeButton').click(function(){
//		var type = $('.select_type').val();
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
//	});
 
 
 
//});

	
	$(function(){
		 $('.addBank').click(function(){
			$('#inputPt').html(
			'<div class="form-group" style="margin: 30px;">'+		
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
			'<div class="form-group" style="margin: 30px;">'+
			'<label>예금주</label>'+		
			'<input type="text" class="name" placeholder="예금주" id="bankname">'+		
			'</div>'+		
			'<div class="form-group" style="margin: 30px;">'+		
			'<label>계좌번호</label>'+
			'<input type="number" class="account" placeholder="계좌번호" id="bankaccount">'+
			'<button type="button" class="addButton btn btn-dark btn-sm">추가</button>'+
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



</script>

<!-- 주민번호 유효성 스크립트 시작 -->
<!-- <div id="result"></div> -->
<script type="text/javascript">
	
	function juminCheck(){//주민번호 유효성 검사 메서드
		//alert("주민번호왜안돼");
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
		
 //		결과가 주민등록번호 마지막 자리와 일치하면 유효한 주민등록번호임
	 		if(sum == juminlast){
  		
 			document.getElementById('result').innerHTML = "유효한 주민등록번호 입니다.";
 			document.getElementById('result2').value = "1";
 			
  			}
 			
 			if(sum != juminlast && juminlast != undefined){
			
			document.getElementById('result').innerHTML = '유효하지 않은 주민등록번호 입니다.';
			document.getElementById('result2').value = '2';
		}
		
 	}
	
	juminCheck();

</script> 


<!-- 다음우편번호api -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<!-- 사업자등록번호 유효성 (3개-2개-5개) -->
<script>
function checkBrn(){
	var brn = document.getElementById('brn').value;
	
	if ( /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/.test( brn ) ) {
        document.getElementById('resultbrn').innerText = "유효한 사업자번호";
        document.getElementById('result3').value = "1";
      } else {
        document.getElementById('resultbrn').innerText = "유효하지 않은 사업자번호";
        document.getElementById('result3').value = "2";
      }
	
}


</script>




<script type="text/javascript">
	$(document).ready(function(){
		
		//회원정보 버튼 클릭
		$('.info').click(function(){
			
			$.ajax({
				url:"/member/addinfo",
				type: "POST",
				data:$("#fm01").serialize(),
				success : function(){
					alert("회원정보 수정완료 되었습니다.");
					location.reload();
				},
				error : function() {
					alert("오류발생");
				}
			});
			
			
		});
		
//-----------------------------------------------------		
		//신원인증 버튼 클릭
		$('.identi').click(function(){ //개인, 팀 신원인증
			
			//폼 빈칸 검증
			function validateForm() {
		        var name = document.getElementById('nameid').value;
		        var jumin = document.getElementById('juminid').value;
		        var result2 =  document.getElementById('result2').value;
		      
		        console.log("name : ", name);
		        console.log("jumin :", jumin);
		       
		        if (name =="") {
		            alert('이름을 입력해주세요.');
		            return false;
		        }
				//alert("@@@@@@@@@@@@@@@@@@1");
		        if (jumin == "") {
		            alert('주민번호를 입력하세요');
		            return false;
		        }
				//alert("@@@@@@@@@@@@@@@@@@2");
		        // 1 - O
		        // 2 - X
		        if(result2 == "2"){
		        	alert("잘못된 주민번호입니다.");
		        	return false;
		        }
		        
		}
		
			var tmpResult = validateForm();
		    if(tmpResult == false){
		        return false;		    	
		    }    

		    document.getElementById('fm01').onsubmit = function(e) {
		        e.preventDefault(); // 기본 폼 제출 동작 방지

		        if (!validateForm()) {
		        	
		        	return;
		        }
		    };
		    
		    
		    $.ajax({
				url:"/member/addidentity",
				type: "POST",
				data:$("#fm01").serialize(),
				success : function(){
					alert("신원인증이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					alert("오류발생");
				}
			});
		
			
		});
	
	//사업자 신원인증
	$('.identiBrn').click(function(){
		//폼 빈칸 검증
		function validateForm() {
	        var brn = document.getElementById('brn').value; //사업자번호
	        var brn2 = document.getElementById('brn2').value; //법인명
	        var brn3 =  document.getElementById('brn3').value; //대표자명
	        var brn4 =  document.getElementById('brn4').value; //사업장 소재지
	    	var result3 =  document.getElementById('result3').value;
	       
	        if (brn =="") {
	            alert("사업자번호를 입력해주세요.");
	            return false;
	        }
	        if (brn2 == "") {
	            alert("법인명을 입력해주세요.");
	            return false;
	        }
			
	        if (brn3 == "") {
	            alert("대표자명으로 입력해주세요.");
	            return false;
	        }
			
	        if (brn4 == "") {
	            alert("사업자 소재지를 입력해주세요.");
	            return false;
	        }
			
	        if(result3 == "2"){
	        	alert("잘못된 사업자번호입니다.");
	        	return false;
	        }
		

	    }
		 
		
		var tmpResult = validateForm();
	    if(tmpResult == false){
	        return false;		    	
	    }    

	    document.getElementById('fm01').onsubmit = function(e) {
	        e.preventDefault(); // 기본 폼 제출 동작 방지

	        if (!validateForm()) {
	        	
	        	return;
	        }
	    };
		
		
		$.ajax({
			url:"/member/addidentity",
			type: "POST",
			data:$("#fm01").serialize(),
			success : function(){
				alert("신원인증이 완료되었습니다.");
				location.reload();
			},
			error : function() {
				alert("오류발생");
			}
		});
		
		
		
		
	});
	
	
	
	
	
	
		
	//----------------------------------------------------------------------
	
		//계좌등록 버튼 클릭
		$('.bank').click(function(){
			
			function validateForm(){
				
			var bankname = document.getElementById('bankname').value;
			var bankaccount = document.getElementById('bankaccount').value;
			 if(bankname==""){
				 alert("예금주를 입력하세요.");
				 return false;
				 }
			 if(bankaccount==""){
				 alert("계좌번호를 입력하세요.");
				 return false;
				 }
			
			}
			
			
			var tmpResult = validateForm();
		    if(tmpResult == false){
		        	
		        return false;		    	
		    }    

		    document.getElementById('fm01').onsubmit = function(e) {
		        e.preventDefault(); // 기본 폼 제출 동작 방지

		        if (!validateForm()) {
		        	return;
		        }
		    };
			
			
			 
			$.ajax({
				url:"/member/bank",
				type: "POST",
				data:$("#fm01").serialize(),
				success : function(){
					alert("계좌가 등록되었습니다.");
					location.reload();
				},
				error : function() {
					alert("오류발생");
				}
			});

		});
		
		
		
	});

	$('#select_type').val('${sessionScope.user_type}');
	
	// 전화번호를 xxx-xxxx-xxxx 형식으로 만들어 줌.
	function num_mask(objValue) {
	 var v = objValue.replace("--", "-");

	    if (v.match(/^\d{3}$/) !== null) {
	        v = v + '-';
	    } else if (v.match(/^\d{3}\-\d{4}$/) !== null) {
	        v = v + '-';
	    }
	 
	    return v;
	}
	
// 	function jumin_mask(objValue) {
// 	 var ju = objValue.replace("--", "-");

// 	    if (ju.match(/^\d{6}$/) !== null) {
// 	        ju = ju + '-';
// 	    }
	 
// 	    return ju;
// 	}
	
	
</script>

<%@ include file="../include/footer.jsp" %>
