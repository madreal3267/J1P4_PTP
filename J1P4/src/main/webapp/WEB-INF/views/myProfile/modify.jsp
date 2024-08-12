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
<%-- user_id: ${sessionScope.user_id }, --%>
<%-- user_cf: ${sessionScope.user_cf }, --%>
<%-- user_type: ${sessionScope.user_type }, --%>
<%-- free_no: ${sessionScope.free_no }, --%>
<%-- ct_no: ${sessionScope.ct_no } --%>

	<form action="" method="post" name="fm1" id="modifyFm">
	<input type="hidden" value="${sessionScope.user_id }" name="free_id">
	<input type="hidden" value="${sessionScope.user_id }" name="user_id">

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">

      <!-- 사이드 메뉴 시작 -->
	<div class="col-md-3 pt-0">
		<div class="list-group list-group-flush account-settings-links" style="width:274px;">
			<h4 class="font-weight-bold py-1 mx-4 my-3">내 프로필 수정</h4>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_condition">업무조건</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_intro">소개정보</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_skill">보유기술</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_career">경력</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_school">학력</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_license">자격증</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_portf">포트폴리오</a>
		</div>
	</div>
	<!-- 사이드 메뉴 끝 -->
	<div class="col-md-9">
	<div class="tab-content">
	
		<!-- 업무조건 탭 시작 -->
		<div class="tab-pane fade active show" id="free_condition"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">업무조건</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">
				<h5>회원등급</h5>
				<div class="content">
					<input type="radio" value="신규회원" class="btn-check" name="work_field" id="radioWf1">
					<label class="btn btn-outline-dark radioField" for="radioWf1">신규회원</label>
					<input type="radio" value="일반회원" class="btn-check" name="work_field" id="radioWf2">
					<label class="btn btn-outline-dark radioField" for="radioWf2">일반회원</label>
					<input type="radio" value="장기회원" class="btn-check" name="work_field" id="radioWf3">
					<label class="btn btn-outline-dark radioField" for="radioWf3">장기회원</label>
				</div>
				<hr>
			</div>	
			<hr>
			<div class="gap">
				<h5>업무 상태</h5>
				<div class="content">
				<b style="padding-right: 10px;">업무 가능 여부</b>
					<input type="radio" value=1 name="work_check"> 가능
					<input type="radio" value=0 name="work_check"> 불가능
				<br>
				<div class="checkGap">
				<b style="padding-right: 10px;">업무시작 가능일</b>
				<input type="date" name="work_date" value="${myProfile.work_date }">
				</div>
				</div>
			</div>
			<hr>
			<div class="gap">	
				<h5>희망 조건</h5>
				<div class="content" style="margin-bottom: 44px; ">
				<b style="padding-right: 10px;">희망 프로젝트 대금</b>
				<input type="text" name="proj_cost" value="${myProfile.proj_cost }"> 원 <br>
				<div class="checkGap">
				<b style="padding-right: 10px;">희망 지역</b>
				<select name='region' onchange="change(this.selectedIndex);" class=input id="region">
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
				</select>
				<select name='district' class=select>
					<option value=''>전체</option>
				</select>
				</div>
				</div>
			</div>
		</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 업무조건 탭 끝 -->
		
		
		<!-- 소개정보 탭 시작 -->
		<div class="tab-pane fade" id="free_intro"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">소개정보</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">
				<h5>한줄 소개</h5>
					<div class="content">
					<input type="text" name="oneline_bio" style="width: 710px" value="${myProfile.oneline_bio }"><br>
					</div>
			</div>
			<hr>
			<div class="gap">		
				<h5>자기 소개서</h5>
					<div class="content">
					<textarea cols="84" rows="10" name="bio">${myProfile.bio }</textarea>
					</div>
			</div>		
			</div>
		</div>
		<!-- card body 끝 -->
		</div>					
		<!-- 소개정보 탭 끝 -->
					
		
		<!-- 보유기술 탭 시작 -->
		<div class="tab-pane fade" id="free_skill"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">보유기술</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">
				<h5>보유 중인 기술</h5>
				<div class="content" style="margin-bottom: 305.42px; ">
				<div class="listPt"></div>
				<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
				
				<c:forEach items="${mySkill }" var="mySkill">
				<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">
				<button class="removeButt btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>
				<input type="hidden" value="${mySkill.skill_nm }" name="skill_nm"><input type="hidden" value="${mySkill.skill_lev }" name="skill_lev">
				<div style="padding-bottom:5px;"><span style="padding-left: 20px; font-size: 22px; font-weight: bold;">${mySkill.skill_nm }</span><br></div>
				<span style="padding-left: 20px;"> 레벨 : ${mySkill.skill_lev }</span></div></p>	
				</c:forEach>
				
				<div id="inputPt"></div>
				<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
				
				<div role="button" class="addSkill my-3">+ 보유기술 추가</div>
				</div>
			</div>
			</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 보유기술 탭 끝 -->				
	
		<!-- 경력 탭 시작 -->
		<div class="tab-pane fade" id="free_career"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">경력</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">
				<h5>전문성</h5>
				<div class="content">
				<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					<input type="radio" value="주니어" class="btn-check" name="job_lev" id="radioJl1">
					<label class="btn btn-outline-dark radioLev" for="radioJl1">주니어</label>
					<input type="radio" value="미들" class="btn-check" name="job_lev" id="radioJl2">
					<label class="btn btn-outline-dark radioLev" for="radioJl2">미들</label>
					<input type="radio" value="시니어" class="btn-check" name="job_lev" id="radioJl3">
					<label class="btn btn-outline-dark radioLev" for="radioJl3">시니어</label>
				</div>
				</div>
			</div>
			<hr>
			<div class="gap">	
				<h5>경력</h5>
				<div class="content" style="margin-bottom: 67.82px; ">
				<div class="listCa"></div>
				<!-- [추가하기] 클릭 시 추가되는 경력 리스트 출력되는 공간-->
				
				<c:forEach items="${myCareer }" var="myCareer">
								
				<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">
				<button class="removeButt btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>
				<input type="hidden" value="${myCareer.company_nm }" name="company_nm"><input type="hidden" value="${myCareer.responsibility }" name="responsibility">
				<input type="hidden" value="${myCareer.join_date }" name="join_date"><input type="hidden" value="${myCareer.quit_date }" name="quit_date">
				<span style="padding-left: 20px; font-size: 18px; font-weight: bold;">${myCareer.company_nm }</span><br>
				<span style="padding-left: 20px;">${myCareer.join_date } ~ ${myCareer.quit_date }</span><br>
				<span style="padding-left: 20px;">${myCareer.responsibility }</span></div></p>
				</c:forEach>
				
				<div class="inputCa"></div>
				<!-- [+경력 추가] 클릭 시 [input text] 출력되는 공간 -->
					
				<div role="button" class="addCareer my-3">+ 경력 추가</div>
				</div>
			</div>	
			</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 경력 탭 끝 -->	

		<!-- 학력 탭 시작 -->
		<div class="tab-pane fade" id="free_school"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">학력</h4>
			</div>	
			<div class="mx-4 my-3">
			<div class="gap">	
				<h5>최종학력</h5>
				<div class="content" style="margin-bottom: 290.01px; ">
				<div class="content">
				<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					<input type="radio" value="고등학교" class="btn-check" name="school_type" id="radioGs1">
					<label class="btn btn-outline-dark radioGs" for="radioGs1">고등학교</label>
					<input type="radio" value="대학교(2,3년제)" class="btn-check" name="school_type" id="radioGs2">
					<label class="btn btn-outline-dark radioGs" for="radioGs2">대학(2,3년제)</label>
					<input type="radio" value="대학교(4년제)" class="btn-check" name="school_type" id="radioGs3">
					<label class="btn btn-outline-dark radioGs" for="radioGs3">대학교(4년제)</label>
					<input type="radio" value="대학원(석사)" class="btn-check" name="school_type" id="radioGs4">
					<label class="btn btn-outline-dark radioGs" for="radioGs4">대학원(석사)</label>
					<input type="radio" value="대학원(박사)" class="btn-check" name="school_type" id="radioGs5">
					<label class="btn btn-outline-dark radioGs" for="radioGs5">대학원(박사)</label>
				</div>
				</div>
				<br>
				학교명* <input type="text" name="school_nm" value="${myProfile.school_nm }"><br>
				<div class="content">
				전공명* <input type="text" name="major" value="${myProfile.major }"><br>
				</div>
				<div class="content">
				재학기간 <input type="text" name="entrance" value="${myProfile.entrance }"> 
				~ <input type="text" name="graduation" value="${myProfile.graduation }">
				<select name="grad_status" id="grad_status">
					<option disabled hidden selected>졸업상태</option>
					<option value="졸업">졸업</option>
					<option value="재학">재학</option>
					<option value="수료">수료</option>
					<option value="휴학">휴학</option>
					<option value="중퇴/자퇴">중퇴/자퇴</option>
				</select>
				</div>
				</div>
			</div>	
			</div>	
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 학력 탭 끝 -->					

		<!-- 자격증 탭 시작 -->
		<div class="tab-pane fade" id="free_license"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">자격증</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">	
				<h5>자격증</h5>
				<div class="content" style="margin-bottom: 281.42px; ">
				<div class="listLi"></div>
				<!-- [추가하기] 클릭 시 추가되는 경력 리스트 출력되는 공간-->
				
				<c:forEach items="${myLicense }" var="myLicense">
								
				<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">	
				<button class="removeButt btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>
				<input type="hidden" value="${myLicense.license_nm }" name="license_nm"><input type="hidden" value="${myLicense.qualify_date }" name="qualify_date">
				<input type="hidden" value="${myLicense.issuer }" name="issuer">
				<span style="padding-left: 20px;font-size: 18px; font-weight: bold;">${myLicense.license_nm }</span><br>
				<span style="padding-left: 20px;">${myLicense.issuer } | ${myLicense.qualify_date }</span></div></p>
				</c:forEach>
				
				<div class="inputLi"></div>
				<!-- [+경력 추가] 클릭 시 [input text] 출력되는 공간 -->
				
				<div role="button" class="addLicense my-3">+ 자격증 추가</div>
				</div>
			</div>
			</div>		
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 자격증 탭 끝 -->

		<!-- 포트폴리오 탭 시작 -->
		<div class="tab-pane fade" id="free_portf"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">포트폴리오</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">	
				<h5>포트폴리오</h5>
				<div class="content" style="margin-bottom: 281.42px; ">
				<!-- 업로드된 파일 정보 출력 -->
				<div class="filePlz"></div>		
						
				<div role="button" class="my-3" data-bs-toggle="modal" data-bs-target="#portfModal">+ 포트폴리오 추가</div>
				</div>
			</div>
			</div>		
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 포트폴리오 탭 끝 -->
							
		<button type="button"  class="btn btn-dark saveButt" style="position: absolute; right:54px; top:25px;">저장하기</button>
	
	</div>
	</div>
