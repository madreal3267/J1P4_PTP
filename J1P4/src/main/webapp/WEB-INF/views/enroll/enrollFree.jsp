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

	
	<form action="" method="post" name="fm1" id="fm1">
	<input type="hidden" value="${sessionScope.user_id }" name="free_id">
	<input type="hidden" value="${sessionScope.user_id }" name="user_id">
	
	<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">	
  
    <!-- 사이드 메뉴 시작 -->
	<div class="col-md-3 pt-0">
		<div class="list-group list-group-flush account-settings-links" style="width:274px;">
			<h4 class="font-weight-bold py-1 mx-4 my-3">프리랜서 등록하기</h4>
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
	<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade active show" id="free_condition"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>
	
	<h2>업무조건</h2>
		<h4>업무 가능 분야</h4>
			<input type="radio" value="개발" class="btn-check" name="work_field" id="radioWf1">
			<label class="btn btn-outline-dark" for="radioWf1">⚙️ 개발</label>
			<input type="radio" value="기획" class="btn-check" name="work_field" id="radioWf2">
			<label class="btn btn-outline-dark" for="radioWf2">🛠️ 기획</label>
			<input type="radio" value="디자인" class="btn-check" name="work_field" id="radioWf3">
			<label class="btn btn-outline-dark" for="radioWf3">🎨 디자인</label>
			<input type="radio" value="퍼블리싱" class="btn-check" name="work_field" id="radioWf4">
			<label class="btn btn-outline-dark" for="radioWf4">🖋️ 퍼블리싱</label>
		<div>
		<br>
		<h4>업무 상태</h4>
		<b>업무 가능 여부</b>
		<input type="radio" value=1 name="work_check"> 가능
		<input type="radio" value=0 name="work_check"> 불가능
		<br>
		<b>업무시작 가능일</b>
		<input type="date" name="work_date">
		</div>
		<br>
		<div>
		<h4>희망 조건</h4>
		<b>희망 프로젝트 대금</b>
		<input type="text" name="proj_cost">원 <br>
		<b>희망 지역</b>
		<select name='region' onchange="change(this.selectedIndex);" class=input>
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

<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade" id="free_intro"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>
	<h2>소개정보</h2>		
	<b>한줄 소개</b><br>
		<input type="text" name="oneline_bio" style="width: 510px"><br>
	<b>자기 소개서</b><br>
	<textarea rows="10" cols="60" name="bio"></textarea>
	</div>
	</div>
	
<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade" id="free_skill"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>
	<h2>보유기술</h2>		
	<b>보유 중인 기술</b><br>
	<div class="listPt"></div>
	<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
	<div id="inputPt"></div>
	<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
	
	<div role="button" class="addSkill">+ 보유기술 추가</div>
	
	</div>
	</div>
	<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade" id="free_career"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>
	<h2>경력</h2>		
	<b>전문성</b><br>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="radio" value="주니어" class="btn-check" name="job_lev" id="radioJl1">
			<label class="btn btn-outline-dark" for="radioJl1">주니어</label>
			<input type="radio" value="미들" class="btn-check" name="job_lev" id="radioJl2">
			<label class="btn btn-outline-dark" for="radioJl2">미들</label>
			<input type="radio" value="시니어" class="btn-check" name="job_lev" id="radioJl3">
			<label class="btn btn-outline-dark" for="radioJl3">시니어</label>
	</div>
	<br>
	<b>경력</b><br>
	<div class="listCa"></div>
	<!-- [추가하기] 클릭 시 추가되는 경력 리스트 출력되는 공간-->
	<div class="inputCa"></div>
	<!-- [+경력 추가] 클릭 시 [input text] 출력되는 공간 -->
	<br>		
	<div role="button" class="addCareer">+ 경력 추가</div>
	</div>
	</div>
	<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade" id="free_school"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>	
	<h2>학력</h2>		
	<b>최종학력</b><br>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="radio" value="고등학교" class="btn-check" name="school_type" id="radioGs1">
			<label class="btn btn-outline-dark" for="radioGs1">고등학교</label>
			<input type="radio" value="대학교(2,3년제)" class="btn-check" name="school_type" id="radioGs2">
			<label class="btn btn-outline-dark" for="radioGs2">대학(2,3년제)</label>
			<input type="radio" value="대학교(4년제)" class="btn-check" name="school_type" id="radioGs3">
			<label class="btn btn-outline-dark" for="radioGs3">대학교(4년제)</label>
			<input type="radio" value="대학원(석사)" class="btn-check" name="school_type" id="radioGs4">
			<label class="btn btn-outline-dark" for="radioGs4">대학원(석사)</label>
			<input type="radio" value="대학원(박사)" class="btn-check" name="school_type" id="radioGs5">
			<label class="btn btn-outline-dark" for="radioGs5">대학원(박사)</label>
	</div>
	<br>
	학교명* <input type="text" name="school_nm"><br>
	전공명* <input type="text" name="major"><br>
	재학기간 <input type="text" name="entrance"> ~ <input type="text" name="graduation">
	<select name="grad_status">
		<option disabled hidden selected>졸업상태</option>
		<option value="졸업">졸업</option>
		<option value="재학">재학</option>
		<option value="수료">수료</option>
		<option value="휴학">휴학</option>
		<option value="중퇴/자퇴">중퇴/자퇴</option>
	</select>
	</div>
	</div>
