<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container light-style flex-grow-1 container-p-y" >
  <div class="card overflow-hidden"  style="box-shadow: ;">
<div class="row no-gutters row-bordered row-border-light" >
	<!-- 사이드 메뉴 시작 -->
	<div class="col-md-3 pt-0">
		<div class="list-group list-group-flush account-settings-links">
			<h4 class="font-weight-bold py-3 mb-4 m-4">프로젝트 등록하기</h4>
			<a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">기본 정보</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#account-detail">상세 정보</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#account-hope">지원자 희망 조건</a>
		</div>
	</div>
	<!-- 사이드 메뉴 끝 -->
<div class="col-md-9">
<div class="tab-content">

<!-- 기본 정보 탭 시작 -->
<div class="tab-pane fade active show" id="account-general">
	
<hr class="border-light m-0">
	<!-- card body 시작 -->
	<div class="card-body ">
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
<!-- 			<div class="alert alert-warning mt-3"> -->
<!-- 			임시 저장 프로젝트를 불러오거나, 등록했던 프로젝트를 다시 등록해 보세요. -->
<!-- 			<a href="javascript:void(0)">프로젝트 선택하기 ></a> -->
<!-- 			</div> -->
			<h4>기본 정보</h4>
		<hr>
		<h5>프로젝트를 간단하게 알려주세요</h5>
		<input type="radio" name="proj_progress" value=0 id="radioPj1" class="mb-1">
		<label for="radioPj1" class="form-label">신규 프로젝트를 진행하려 합니다</label><br>
		<input type="radio" name="proj_progress" value=1 id="radioPj2" class="mb-1"> 
		<label for="radioPj2" class="form-label">운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다</label>
		</div>
		<!-- 폼 그룹 끝 -->
		<hr>
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
		<h5>예상 시작일</h5>
		<h6>프리랜서가 프로젝트에 착수하는 날짜입니다.<br>
		해당 날짜에 프로젝트 시작이 가능한 프리랜서들이 지원하게 됩니다.
		</h6>
		<input type="date" name="start_date" style="width: 200px" class="mb-1"> <br>
		<input type="checkbox" name="date_nego" value=1 id="ckDate" class="mb-1">
		<label for="ckDate">프로젝트 착수 일자의 협의가 가능합니다.</label>
		</div>
		<!-- 폼 그룹 끝 -->
		
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
		<h5>예상 진행 기간</h5>
		<h6>프로젝트 진행 기간을 입력해 주세요.</h6>
		<input type="text" name="work_period"> 일
		</div>
		<!-- 폼 그룹 끝 -->		
		
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
		<h5>모집 인원</h5>
		<h6>프로젝트에 필요한 인원을 입력해 주세요.</h6>
		<input type="text" name="no_recruited"> 명
		</div>
		<!-- 폼 그룹 끝 -->		
		
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
		<h5>모집 마감일</h5>
		<h6> 프리랜서 모집을 마감할 날짜입니다.<br>
		해당 날짜에 프리랜서 모집이 자동으로 종료됩니다.</h6>
		<input type="date" name="deadline" style="width: 200px"> <br>
		</div>
		<!-- 폼 그룹 끝 -->		
		
		<!-- 폼 그룹 시작 -->
		<div class="form-group">
		<h5>작업 단가</h5>
		<h6>프로젝트에 지출 가능한 예산을 입력해 주세요.</h6>
		<input type="text" name="proj_cost"> 원 <br>
		<input type="checkbox" name="cost_nego" value=1 id="ckNego">
		<label for="ckNego">입력한 예산에서 조율이 가능합니다.</label>
		</div>
		<!-- 폼 그룹 끝 -->		
		
		
		
		
	</div>
	<!-- card body 끝 -->
</div>
<!-- 기본 정보 탭 끝 -->

