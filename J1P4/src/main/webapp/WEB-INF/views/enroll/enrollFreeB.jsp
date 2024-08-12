<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

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
<!-- JQuery -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<!-- enrollFree.css -->
<link href="${pageContext.request.contextPath}/resources/css/enrollFree.css" rel="stylesheet" />
<!-- select2 (검색되는 select) CSS -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>프리랜서 등록 페이지_사업자</title>
</head>
<body>
	<h1>프리랜서 등록하기_사업자 (enrollFreeB.jsp)</h1>
	<hr>
	
	<form action="" method="post" name="fm1" id="fm1">
	<input type="hidden" value="${sessionScope.user_id }" name="free_id">
	<input type="hidden" value="${sessionScope.user_id }" name="user_id">
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
	<hr>
	<h2>소개정보</h2>		
	<b>한줄 소개</b><br>
		<input type="text" name="oneline_bio" style="width: 510px"><br>
	<b>자기 소개서</b><br>
	<textarea rows="10" cols="60" name="bio"></textarea>
	<hr>
	<h2>보유기술</h2>		
	<b>보유 중인 기술</b><br>
	<div class="listPt"></div>
	<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
	<div id="inputPt"></div>
	<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
	
	<div role="button" class="addSkill">+ 보유기술 추가</div>
	
	<hr>
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
	<br>
	<hr>
	<h2>회사연혁</h2>		
	<b>회사연혁</b><br>
	<div class="listHi"></div>
	<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
	<div class="inputHi"></div>
	<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
	
	<div role="button" class="addHistory">+ 회사연혁 추가</div>

	<hr>
	<h2>협력업체 및 기관</h2>		
	<b>협력업체 및 기관</b><br>
	<div class="listPa"></div>
	<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
	<div class="inputPa"></div>
	<!-- [+보유기술 추가] 클릭 시 [select 버튼] 출력되는 공간 -->
	
	<div role="button" class="addPartner">+ 협력업체 및 기관 추가</div>

	
	<br>
	<input type="submit" value="등록하기">
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
			        $(this).parent().remove();
			    });
			    
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd',function(){
			        $(this).parent().remove();
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
						
// 						alert(comNm+comRs+comJd+comQd);
						
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
		
		/* [+회사연혁 추가] 클릭 */
		$(function() {
			$('.addHistory').click(function(){
				/* [+회사연혁 추가] 클릭 시 [input text]+[추가하기] 출력 */
				$('.inputHi').html(
				'<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" class="ym" placeholder="YYYY.MM." style="width: 300px;">'+
				'<input type="text" class="detail" placeholder="상세내용*">'+
				'<br><button type="button" class="addButt3 removeAdd3">추가하기</button></div>'
				);
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt3').click(function(){
						let ym = $('.ym').val()
						let detail = $('.detail').val();
						
						/* 하나라도 미입력 시 추가 불가능 */
						if(ym==""){
							alert("안돼 돌아가");
							return;
						}
						if(detail==""){
							alert("안돼 돌아가");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 경력 리스트 출력 */
						$('.listHi').prepend(
						 '<p><div class="border border-1 rounded-3" role="group" style="width: 400px; display: inline-block; position: relative;">'+
						 '<input type="hidden" value="'+ym+'" name="yearmonth"><input type="hidden" value="'+detail+'" name="hDetails">'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+ym+'</span></h4>'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+detail+'</span></h4>'+
						 '<button class="removeHi btn-close" aria-label="Close" style="width: 1px; position: absolute; top: 21px; left: 360px;"></button></div></p>'		
						);
		
					});
					
				});
				
				/* 리스트에 추가된 경력 삭제 */
				$(document).on('click','.removeHi',function(){
			        $(this).parent().remove()
			    });
				
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd3',function(){
			        $(this).parent().remove()
			    });
				
			});
			
		});
		
		/* [+협력업체 추가] 클릭 */
		$(function() {
			$('.addPartner').click(function(){
				/* [+협력업체 추가] 클릭 시 [input text]+[추가하기] 출력 */
				$('.inputPa').html(
				'<div class="btn-group-vertical" role="group" aria-label="Basic checkbox toggle button group">'+
				'<input type="text" class="partNm" placeholder="파트너사 및 협력기관 명*" style="width:500px;">'+
				'<input type="text" class="partDe" placeholder="협력 관계 설명*" style="width:500px;">'+
				'<br><button type="button" class="addButt4 removeAdd4">추가하기</button></div>'
				);
				
				/* [추가하기] 클릭 */
				$(function() {
					$('.addButt4').click(function(){
						let partNm = $('.partNm').val()
						let partDe = $('.partDe').val();
						
						/* 하나라도 미입력 시 추가 불가능 */
						if(partNm==""){
							alert("안돼 돌아가");
							return;
						}
						if(partDe==""){
							alert("안돼 돌아가");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 경력 리스트 출력 */
						$('.listPa').prepend(
						 '<p><div class="border border-1 rounded-3" role="group" style="width: 400px; display: inline-block; position: relative;">'+
						 '<input type="hidden" value="'+partNm+'" name="partners_nm"><input type="hidden" value="'+partDe+'" name="pDetails">'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+partNm+'</span></h4>'+
						 '<h4 style="display: inline-block;"><span class="badge text-bg-warning m-3">'+partDe+'</span></h4>'+
						 '<button class="removePa btn-close" aria-label="Close" style="width: 1px; position: absolute; top: 21px; left: 360px;"></button></div></p>'		
						);
		
					});
					
				});
				
				/* 리스트에 추가된 경력 삭제 */
				$(document).on('click','.removePa',function(){
			        $(this).parent().remove();
			    });
				
			    /* [추가하기] 클릭 동시에 버튼 삭제 */
				$(document).on('click','.removeAdd4',function(){
			        $(this).parent().remove();
			    });
				
			});
			
		});
		
		
</script>
<!-- 자바스크립트 끝 -->

<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>