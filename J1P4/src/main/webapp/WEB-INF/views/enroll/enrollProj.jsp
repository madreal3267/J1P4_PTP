<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

body {
	font-family: "Nanum Gothic", sans-serif !important;
}

h2 {
	font-weight: bolder !important;
}

h5 {
	color: gray !important;
}
</style>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js'
	integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=='
	crossorigin='anonymous'></script>
<link href="../resources/css/enrollProj.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>프로젝트 등록 페이지</title>
</head>
<body>
	<h1>프로젝트 등록하기 (enrollProj.jsp)</h1>

	<hr>

	<div>
		임시 저장 프로젝트를 불러오거나, 등록했던 프로젝트를 다시 등록해 보세요. <a href="">프로젝트 선택하기 ></a>
	</div>

	<hr>

	<form action="/enroll/enrollProj" method="post" id="fm1" name="fm1">
		<input type="hidden" value="user_10" name="user_id"> <input
			type="hidden" value=119 name="proj_no">

		<!-- 사용자 아이디 정보 저장 -> ct_no 저장에 필요 -> 세션 담아와서 value 값에 담기 -->

		<h2>어떤 프로젝트 업무를 맡기고 싶으신가요?</h2>
		<h5>나중에 변경 가능하니 걱정하지 마세요</h5>
		<input type="radio" value="개발" class="btn-check" name="work_field"
			id="radioWf1"> <label class="btn btn-outline-dark"
			for="radioWf1">⚙️ 개발</label> <input type="radio" value="기획"
			class="btn-check" name="work_field" id="radioWf2"> <label
			class="btn btn-outline-dark" for="radioWf2">🛠️ 기획</label> <input
			type="radio" value="디자인" class="btn-check" name="work_field"
			id="radioWf3"> <label class="btn btn-outline-dark"
			for="radioWf3">🎨 디자인</label> <input type="radio" value="퍼블리싱"
			class="btn-check" name="work_field" id="radioWf4"> <label
			class="btn btn-outline-dark" for="radioWf4">🖋️ 퍼블리싱</label>

		<hr>
		<h2>프로젝트 진행 분류</h2>
		<input type="text" name="proj_title" placeholder="프로젝트 제목을 입력해주세요"
			style="width: 500px">

		<hr>
		<h2>프로젝트를 간단하게 알려주세요</h2>
		<input type="radio" name="proj_progress" value=0 id="radioPj1">
		<label for="radioPj1">신규 프로젝트를 진행하려 합니다</label><br> <input
			type="radio" name="proj_progress" value=1 id="radioPj2"> <label
			for="radioPj2">운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다</label>

		<hr>
		<h2>예상 시작일</h2>
		<h5>
			프리랜서가 프로젝트에 착수하는 날짜입니다.<br> 해당 날짜에 프로젝트 시작이 가능한 프리랜서들이 지원하게 됩니다.
		</h5>
		<input type="date" name="start_date" style="width: 200px"> <br>
		<input type="checkbox" name="date_nego" value=1 id="ckDate"> <label
			for="ckDate">프로젝트 착수 일자의 협의가 가능합니다.</label>

		<hr>
		<h2>예상 진행 기간</h2>
		<h5>프로젝트 진행 기간을 입력해 주세요.</h5>
		<input type="text" name="work_period"> 일

		<hr>
		<h2>모집 인원</h2>
		<h5>프로젝트에 필요한 인원을 입력해 주세요.</h5>
		<input type="text" name="no_recruited"> 명

		<hr>
		<h2>모집 마감일</h2>
		<h5>
			프리랜서 모집을 마감할 날짜입니다.<br> 해당 날짜에 프리랜서 모집이 자동으로 종료됩니다.
		</h5>
		<input type="date" name="deadline" style="width: 200px"> <br>

		<hr>
		<h2>작업 단가</h2>
		<h5>프로젝트에 지출 가능한 예산을 입력해 주세요.</h5>
		<input type="text" name="proj_cost"> 원 <br> <input
			type="checkbox" name="cost_nego" value=1 id="ckNego"> <label
			for="ckNego">입력한 예산에서 조율이 가능합니다.</label>

		<hr>
		<h2>사전 미팅 방식</h2>
		<h5>클라이언트님에게 편한 미팅 방식으로 프리랜서와의 미팅 조율을 도와드립니다.</h5>
		<input type="radio" name="pmeet_meth" value="온라인" id="radioPme1">
		<label for="radioPme1">온라인 (카카오톡, 화상미팅 등)</label> <br> <input
			type="radio" name="pmeet_meth" value="오프라인" id="radioPme2"> <label
			for="radioPme2">오프라인</label>

		<hr>
		<h2>프로젝트 진행 중 미팅</h2>
		<h5>미팅 방식</h5>
		<input type="radio" name="meet_meth" value="온라인" id="radioMe1">
		<label for="radioMe1">온라인 (카카오톡, 화상미팅 등)</label> <br> <input
			type="radio" name="meet_meth" value="오프라인" id="radioMe2"> <label
			for="radioMe2">오프라인</label>
		<h5>미팅 주기</h5>
		<input type="radio" name="meet_cycle" value="주 1회" id="radioCy1">
		<label for="radioCy1">주 1회</label> <br> <input type="radio"
			name="meet_cycle" value="주 2회" id="radioCy2"> <label
			for="radioCy2">주 2회</label> <br> <input type="radio"
			name="meet_cycle" value="필요시 요청" id="radioCy3"> <label
			for="radioCy3">필요시 요청</label>

		<hr>
		<h2>클라이언트 위치</h2>
		<h5>프리랜서가 미팅 위치 선정시 클라이언트님의 위치를 참고합니다.</h5>
		<select name='region' onchange="change(this.selectedIndex);"
			class=input>
			<option value='전체'>전체</option>
			<option value='서울'>서울특별시</option>
			<option value='부산'>부산광역시</option>
			<option value='대구'>대구광역시</option>
			<option value='인천'>인천광역시</option>
			<option value='광주'>광주광역시</option>
			<option value='대전'>대전광역시</option>
			<option value='울산'>울산광역시</option>
			<option value='경기'>경기도</option>
			<option value='강원'>강원도</option>
			<option value='충북'>충청북도</option>
			<option value='충남'>충청남도</option>
			<option value='전북'>전라북도</option>
			<option value='전남'>전라남도</option>
			<option value='경북'>경상북도</option>
			<option value='경남'>경상남도</option>
			<option value='제주'>제주도</option>
		</select> <select name='district' class=select>
			<option value=''>전체</option>
		</select>

		<hr>
		<h2>프로젝트 상세 내용</h2>
		<h5>프리랜서의 담당역할 및 업무범위를 입력해 주세요.</h5>
		<textarea rows="10" cols="60" name="proj_content"></textarea>

		<hr>
		<h2>주요 기술 스택</h2>
		<h5>프리랜서가 필수로 보유해야하는 기술을 입력해 주세요.</h5>
		<div class="btn-group" role="group"
			aria-label="Basic checkbox toggle button group">
			<select name="skill_nm" id="skillSelect">
				<option></option>
				<option value="자바">자바</option>
				<option value="파이썬">파이썬</option>
				<option value="CSS">CSS</option>
				<option value="MySQL">MySQL</option>
			</select> <select name="skill_lev" id="levSelect">
				<option></option>
				<option value="초급">초급</option>
				<option value="중급">중급</option>
				<option value="고급">고급</option>
			</select>
		</div>

		<input type="button" value="추가하기" id="addButt">
		<!-- 	값을 선택했을 때 뷰페이지에 출력되는 기능 찾아보기 - 공통 코드 엮기 -->

		<hr>
		<h2>구인 등급</h2>
		<h5>프리랜서의 레벨을 선택해 주세요.</h5>
		<div class="btn-group" role="group"
			aria-label="Basic checkbox toggle button group">
			<input type="radio" value="주니어" class="btn-check" name="job_level"
				id="radioLev1"> <label class="btn btn-outline-dark"
				for="radioLev1">주니어</label> <input type="radio" value="미들"
				class="btn-check" name="job_level" id="radioLev2"> <label
				class="btn btn-outline-dark" for="radioLev2">미들</label> <input
				type="radio" value="시니어" class="btn-check" name="job_level"
				id="radioLev3"> <label class="btn btn-outline-dark"
				for="radioLev3">시니어</label>
		</div>

		<hr>
		<h2>희망 경력</h2>
		<h5>희망하는 프리랜서의 경력을 입력해 주세요.</h5>
		<input type="text" name="wanted_career"> 년

		<hr>
		<h2>경력 증빙 자료</h2>
		<div class="btn-group" role="group"
			aria-label="Basic checkbox toggle button group">
			<input type="radio" value=1 class="btn-check" name="career_proof"
				id="radioCp1"> <label class="btn btn-outline-dark"
				for="radioCp1">필수</label> <input type="radio" value=0
				class="btn-check" name="career_proof" id="radioCp2"> <label
				class="btn btn-outline-dark" for="radioCp2">무관</label>
		</div>

		<hr>
		<h2>전달사항 또는 우대사항</h2>
		<h5>프리랜서 어쩌고 저쩌고 우짤</h5>
		<textarea rows="10" cols="60" name="dlvy_msg"></textarea>

		<hr>