<!-- 상세 정보 탭 시작 -->
<div class="tab-pane fade" id="account-detail">
<div class="card-body pb-2">
<div class="form-group">
<label class="form-label">Current password</label>
<input type="password" class="form-control">
</div>
<div class="form-group">
<label class="form-label">New password</label>
<input type="password" class="form-control">
</div>
<div class="form-group">
<label class="form-label">Repeat new password</label>
<input type="password" class="form-control">
</div>
</div>
</div>
<div class="tab-pane fade" id="account-hope">
<div class="card-body pb-2">
<div class="form-group">
<label class="form-label">Bio</label>
<textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
</div>
<div class="form-group">
<label class="form-label">Birthday</label>
<input type="text" class="form-control" value="May 3, 1995">
</div>
<div class="form-group">
<label class="form-label">Country</label>
<select class="custom-select">
<option>USA</option>
<option selected>Canada</option>
<option>UK</option>
<option>Germany</option>
<option>France</option>
</select>
</div>
</div>
<hr class="border-light m-0">
<div class="card-body pb-2">
<h6 class="mb-4">Contacts</h6>
<div class="form-group">
<label class="form-label">Phone</label>
<input type="text" class="form-control" value="+0 (123) 456 7891">
</div>
<div class="form-group">
<label class="form-label">Website</label>
<input type="text" class="form-control" value>
</div>
</div>
</div>



</div>
</div>
</div>
  </div>
  	<!-- 임시저장, 등록 버튼 -->
	<div class="text-right mt-3">
	<button type="button" class="btn btn-default">임시저장</button>&nbsp;
	<button type="button" class="btn btn-primary">등록</button>
	</div>

</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- select2 (검색되는 select) 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

		/* [+보유기술 추가] 클릭 */
		$(function() {
			$('.addSkill').click(function(){
				
				/* [+보유기술 추가] 클릭 시 [select 버튼]+[추가하기] 출력 */
				$('#inputPt').html(
				 '<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group"><select name="skill_nm" class="selectSk" ><option disabled hidden selected></option><option value="자바">자바</option><option value="파이썬">파이썬</option><option value="CSS">CSS</option><option value="MySQL">MySQL</option></select><select name="skill_lev" class="selectLev"><option disabled hidden selected></option><option value="초급">초급</option><option value="중급">중급</option><option value="고급">고급</option></select><button type="butoon" class="addButt removeAdd">추가하기</button></div>'		
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
// 						arr = {
// 							skill : $('.selectSk').val(),
// 							level : $('.selectLev').val()}
// 						alert(JSON.stringify(arr));

						/* 하나라도 미입력 시 추가 불가능 */
						if(skill==null || level==null){
							alert("안돼 돌아가");
							return;
						}
						
						/* [추가하기] 클릭 시 추가되는 기술 리스트 출력 */
						$('.listPt').prepend('<p><div class="border border-1 rounded-3 m-2 p-4" role="group" style="width: 230px; display: inline-block;"><input type="hidden" value='+$('.listPt').children("p").length+' name="count"><input type="hidden" value='+skill+' name="skill_nm"><input type="hidden" value='+level+' name="skill_lev"><span class="badge bg-warning m-3">'
						+skill+'</span><span class="badge bg-warning m-3">'+level+'</span><button class="removeSk btn-close" aria-label="Close"></button></div></p>');
		
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

		$(function() {
			$(".saveButt").click(function() {
				if(data) {
					$.ajax({
						url : "/enroll/saveProj",
						type : "POST",
						data : $("#fm1").serialize(),
						async : false,
						success : function(a) {
							alert(" ╰(*°▽°*)╯ 저장 완료");
							data = a.result;
						},
						error : function() {
							alert("오류발생");
						}
					});
				} else {
					$.ajax({
						url : "/enroll/multiSaveProj",
						type : "POST",
						data : $("#fm1").serialize(),
						success : function() {
							alert(" ╰(*°▽°*)╯ 최초 임시저장 후 저장 완료");
						},
						error : function() {
							alert("오류발생 - 최초 임시 저장 후");
						}
					});
				}
		
			});
		});	
	</script>
</body>
</html>