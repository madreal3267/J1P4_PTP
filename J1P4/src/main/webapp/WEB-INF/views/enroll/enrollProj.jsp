<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body {
font-family: "Nanum Gothic", sans-serif !important;
}
</style>
<link href="../resources/css/main.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>프로젝트 등록 페이지</title>
</head>
<body>
	<h1>enrollProj.jsp</h1>
	
	<form action="/enroll/enrollProj" method="post" name="sub1">
	<h2><b>어떤 프로젝트 업무를 맡기고 싶으신가요?</b></h2>
	<h3>나중에 변경 가능하니 걱정하지 마세요</h3>

	  <input type="radio" value="개발" class="btn-check" name="work_field" id="btnradio1">
	  <label class="btn btn-outline-dark" for="btnradio1">⚙️ 개발</label>
	
	  <input type="radio" value="기획" class="btn-check" name="work_field" id="btnradio2">
	  <label class="btn btn-outline-dark" for="btnradio2">🛠️ 기획</label>
	  
	  <input type="radio" value="디자인" class="btn-check" name="work_field" id="btnradio3">
	  <label class="btn btn-outline-dark" for="btnradio3">🎨 디자인</label>
	
	  <input type="radio" value="퍼블리싱" class="btn-check" name="work_field" id="btnradio4">
	  <label class="btn btn-outline-dark" for="btnradio4">🖋️ 퍼블리싱</label>
	
	<hr>
	<h2><b>프로젝트 진행 분류</b></h2>
	  <input type="text" name="proj_title" placeholder="프로젝트 제목을 입력해주세요" style="width: 500px" id="butt">
	
	<hr>
	<h2><b>프로젝트를 간단하게 알려주세요</b></h2>
	  <input type="radio" name="proj_progress" value=0> 신규 프로젝트를 진행하려 합니다 <br>
	  <input type="radio" name="proj_progress" value=1> 운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다

	<hr>
	<h2><b>예상 시작일</b></h2>
	<h3>프리랜서가 프로젝트에 착수하는 날짜입니다.<br>
	해당 날짜에 프로젝트 시작이 가능한 프리랜서들이 지원하게 됩니다. </h3>
	  <input type="date" name="start_date" style="width: 200px"> <br>
	  <input type="checkbox" name="date_nego" value=1> 프로젝트 착수 일자의 협의가 가능합니다.
	
	<hr>
	<h2><b>예상 진행 기간</b></h2>
	<h3>프로젝트 진행 기간을 입력해 주세요.</h3>
	  <input type="text" name="work_period"> 일
	  <!-- 	400 에러 발생 : number 태그에서 발생 => text 태그로 교체 -->
	  
	<hr>
	<h2><b>모집 인원</b></h2>
	<h3>프로젝트에 필요한 인원을 입력해 주세요.</h3>
	  <input type="text" name="no_recruited"> 명
	  
	<hr>
	<h2><b>모집 마감일</b></h2>
	<h3>프리랜서 모집을 마감할 날짜입니다.<br>
	해당 날짜에 프리랜서 모집이 자동으로 종료됩니다. </h3>
	  <input type="date" name="deadline" style="width: 200px"> <br>
	  
	<hr>
	<h2><b>작업 단가</b></h2>
	<h3>프로젝트에 지출 가능한 예산을 입력해 주세요.</h3>
	  <input type="text" name="proj_cost"> 원 <br>
	  <input type="checkbox" name="cost_nego" value=1> 입력한 예산에서 조율이 가능합니다.
	  
	<hr>
	<h2><b>사전 미팅 방식</b></h2>
	<h3>클라이언트님에게 편한 미팅 방식으로 프리랜서와의 미팅 조율을 도와드립니다.</h3>
	  <input type="radio" name="pmeet_meth" value="온라인"> 온라인 (카카오톡, 화상미팅 등) <br>
	  <input type="radio" name="pmeet_meth" value="오프라인"> 오프라인
	  
	<hr>
	<h2><b>프로젝트 진행 중 미팅</b></h2>
	<h3>미팅 방식</h3>
	  <input type="radio" name="meet_meth" value="온라인"> 온라인 (카카오톡, 화상미팅 등) <br>
	  <input type="radio" name="meet_meth" value="오프라인"> 오프라인
	<h3>미팅 주기</h3>
	  <input type="radio" name="meet_cycle" value="주 1회"> 주 1회 <br>
	  <input type="radio" name="meet_cycle" value="주 2회"> 주 2회 <br>
	  <input type="radio" name="meet_cycle" value="필요시 요청"> 필요시 요청
	  
	<hr>
	<h2><b>클라이언트 위치</b></h2>
	<h3>프리랜서가 미팅 위치 선정시 클라이언트님의 위치를 참고합니다.</h3>
	시/도 시/군/구 드롭다운 기능 구현 찾아보기 - 공통 코드 엮기
	