<!-- 프로젝트 등록하기 탭 시작 -->
	<div class="tab-pane fade" id="free_license"  >
	<!-- card body 시작 -->
	<div class="card-body border-start" >
		<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
			<h4 class="font-weight-bold mx-4 my-3">프로젝트 등록</h4>
		</div>
	<h2>자격증</h2>		
	<b>자격증</b><br>
	
	<br>
	<div class="listLi"></div>
	<!-- [추가하기] 클릭 시 추가되는 경력 리스트 출력되는 공간-->
	<div class="inputLi"></div>
	<!-- [+경력 추가] 클릭 시 [input text] 출력되는 공간 -->
	<br>		
	<div role="button" class="addLicense">+ 자격증 추가</div>
	<input type="submit" value="등록하기">
	</div>
	</div>
		</div>
	</div>
</div>
</div>
</div>
	</form>
	
<!-- 자바스크립트 시작 -->	
<script type="text/javascript">
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
				 '<select class="selectLev"><option disabled hidden selected></option>'+
				 '<option value="초급">초급</option><option value="중급">중급</option><option value="고급">고급</option></select>'+
				 '<button type="button" class="addButt removeAdd">추가하기</button></div>'
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
						 '<p><div class="border border-1 rounded-3" role="group" style="width: 400px; display: inline-block; position: relative;">'+
						 '<input type="hidden" value="'+skill+'" name="skill_nm"><input type="hidden" value='+level+' name="skill_lev">'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+skill+'</span></h4><h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+level+'</span></h4>'+
						 '<button class="removeSk btn-close" aria-label="Close" style="width: 1px; position: absolute; top: 21px; left: 360px;"></button></div></p>'		
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
				'<input type="text" class="textCn" placeholder="회사명*" style="width: 512px">'+
				'<textarea rows="5" cols="60" class="textRs" placeholder="&#13;&#10&#13;&#10; 담당업무*"></textarea>'+
				'<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" class="textJd" placeholder="입사연월">'+
				'<input type="text" class="textQd" placeholder="퇴사연월"></div>'+
				'<br><button type="button" class="addButt2 removeAdd2">추가하기</button></div>'
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
							alert("안돼 돌아가");
							return;
						}
						if(comRs==""){
							alert("안돼 돌아가");
							return;
						}
						if(comJd==""){
							alert("안돼 돌아가");
							return;
						}
						
						
						/* [추가하기] 클릭 시 추가되는 경력 리스트 출력 */
						$('.listCa').prepend(
						 '<p><div class="border border-1 rounded-3" role="group" style="width: 400px; display: inline-block; position: relative;">'+
						 '<input type="hidden" value="'+comNm+'" name="company_nm"><input type="hidden" value="'+comRs+'" name="responsibility">'+
						 '<input type="hidden" value="'+comJd+'" name="join_date"><input type="hidden" value="'+comQd+'" name="quit_date">'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+comNm+'</span></h4><h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+comRs+'</span></h4>'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+comJd+'</span></h4><h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+comQd+'</span></h4>'+
						 '<button class="removeCa btn-close" aria-label="Close" style="width: 1px; position: absolute; top: 21px; left: 360px;"></button></div></p>'		
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
				/* [+경력 추가] 클릭 시 [input text]+[추가하기] 출력 */
				$('.inputLi').html(
				'<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" placeholder="자격증명*" style="width: 300px;" class="licNm">'+
				'<input type="text" placeholder="기관명*" class="licIss">'+
				'<input type="text" placeholder="YYYY.MM." class="licQd">'+
				'<br><button type="button" class="addButt3 removeAdd3">추가하기</button></div>'
				);
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt3').click(function(){
						let licNm = $('.licNm').val()
						let licIss = $('.licIss').val();
						let licQd = $('.licQd').val();
						
						/* 하나라도 미입력 시 추가 불가능 */
						if(licNm==""){
							alert("안돼 돌아가");
							return;
						}
						if(licIss==""){
							alert("안돼 돌아가");
							return;
						}
						if(licQd==""){
							alert("안돼 돌아가");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 경력 리스트 출력 */
						$('.listLi').prepend(
						 '<p><div class="border border-1 rounded-3" role="group" style="width: 400px; display: inline-block; position: relative;">'+
						 '<input type="hidden" value="'+licNm+'" name="license_nm"><input type="hidden" value="'+licIss+'" name="issuer"><input type="hidden" value="'+licQd+'" name="qualify_date">'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+licNm+'</span></h4>'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+licIss+'</span></h4>'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+licQd+'</span></h4>'+
						 '<button class="removeLi btn-close" aria-label="Close" style="width: 1px; position: absolute; top: 21px; left: 360px;"></button></div></p>'		
						);
		
					});
					
				});
				
				/* 리스트에 추가된 경력 삭제 */
				$(document).on('click','.removeLi',function(){
			        $(this).parent().remove()
			    });
				
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd3',function(){
			        $(this).parent().remove()
			    });
				
			});
			
		});
		
</script>
<!-- 자바스크립트 끝 -->

<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>