<!-- 		<button type="button" id="saveButt" onclick="saveTemp()">임시저장</button> -->
		<input type="button" id="saveButt" value="임시저장"> <input
			type="submit" value="등록">

	</form>
	<!-- 폼 태그 끝 -->

	<!-- select2 (검색되는 select) 자바스크립트 -->
	<script
		src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<!-- 부트스트랩 자바스크립트 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		/* 시군구 - select */
		var cnt = new Array();

		cnt[0] = new Array('전체');
		cnt[1] = new Array('전체', '강남구', '강동구', '강북구', '강서구', '관악구', '광진구',
				'구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
				'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구',
				'중구', '중랑구');
		cnt[2] = new Array('전체', '강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구',
				'사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구', '기장군');
		cnt[3] = new Array('전체', '남구', '달서구', '동구', '북구', '서구', '수성구', '중구',
				'달성군');
		cnt[4] = new Array('전체', '계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구',
				'중구', '강화군', '옹진군');
		cnt[5] = new Array('전체', '광산구', '남구', '동구', '북구', '서구');
		cnt[6] = new Array('전체', '대덕구', '동구', '서구', '유성구', '중구');
		cnt[7] = new Array('전체', '남구', '동구', '북구', '중구', '울주군');
		cnt[8] = new Array('전체', '고양시', '과천시', '광명시', '구리시', '군포시', '남양주시',
				'동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안양시', '오산시', '의왕시',
				'의정부시', '평택시', '하남시', '가평군', '광주시', '김포시', '안성시', '양주군', '양평군',
				'여주군', '연천군', '용인시', '이천군', '파주시', '포천시', '화성시');
		cnt[9] = new Array('전체', '강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시',
				'태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군',
				'홍천군', '화천군', '황성군');
		cnt[10] = new Array('전체', '제천시', '청주시', '충주시', '괴산군', '단양군', '보은군',
				'영동군', '옥천군', '음성군', '진천군', '청원군');
		cnt[11] = new Array('전체', '공주시', '보령시', '서산시', '아산시', '천안시', '금산군',
				'논산군', '당진군', '부여군', '서천군', '연기군', '예산군', '청양군', '태안군', '홍성군');
		cnt[12] = new Array('전체', '군산시', '김제시', '남원시', '익산시', '전주시', '정읍시',
				'고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군');
		cnt[13] = new Array('전체', '광양시', '나주시', '목포시', '순천시', '여수시', '여천시',
				'강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '여천군',
				'영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군');
		cnt[14] = new Array('전체', '경산시', '경주시', '구미시', '김천시', '문겅시', '상주시',
				'안동시', '영주시', '영천시', '포항시', '고령군', '군위군', '봉화군', '성주군', '영덕군',
				'영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군');
		cnt[15] = new Array('전체', '거제시', '김해시', '마산시', '밀양시', '사천시', '울산시',
				'진주시', '진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '양산시',
				'의령군', '창녕군', '하동군', '함안군', '함양군', '합천군');
		cnt[16] = new Array('전체', '서귀포시', '제주시', '남제주군', '북제주군');

		function change(add) {

			var sel = document.fm1.district

			/* 옵션메뉴삭제 */
			for (i = sel.length - 1; i >= 0; i--) {
				sel.options[i] = null
			}
			/* 옵션박스추가 */
			for (i = 0; i < cnt[add].length; i++) {
				sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
			}
		}

		/* 주요기술 스택 - select2(검색되는 select) 적용 */
		$(document).ready(function() {
			$('#skillSelect').select2();
		});

		$(document).ready(function() {
			$('#skillSelect').select2({
				placeholFder : "스킬을 선택해주세요."
			});

		});

		/* 임시저장 기능 구현 */
		var data;
		if(!data) {
			$(function() {
				$("#saveButt").click(function() {
					$.ajax({
						url : "/enroll/saveProj",
						type : "POST",
						data : $("#fm1").serialize(),
						dataType : 'json',
						async : false,
						success : function(result) {
							alert(" ╰(*°▽°*)╯ 저장 완료");
							data = result;
						},
						error : function() {
							alert("오류발생");
						}
					});
				});
			});	
		} else {
			$(function() {
				$("#saveButt").click(function() {
					$.ajax({
						url : "/enroll/multiSaveProj",
						type : "POST",
						data : $("#fm1").serialize(),
						success : function() {
							alert(" ╰(*°▽°*)╯ 최초 임시저장 후 저장 완료");
						},
						error : function() {
							alert("오류발생");
						}
					});
				});
			});
		}
	</script>
</body>
</html>