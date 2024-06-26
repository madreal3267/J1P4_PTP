<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

	<div class="container light-style flex-grow-1 container-p-y text-center" style="width:1100px;padding-top:15px;">
	<div class="alert alert-light mt-3 card-2">
		임시 저장 프로젝트를 불러오거나, 등록했던 프로젝트를 다시 등록해 보세요. <a class="alert-link" href="">프로젝트 선택하기 ></a>
		</div>
	</div>

	<form action="/enroll/enrollProj" method="post" id="fm1" name="fm1" class="fm">
		<input type="hidden" value="${sessionScope.user_id }" name="user_id">
		<input type="hidden" value="" name="temporary" class="temporary">
	
<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">	
  
  <!-- 사이드 메뉴 시작 -->
	<div class="col-md-3 pt-0">
		<div class="list-group list-group-flush account-settings-links" style="width:274px;">
			<h4 class="font-weight-bold py-1 mx-4 my-3">프로젝트 등록하기</h4>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_title">프로젝트 등록</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_basic">기본 정보</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_detail">상세 정보</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_hope">지원자 희망 조건</a>
		</div>
	</div>
	<!-- 사이드 메뉴 끝 -->
	
		
	<div class="col-md-9">
	<div class="tab-content">
		
		<!-- 프로젝트 등록하기 탭 시작 -->
		<div class="tab-pane fade active show" id="proj_title"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
			</div>
		
		<div class="mx-4 my-3">
		<div class="gap">
		<h5>어떤 프로젝트 업무를 맡기고 싶으신가요?</h5>
		<h6>나중에 변경 가능하니 걱정하지 마세요</h6>
		<input type="radio" value="개발" name="work_field" class="btn-check" id="radioWf1" >
		<label for="radioWf1" class="btn btn-outline-dark wfRadio" >⚙️ 개발</label>
		<input type="radio" value="기획" name="work_field" class="btn-check" id="radioWf2">
		<label for="radioWf2" class="btn btn-outline-dark wfRadio">🛠️ 기획</label>
		<input type="radio" value="디자인" name="work_field" class="btn-check" id="radioWf3">
		<label for="radioWf3" class="btn btn-outline-dark wfRadio">🎨 디자인</label>
		<input type="radio" value="퍼블리싱" name="work_field" class="btn-check" id="radioWf4">
		<label for="radioWf4" class="btn btn-outline-dark wfRadio">🖋️ 퍼블리싱</label>
		<br>
		<span class="tell hide"></span>
		</div>
		<hr>
		<div class="gap">
		<h5 style="margin-bottom:15px;">프로젝트를 간단하게 알려주세요</h5>
		<input type="text" name="proj_title" value="${resultProj.proj_title}" placeholder="프로젝트 제목을 입력해주세요" style="width: 710px" id="proj_title">
		</div>
		<hr>
		<div class="my-3" style="text-align: right;" >
		<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_basic">
		<button type="button" class="btn btn-dark" onclick="scrollTopAbs()">다음</button>
		</a>
		</div>
		</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 프로젝트 등록하기 탭 끝 -->
		
		
		<!-- 기본 정보 탭 시작 -->
		<div class="tab-pane fade" id="proj_basic">
		<!-- card body 시작 -->
		<div class="card-body pb-2 border-start">
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">기본 정보</h4>
			</div>
		<div class="mx-4 my-3">	
		<div class="gap">
		<h5 style="margin-bottom:15px;">프로젝트 진행 분류</h5>
		<input type="radio" value=0 name="proj_progress" id="radioPj1">
		<label for="radioPj1">신규 프로젝트를 진행하려 합니다</label><br>
		<div class="checkGap">
		<input type="radio" value=1 name="proj_progress" id="radioPj2">
		<label for="radioPj2">운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다</label>
		</div>
		</div>
		
		<hr>
		<div class="gap">
		<h5>예상 시작일</h5>
		<h6>프리랜서가 프로젝트에 착수하는 날짜입니다.<br>
		해당 날짜에 프로젝트 시작이 가능한 프리랜서들이 지원하게 됩니다.</h6>
		<input type="date" name="start_date" style="width: 200px" value="${resultProj.start_date}"> <br>
		<div class="checkGap">
		<input type="checkbox" name="date_nego" value=1 id="ckDate">
		<label for="ckDate">프로젝트 착수 일자의 협의가 가능합니다.</label>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>예상 진행 기간</h5>
		<h6>프로젝트 진행 기간을 입력해 주세요.</h6>
		<input type="number" name="work_period" value="${resultProj.work_period}"> 일
		</div>
		<hr>
		<div class="gap">
		<h5>모집 인원</h5>
		<h6>프로젝트에 필요한 인원을 입력해 주세요.</h6>
		<input type="number" name="no_recruited" value="${resultProj.no_recruited}"> 명
		</div>
		<hr>
		<div class="gap">
		<h5>모집 마감일</h5>
		<h6>프리랜서 모집을 마감할 날짜입니다.<br> 해당 날짜에 프리랜서 모집이 자동으로 종료됩니다.</h6>
		<input type="date" name="deadline" style="width: 200px" value="${resultProj.deadline}"> <br>
		</div>
		<hr>
		<div class="gap">
		<h5>작업 단가</h5>
		<h6>프로젝트에 지출 가능한 예산을 입력해 주세요.</h6>
		<input type="number" name="proj_cost" value="${resultProj.proj_cost}"> 원 <br>
		<div class="checkGap">
		<input type="checkbox" name="date_nego" value=1 id="ckDate">
		<label for="ckNego">입력한 예산에서 조율이 가능합니다.</label>
		</div>
		</div>
		<hr>
		<div class="my-3" style="text-align: right;" >
		<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_detail">
		<button type="button" class="btn btn-dark" onclick="scrollTopAbs()">다음</button>
		</a>
		</div>
		</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 기본 정보 탭 끝 -->
		
		
		<!-- 상세 정보 탭 시작 -->
		<div class="tab-pane fade" id="proj_detail">
		<!-- card body 시작 -->
		<div class="card-body border-start">
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">상세 정보</h4>
			</div>
		<div class="mx-4 my-3">
		<div class="gap">
		<h5>사전 미팅 방식</h5>
		<h6>클라이언트님에게 편한 미팅 방식으로 프리랜서와의 미팅 조율을 도와드립니다.</h6>
		<input type="radio" value="온라인" name="pmeet_meth" id="radioPme1">
		<label for="radioPme1">온라인 (카카오톡, 화상미팅 등)</label> <br>
		<div class="checkGap">
		<input type="radio" value="오프라인" name="pmeet_meth" id="radioPme2">
		<label for="radioPme2">오프라인</label>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>프로젝트 진행 중 미팅</h5>
		<h6>미팅 방식</h6>
		<input type="radio" value="온라인" name="meet_meth" id="radioMe1">
		<label for="radioMe1">온라인 (카카오톡, 화상미팅 등)</label> <br>
		<div class="checkGap">
		<input type="radio" value="오프라인" name="meet_meth" id="radioMe2">
		<label for="radioMe2">오프라인</label>
		</div>
		</div>
		<div class="gap">
		<h6>미팅 주기</h6>
		<input type="radio" value="주 1회" name="meet_cycle" id="radioCy1" >
		<label for="radioCy1">주 1회</label> <br>
		<div class="checkGap">
		<input type="radio" value="주 2회" name="meet_cycle" id="radioCy2">
		<label for="radioCy2">주 2회</label> <br>
		</div>
		<div class="checkGap">
		<input type="radio" value="필요시 요청" name="meet_cycle" id="radioCy3">
		<label for="radioCy3">필요시 요청</label>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>클라이언트 위치</h5>
		<h6>프리랜서가 미팅 위치 선정시 클라이언트님의 위치를 참고합니다.</h6>
		<select name='region' onchange="change(this.selectedIndex);" class=input>
			<option value=''>전체</option>
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
		</select>
		<select name='district' class=select>
			<option value=''>전체</option>
		</select>
		</div>
		<div class="gap">
		<hr>
		<h5>프로젝트 상세 내용</h5>
		<h6>프리랜서의 담당역할 및 업무범위를 입력해 주세요.</h6>
		<textarea cols="84" rows="10" name="proj_content"><c:out value="${resultProj.proj_content}"/></textarea>
		</div>
		<hr>
		<div class="my-3" style="text-align: right;" >
		<a class="list-group-item list-group-item-action" data-toggle="list" href="#proj_hope">
		<button type="button" class="btn btn-dark" onclick="scrollTopAbs()">다음</button>
		</a>
		</div>
		</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 상세 정보 탭 끝 -->
		
		<!-- 지원자 희망 탭 시작 -->
		<div class="tab-pane fade" id="proj_hope">
		<!-- card body 시작 -->
		<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">지원자 희망 조건</h4>
			</div>
		<div class="mx-4 my-3">	
		<div class="gap">
		<h5>주요 기술 스택</h5>
		<h6>프리랜서가 필수로 보유해야하는 기술을 입력해 주세요.</h6>
		<div class="listPt"></div>
		<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간 -->
		
		<c:forEach var="sk" items="${resultSk }">
		<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">
		<button class="removeButt btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>
		<input type="hidden" value="${sk.skill_nm }" name="skill_nm"><input type="hidden" value="${sk.skill_lev }" name="skill_lev">
		<div style="padding-bottom:5px;"><span style="padding-left: 20px; font-size: 22px; font-weight: bold;">${sk.skill_nm }</span><br></div>
		<span style="padding-left: 20px;"> 레벨 : ${sk.skill_lev }</span></div></p>
		</c:forEach>
		<!-- 유저가 임시저장한 스킬 리스트 출력되는 공간 -->
		
		<div id="inputPt"></div>
		<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
		<div class="checkGap">
		<div role="button" class="addSkill">+ 보유기술 추가</div>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>구인 등급</h5>
		<h6>프리랜서의 레벨을 선택해 주세요.</h6>
		<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="radio" value="주니어" name="job_level" class="btn-check" id="radioLev1">
			<label for="radioLev1" class="btn btn-outline-dark radioLv">주니어</label>
			<input type="radio" value="미들" name="job_level" class="btn-check" id="radioLev2">
			<label for="radioLev2" class="btn btn-outline-dark radioLv">미들</label>
			<input type="radio" value="시니어" name="job_level" class="btn-check" id="radioLev3">
			<label for="radioLev3" class="btn btn-outline-dark radioLv">시니어</label>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>희망 경력</h5>
		<h6>희망하는 프리랜서의 경력을 입력해 주세요.</h6>
		<input type="number" name="wanted_career" value="${resultProj.wanted_career}"> 년
		</div>

		<hr>
		<div class="gap">
		<h5 style="margin-bottom:15px;" >경력 증빙 자료</h5>
		<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="radio" value=1 name="career_proof" class="btn-check" id="radioCp1">
			<label for="radioCp1" class="btn btn-outline-dark radioCp">필수</label>
			<input type="radio" value=0 name="career_proof" class="btn-check" id="radioCp2">
			<label for="radioCp2" class="btn btn-outline-dark radioCp">무관</label>
		</div>
		</div>
		<hr>
		<div class="gap">
		<h5>전달사항 또는 우대사항</h5>
		<h6>프리랜서 어쩌고 저쩌고 우짤</h6>
		<textarea rows="10" cols="84" name="dlvy_msg"><c:out value="${resultProj.dlvy_msg}" /></textarea>
		</div>
		<hr>
		<div class="my-3" style="text-align: right;" >
		<button type="submit" class="btn btn-dark submButt">등록하기</button>
		</div>
		</div>
		
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 지원자 희망 탭 끝 -->
		
		<input type="button" class="btn btn-outline-dark saveButt" value="임시저장" style="position: absolute; right:54px; top:25px;">
	</div>
	</div>
	<!-- 폼 태그 끝 -->
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

	
<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript">

		/* 임시저장된 value를 불러와서 라디오 체크에 checked 또는 체크박스에 selected 옵션 부여 */
		$(":radio[name='work_field'][value='${resultProj.work_field}']").attr('checked', true);
		$(":radio[name='pmeet_meth'][value='${resultProj.pmeet_meth}']").attr('checked', true);
		$(":radio[name='meet_meth'][value='${resultProj.meet_meth}']").attr('checked', true);
		$(":radio[name='meet_cycle'][value='${resultProj.meet_cycle}']").attr('checked', true);
		$(":radio[name='job_level'][value='${resultProj.job_level}']").attr('checked', true);
		$(":radio[name='career_proof'][value='${resultProj.career_proof}']").attr('checked', true);
		$(":radio[name='proj_progress'][value='${resultProj.proj_progress}']").attr('checked', true);
		$(":checkbox[name='date_nego'][value='${resultProj.date_nego}']").attr('checked', true);
		$(":checkbox[name='cost_nego'][value='${resultProj.cost_nego}']").attr('checked', true);
		$("#region").val("${resultReg.region }");
		
		// 시군구 selected 옵션 선택이 되지 않음 <- 해결 필요
		//	$("#district").val("${resultReg.district }").attr("selected", "selected");
		
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

		/* [+보유기술 추가] 클릭 */
		$(function() {
			$('.addSkill').click(function(){
				
				/* [+보유기술 추가] 클릭 시 [select 버튼]+[추가하기] 출력 */
				$('#inputPt').html(
				 '<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				 '<select class="selectSk" ><option disabled hidden selected></option>'+
				 '<option value=".NET">.NET</option><option value="AA">AA</option><option value="Adobe Photoshop">Adobe Photoshop</option><option value="AfterEffect">AfterEffect</option>'+
				 '<option value="Ajax">Ajax</option><option value="Android">Android</option><option value="Angular.js">Angular.js</option><option value="Apache">Apache</option>'+
				 '<option value="Bootstrap">Bootstrap</option><option value="C">C</option><option value="C#">C#</option><option value="C++">C++</option>'+
				 '<option value="CentOS">CentOS</option><option value="Cloud">Cloud</option><option value="CSS">CSS</option><option value="DA">DA</option>'+
				 '<option value="Flutter">Flutter</option><option value="Git">Git</option><option value="GitHub">GitHub</option><option value="Governance">Governance</option>'+
				 '<option value="HTML">HTML</option><option value="IOS">IOS</option><option value="ISP">ISP</option><option value="JAVA">JAVA</option>'+
				 '<option value="Javascript">Javascript</option><option value="JQuery">JQuery</option><option value="JSON">JSON</option><option value="JSP">JSP</option>'+
				 '<option value="Linux">Linux</option><option value="MacOS">MacOS</option><option value="MariaDB">MariaDB</option><option value="Maven">Maven</option>'+
				 '<option value="MyBatis">MyBatis</option><option value="MySQL">MySQL</option><option value="Node.js">Node.js</option><option value="Oracle">Oracle</option>'+
				 '<option value="PHP">PHP</option><option value="PL">PL</option><option value="PM">PM</option>'+
				 '<option value="PowerPoint">PowerPoint</option><option value="Python">Python</option><option value="React.js">React.js</option>'+
				 '<option value="Spring">Spring</option><option value="Spring Boot">Spring Boot</option><option value="Tomcat">Tomcat</option>'+
				 '<option value="Unity">Unity</option><option value="Unix">Unix</option><option value="VisualStudio">VisualStudio</option>'+
				 '<option value="Vue.js">Vue.js</option><option value="Windows">Windows</option><option value="모바일 웹/앱">모바일 웹/앱</option><option value="앱디자인">앱디자인</option>'+
				 '<option value="웹디자인">웹디자인</option><option value="전자정부프레임워크">전자정부프레임워크</option><option value="한글">한글</option></select>'+
				 '<select class="selectLev"><option disabled hidden selected></option>'+
				 '<option value="초급">초급</option><option value="중급">중급</option><option value="고급">고급</option></select>'+
				 '<button type="butoon" class="btn btn-dark btn-sm addButt removeAdd">추가하기</button></div>'		
				);

				/* 주요기술 스택 - select2(검색되는 select) 적용 */
				$(function() {
					$('.selectSk').select2();
				});
		
				$(function() {
					$('.selectSk').select2({
						placeholder : "스킬을 선택해주세요."
					});
		
				});
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt').click(function(){
						let skill = $('.selectSk').val()
						let level = $('.selectLev').val();

						/* 하나라도 미입력 시 추가 불가능 */
						if(skill==null || level==null){
							alert("안돼 돌아가");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 기술 리스트 출력 */
						$('.listPt').prepend(
							'<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">'+
							'<button class="removeSk btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>'+
							'<input type="hidden" value="'+skill+'" name="skill_nm"><input type="hidden" value="'+level+'" name="skill_lev">'+
							'<div style="padding-bottom:5px;"><span style="padding-left: 20px; font-size: 22px; font-weight: bold;">'+skill+'</span><br></div>'+
							'<span style="padding-left: 20px;"> 레벨 : '+level+'</span></div></p>'	
						);
		
					});
					
				});
				
				/* 리스트에 추가된 기술 삭제 */
				$(document).on('click','.removeSk',function(){
			        $(this).parent().remove()
			    })
			    
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd',function(){
			        $(this).parent().remove()
			    })
				
			});
					
		});
		
		/* 임시저장 기능 구현 */
		var data = true;

		// 임시저장된 프로젝트를 또 임시저장할 경우
		// 비동기 방식으로 데이터를 처리하고 페이지는 유지
		$(function() {
			$(".saveButt").click(function() {
				
				$('.temporary').val("임시저장");
				
					$.ajax({
						url : "/enroll/savedProjSave",
						type : "POST",
						data : $("#fm1").serialize(),
						success : function() {
							alert("임시저장 되었습니다.");
						},
						error : function() {
							alert("오류발생 - 최초 임시 저장 후");
						}
				});
			});
		
		});
		
		// 임시저장된 프로젝트를 등록할 경우
		// 페이지를 이동시키며 데이터 처리
		$(function() {
			$(".submButt").click(function() {
				
				$('.temporary').val("등록성공");
	
					$(".fm").attr("action","/enroll/savedProjEnroll");
					$(".fm").submit();
		
			});
		});	
		
		/* 리스트에 추가된 기술 삭제 */
		$(document).on('click','.removeSk',function(){
	        $(this).parent().remove()
	    });
		
		var WfVar = $('input[name=work_field]').is(":checked");

		var titleVar = document.getElementById('proj_title').value;
		var result = document.querySelector(".tell");
		
		$(function() {
			$("#nextButt").click(function(e){
// 				alert(titleVar);
		if(!WfVar){
			$('input[name=work_field]').focus();
			result.innerHTML = "<b style='color:red;'>업무분야를 선택해주세요</b>";		
			return;
			e.preventDefault();
		} 
	
		
			});
		});
		
		$(function(){
			$("#focusDetail").click(function(){
				alert("text");
			$('input[name=pmeet_meth]').focus();
			});
		});
		
		function scrollTopAbs() {
		      window.scrollTo(0, 0);
	    }
		
		
</script>
</body>
</html>