</div>
</div>
</div>
</form>

<!-- 포트폴리오 모달창 시작 -->
<form action="/myProfile/upload" method="post" id="portf" enctype="multipart/form-data">

<div class="modal fade" id="portfModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	    
	
	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">포트폴리오 등록하기</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->		
				
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	포트폴리오를 올려주세요. (❁´◡`❁)
	<hr>
		<div>
		  <div>
			<div>
			<label for="exampleInputEmail1">포트폴리오 제목</label><br>
			<input type="text" name="portf_title" style="width: 720px;" placeholder="포트폴리오 제목을 입력하세요">
			</div>
			<hr>
			<div>
			<label for="exampleInputPassword1">담당 업무</label>
			<br>
			<textarea cols="85" rows="20" name="p_responsibility" placeholder="담당 업무를 입력하세요"></textarea>
			</div>
			
			<div class="form-group fileDiv">
			<label for="exampleInputFile">File input</label> 
			<input type="button" value="파일 추가" onclick="addFile();">
			</div>
		  </div>
			
			
		</div>
		
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  <input type="button" class="btn btn-primary submButt" value="저장하기"
	  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#offerModalSucc">
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	
</div>
</div>
</div>
	
</form>
<!-- 포트폴리오 모달창 끝 -->


	
<!-- 자바스크립트 시작 -->	
<script type="text/javascript">

$(function(){
	
	$(".submButt").click(function(){
		
		var formData = new FormData($('#portf')[0]);
		
		$.ajax({
			url:"/myProfile/upload",
			type:"POST",
			data : formData,
			processData: false,
			contentType: false,
			success : function(data){
				
				var resp = data.p_responsibility;
				var wf = data.portf_title;
				var fileName = data.fileNameList;	
				$.each(fileName, function(index, value){

				});
				
				$(".filePlz").prepend(
				'포트폴리오 제목 : '+resp+
				'<br>담당업무 : '+wf+
				'<br>업로드 된 파일 :<a href="/myProfile/download?fileName='+fileName+'">'+fileName+'</a><br>'+
				'<input type="hidden" name="p_responsibility" value="'+resp+'"><input type="hidden" name="portfolio_title" value="'+wf+'">'+
				'<input type="hidden" name="file" value="'+fileName+'">'
				);
				
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("@@@@@ 오류 발생: @@@@@" + textStatus);
		        console.log("AJAX 오류 발생:");
		        console.log("상태 코드:", jqXHR.status);
		        console.log("응답 텍스트:", jqXHR.responseText);
		        console.log("에러:", errorThrown);
			}
		});
		
	});
	
});

var cntt = 1;
function addFile(){
	$(".fileDiv").append("<input type='file' name='file"+cntt+"'id='exampleInputFile'>");
	cntt++;
}

		/* 임시저장된 value를 불러와서 라디오 체크에 checked 또는 체크박스에 selected 옵션 부여 */
		$(":radio[name='work_field'][value='${myProfile.work_field}']").attr('checked', true);
		$(":radio[name='work_check'][value='${myProfile.work_check}']").attr('checked', true);
		$(":radio[name='job_lev'][value='${myCareer[0].job_lev}']").attr('checked', true);
		$(":radio[name='school_type'][value='${myProfile.school_type}']").attr('checked', true);
		$("#grad_status").val("${myProfile.grad_status }");
		$("#region").val("${myReg.region }");
		
		/* 시군구 - select */
		var cnt = new Array();

		cnt[0] = new Array('전체');
		cnt[1] = new Array('전체', '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
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
				 '<select class="selectSk"><option disabled hidden selected></option>'+
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
				 '<select class="selectLev" style="width:100px;"><option disabled hidden selected >레벨 *</option>'+
				 '<option value="초급">초급</option><option value="중급">중급</option><option value="고급">고급</option></select>'+
				 '<button type="button" class="btn btn-dark btn-sm addButt removeAdd">추가하기</button></div>'
				);

				/* 주요기술 스택 - select2(검색되는 select) 적용 */

		
				$(function() {
					$('.selectSk').select2({
						placeholder : "스킬을 선택해주세요.*"
					});
		
				});
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt').click(function(){
						let skill = $('.selectSk').val()
						let level = $('.selectLev').val();

						/* 하나라도 미입력 시 추가 불가능 */
						if(skill==null || level==null){
							alert("필수값을 모두 입력해주세요.");
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
			    });
			    
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd',function(){
			        $(this).parent().remove()
			    });
				
			});
					
		});
		
		
		/* [+경력 추가] 클릭 */
		$(function() {
			$('.addCareer').click(function(){
				/* [+경력 추가] 클릭 시 [input text]+[추가하기] 출력 */
				$('.inputCa').html(
				'<div class="btn-group-vertical" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" class="textCn" placeholder="회사명*" style="width: 710px">'+
				'<textarea rows="5" cols="84" class="textRs" placeholder="&#13;&#10&#13;&#10; 담당업무*"></textarea>'+
				'<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" class="textJd" style="width: 355px" placeholder="입사연월" onkeyup="this.value = date_mask(this.value)" maxlength="8">'+
				'<input type="text" class="textQd" style="width: 355px" placeholder="퇴사연월" onkeyup="this.value = date_mask(this.value)" maxlength="8"></div>'+
				'<button type="button" class="btn btn-dark btn-sm addButt2 removeAdd2">추가하기</button></div>'
				);
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt2').click(function(){
						let comNm = $('.textCn').val();
						let comRs = $('.textRs').val();
						let comJd = $('.textJd').val();
						let comQd = $('.textQd').val();
						
						/* 하나라도 미입력 시 추가 불가능 */
						if(comNm==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						if(comRs==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						if(comJd==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						
						
						/* [추가하기] 클릭 시 추가되는 경력 리스트 출력 */
						$('.listCa').prepend(
								'<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">'+
								'<button class="removeCa btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>'+
								'<input type="hidden" value="'+comNm+'" name="company_nm"><input type="hidden" value="'+comRs+'" name="responsibility">'+
								'<input type="hidden" value="'+comJd+'" name="join_date"><input type="hidden" value="'+comQd+'" name="quit_date">'+
								'<span style="padding-left: 20px; font-size: 18px; font-weight: bold;">'+comNm+'</span><br>'+
								'<span style="padding-left: 20px;">'+comJd+' ~ '+comQd+'</span><br>'+
								'<span style="padding-left: 20px;">'+comRs+'</span></div></p>'		
						);
		
					});
					
				});
				
				/* 리스트에 추가된 경력 삭제 */
				$(document).on('click','.removeCa',function(){
			        $(this).parent().remove()
			    });
				
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd2',function(){
			        $(this).parent().remove()
			    });
				
			});
			
		});
		
		/* [+자격증 추가] 클릭 */
		$(function() {
			$('.addLicense').click(function(){
				/* [+자격증 추가] 클릭 시 [input text]+[추가하기] 출력 */
				$('.inputLi').html(
				'<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" placeholder="자격증명*" class="licNm" style="width:250px;">'+
				'<input type="text" placeholder="기관명*" class="licIss" style="width:250px;">'+
				'<input type="text" placeholder="YYYY.MM." style="width:120px;" class="licQd" onkeyup="this.value = date_mask(this.value)" maxlength="8" >'+
				'<button type="button" class="btn btn-dark btn-sm addButt3 removeAdd3">추가하기</button></div>'
				);
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt3').click(function(){
						let licNm = $('.licNm').val()
						let licIss = $('.licIss').val();
						let licQd = $('.licQd').val();
						
						/* 하나라도 미입력 시 추가 불가능 */
						if(licNm==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						if(licIss==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						if(licQd==""){
							alert("필수값을 모두 입력해주세요.");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 자격증 리스트 출력 */
						$('.listLi').prepend(
							'<p><div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">'+
							'<button class="removeLi btn-close" aria-label="Close" style="width: 1px; position: absolute; right:78px;"></button>'+
							'<input type="hidden" value="'+licNm+'" name="license_nm"><input type="hidden" value="'+licQd+'" name="qualify_date">'+
							'<input type="hidden" value="'+licIss+'" name="issuer">'+
							'<span style="padding-left: 20px;font-size: 18px; font-weight: bold;">'+licNm+'</span><br>'+
							'<span style="padding-left: 20px;">'+licIss+' | '+licQd+'</span></div></p>'
						);
		
					});
					
				});
				
				/* 리스트에 추가된 자격증 삭제 */
				$(document).on('click','.removeLi',function(){
			        $(this).parent().remove()
			    });
				
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd3',function(){
			        $(this).parent().remove()
			    });
				
			});
			
		});
		
		/* 이미 출력되어있는 기술 또는 경력 또는 자격증 리스트 삭제 */
		$(document).on('click','.removeButt',function(){
	        $(this).parent().remove()
	    });
		
		/* 수정하기 버튼 수행 */
		$(function(){
			
			$(".saveButt").click(function(){
				
				$.ajax({
					url:"/myProfile/modify",
					type:"POST",
					data : $("#modifyFm").serialize(),
					success : function(){
						alert("저장되었습니다.")
					},
					error : function() {
						alert("오류발생");
					}
				});
				
			});
			
		});

		// 날짜를 yyyy-mm-dd 형식으로 만들어 줌.
		function date_mask(objValue) {
		 var v = objValue.replace("--", "-");

		    if (v.match(/^\d{4}$/) !== null) {
		        v = v + '.';
		    } else if (v.match(/^\d{4}\.\d{2}$/) !== null) {
		        v = v + '.';
		    }
		 
		    return v;
		}
		

</script>
<!-- 자바스크립트 끝 -->

<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    
<%@ include file="../include/footer.jsp" %>