<!-- 	<hr> -->
<!-- 	<h2><b>프로젝트 상세 내용</b></h2> -->
<!-- 	<h3>프리랜서의 담당역할 및 업무범위를 입력해 주세요.</h3> -->
<!-- 	  <textarea rows="10" cols="60" name="proj_content"></textarea> -->
<!-- 	400 에러 발생 : textarea 태그에서 발생 중 -->
	
	<hr>
	<h2><b>주요 기술 스택</b></h2>
	<h3>프리랜서가 필수로 보유해야하는 기술을 입력해 주세요.</h3>
	값을 선택했을 때 뷰페이지에 출력되는 기능 찾아보기 - 공통 코드 엮기
	 
	<hr>
	<h2><b>구인 등급</b></h2>
	<h3>프리랜서의 레벨을 선택해 주세요.</h3>
	 <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group"> 
	  <input type="radio" value="주니어" class="btn-check" name="job_level" id="btnradio5" autocomplete="off">
	  <label class="btn btn-outline-dark" for="btnradio5">주니어</label>
	
	  <input type="radio" value="미들" class="btn-check" name="job_level" id="btnradio6" autocomplete="off">
	  <label class="btn btn-outline-dark" for="btnradio6">미들</label>
	  
	  <input type="radio" value="시니어" class="btn-check" name="job_level" id="btnradio7" autocomplete="off">
	  <label class="btn btn-outline-dark" for="btnradio7">시니어</label>
	 </div>
	  
	<hr>
	<h2><b>희망 경력</b></h2>
	<h3>희망하는 프리랜서의 경력을 입력해 주세요.</h3>
	  <input type="text" name="wanted_career"> 년
	  
	<hr>
	<h2><b>경력 증빙 자료</b></h2>
	 <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group"> 
	  <input type="radio" value=1 class="btn-check" name="career_proof" id="btnradio8" autocomplete="off">
	  <label class="btn btn-outline-dark" for="btnradio8">필수</label>
	
	  <input type="radio" value=0 class="btn-check" name="career_proof" id="btnradio9" autocomplete="off">
	  <label class="btn btn-outline-dark" for="btnradio9">무관</label>
	 </div>
	  
	<hr>
<!-- 	<h2><b>전달사항 또는 우대사항</b></h2> -->
<!-- 	<h3>프리랜서 어쩌고 저쩌고 우짤</h3> -->
<!-- 	  <textarea rows="10" cols="60" name="dlvy_msg"></textarea><br> -->
	  	  
	<hr>
	  <input type="button" value="임시저장" id="btn_submit">
	  <!-- 임시저장 기능은 임시저장 테이블을 만들려고 했지만
	  본테이블(Project)에 데이터를 저장하고 임시저장여부 컬럼을 추가하는 것이 좋다는 글을 봄
	  참고링크 : https://okky.kr/questions/1033588
	  -->
	  <input type="submit" value="등록">
	  
	  <input type="hidden" value="user10" name="user_id">
	  
	</form>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="../resources/js/enrollPro.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
	$(function(){
		
		$("#btn_submit").click(function(){
			
			var formData = $("sub1").serialize();
			
			$.ajax({
				type:"POST",
				data:formData,
				url:"/enroll/enrollProj",
				dataType:"text",
				success: function(result) { //controller에서 return받은 message부분임
					if(result == "ok"){
						alert("저장 완료");
					}else{
						alert("저장실패");
					}
				},
			    error: function() { //시스템에러
			    	alert("오류발생");
				}
			});
			
		});
		
	});
	</script>
</body>
</html>