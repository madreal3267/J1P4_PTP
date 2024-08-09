<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script> <!-- ajax이용시 제이쿼리cnd 사용 -->

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
<%-- user_id: ${sessionScope.user_id }, --%>
<%-- user_cf: ${sessionScope.user_cf }, --%>
<%-- user_type: ${sessionScope.user_type }, --%>
<%-- free_no: ${sessionScope.free_no }, --%>
<%-- ct_no: ${sessionScope.ct_no } --%>

<!-- ============== 페이지 시작 ================= -->
<form role="form" action="/member/account" method="post" name="account_form" id="fm02">
<input type="hidden" value="${sessionScope.user_id }" name="user_id" id="userId">

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">
  
  <!-- 사이드 메뉴 필요할 경우 사용 -->
   <div class="col-md-3 pt-0">
      <div class="list-group list-group-flush account-settings-links" style="width:274px;">
         <h4 class="font-weight-bold py-1 mx-4 my-3">계정설정</h4>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example1">계정설정</a>
<!--          <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example2">UI 예시용2</a> -->
<!--          <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example3">UI 예시용3</a> -->
      </div>
   </div>
   <!-- 사이드 메뉴 끝 -->
      
   <div class="col-md-9">
   <div class="tab-content">
   
   
   
      <!-- UI 예시용1 탭 시작 -->
      <div class="tab-pane fade active show" id="ui_example1"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">계정설정</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
         
        <input type="hidden" value="${sessionScope.user_id}" name="user_id2">
		<div class="box-body">
		<div class="form-group">
		<label for="exampleInputEmail1">아이디</label>
		<input type="text" class="form-control" id="exampleInputEmail1" placeholder="ID" value="${sessionScope.user_id}" readonly="readonly">
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
		<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="Password">
		</div>
		
		<button type="button" id="passwordButton" >수정</button>
		<br>
		<br>
		<!-- div사이에 새비밀번호, 새비밀번호 확인, 취소, 수정버튼이 들어가 있음 -->
		<div class="inputType"></div> 
		
		
		
		<br>
		<div class="form-group">
		<label for="exampleInputEmail1">연락처</label>
		<input type="text" class="form-control" id="exampleInputEmail1" name="phone_no" placeholder="phoneNumber">
		</div>
		<button type="button" name="phone_no" id="phoneButton">수정</button>
		
		</div>
		<br>
		<br>
		회원탈퇴 
		<div class="passCheck">
		<label for="exampleInputPassword1">비밀번호 입력</label>
        <input type="password" placeholder="Password" name="user_pw1" id="pass" >'
        <button type="button" id="bye">확인</button>
		</div>
         
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- UI 예시용1 탭 끝 -->
      
     		 <div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			 </div>
   
   
   
   </div>
   </div>
   
  </div>
 </div>
</div>
</form>

<script type="text/javascript">
/* 비밀번호 수정 버튼을 눌렀을때
passwordButton = 수정 버튼
currpass = 현재비밀번호 id값
*/
$(document).ready(function() {
    $('#passwordButton').click(function() {
    	
//         var passwordButton = $(this).val(); // 버튼의 값을 가져옴
        var userpw = $('#user_pw').val(); // 비밀번호 값을 가져옴
        //alert(userpw);
        var userid = $("#userId").val(); //아이디 값을 가져옴
        //alert(userid)
        $.ajax({
            url: "/member/nowPass",
            type: "post",
            data: { user_id : userid , user_pw: userpw }, // 비밀번호와 아이디값을 전송함
            success: function(member) {
            	//alert(member);
                if (member==1) { //비밀번호가 일치하면 1 불일치면 0
                	alert("변경할 비밀번호를 입력해 주세요.");
                    $('.inputType').html(
                        '<div class="form-group">' +
                        '<label for="exampleInputPassword1">비밀번호 변경</label>' +
                        '<input type="password" class="form-control" id="newpass" placeholder="Password" name="user_pw1">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="exampleInputPassword1">비밀번호 변경 확인</label>' +
                        '<input type="password" class="form-control" id="newpasscheck" placeholder="PasswordCheck" name="user_pw2">' +
                        '</div>' +
                        '<button type="submit" id="cancelButton">취소</button>' +
                        '<button type="button" id="passChange">저장</button>'
                    );
                } else if(member==0) {
                    alert("비밀번호를 다시 확인하세요");
                }
            },
            error: function(request, error) {
                alert("에러");
            }
        });
    });
    
    
    // 이벤트 위임을 사용하여 동적으로 생성된 버튼에 이벤트 바인딩
    $(document).on('click', '#passChange', function() {
        var newPassword = $('#newpass').val();
        var confirmPassword = $('#newpasscheck').val();

        if (newPassword === '' || confirmPassword === '') {
            alert("모든 필드를 입력해 주세요.");
            return false;
        }

        if (newPassword !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        // 비밀번호 변경 로직 수행 (예: 서버로 AJAX 요청 등)
        alert("비밀번호가 변경ㅇㅇ");
        // 서버로 AJAX 요청을 통해 비밀번호를 변경하는 로직을 여기에 추가
        $.ajax({
			url:"/member/changePass",
			type: "POST",
			data:$("#fm02").serialize(),
			success : function(){
				alert("비밀번호가 변경 되었습니다.");
				location.reload();
			},
			error : function() {
				alert("오류발생");
			}
		});
        
        
        
    });

    // 취소 버튼에 대한 이벤트 처리 (옵션)
    $(document).on('click', '#cancelButton', function() {
        $('.inputType').html(''); // 입력 필드 초기화 또는 다른 작업 수행
    });


});
    
    



	//폰번호 수정
	$('#phoneButton').click(function(){
		alert("수정되었습니다.");
		
// 		$('#phoneButton').attr("type","submit");
// 		location.href = '/member/account';

		 $.ajax({
				url:"/member/phone",
				type: "POST",
				data:$("#fm02").serialize(),
				success : function(){
					alert("연락처가 수정되었습니다.");
					location.reload();
				},
				error : function() {
					alert("오류발생");
				}
			});
	

		
	});
	
	

	//탈퇴
	$('#bye').click(function(){
		alert("탈퇴");
// 		$("form[role='form']").attr("action","/member/delete");
// 		$("form[role='form']").submit();
		
		 $.ajax({
				url:"/member/delete",
				type: "POST",
				data:$("#fm02").serialize(),
				success : function(){
					alert("탈퇴완료");
					location.reload();
				},
				error : function() {
					alert("오류발생");
				}
			});
	
		
	
		
	});
      





</script>





    
<%@ include file="../include/footer.jsp" %>


