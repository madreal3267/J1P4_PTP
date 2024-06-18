<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" 
  integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" 
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <link href="../resources/css/listPro.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
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
<script type="text/javascript">
$(document).ready(function(){
	if(${!empty param.sn}){
	$("#sn2").val( $("#ss").val() );		
	}

	$("#ss").change(function(){
		var sn = $('#ss').val();
		var pageNum = $('#pageNum').val();
		var amount = $('#amount').val();
		console.log(sn)
		
		$("#sn2").val( $("#ss").val() );
		
		
		$.ajax({
			url: "/board/listProto",
			type: 'GET',
			data: { "sn":sn,
				"pageNum":pageNum,
				"amount":amount},
			success: function(data){
			
			var proList = $('#pList');
			proList.empty();
			
			var show = "";

				 
			[].forEach.call(data, function(element, index, array){
						console.log(element, index);
						
						/* Date dd = new Date(data[index].deadline); */
						var dDay = new Date(data[index].deadline);
						var rDay = new Date(data[index].reg_date);
						
					 

						show += '<div style="width : full; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;"> <div style="display: grid; grid-template-columns: 1fr 1fr;"> <div style="display: flex;"> <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div> <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div> </div> <div style="display: flex; justify-content: end;"> 하트 </div> </div>'+
								'<div style="font-weight: bold; font-size: 20px; margin: 6px 0;">'+
								data[index].proj_title+
								'</div> <div style="margin-bottom: 6px;"> 예상금액 <span style="font-weight: bold;">'+
								data[index].proj_cost+'원</span> | 예상 기간 <span style="font-weight: bold;">'+
								dDay.getFullYear()+'년'+(dDay.getMonth()+1)+'월'+dDay.getDate()+'일</span> </div>'+
						    
						   		 '<div style="display: grid; grid-template-columns: 1fr 1fr;"> <div style="display: flex; font-weight: bold;"> <span style="display: flex; align-items: center;">'+
						   		 data[index].work_field+
						         ' | '+data[index].region+' '+data[index].district+' |</span> <div style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">'+
						         
						         'JAVA'+
						         '</div> <div style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">'+
						         'MySql'+
						         '</div> </div> <div style="display: flex; justify-content: end;"> <span style="font-size: 14px; color : #444">'+
						         rDay.getFullYear()+'년'+(rDay.getMonth()+1)+'월'+rDay.getDate()+'일'+
						         '</span> </div> </div> </div>';
						
			});

			proList.append(show); 

				
			},	
		      error: function() {
		          alert("에러 발생");
		      }
		});
	}); // ss change 끝
	

});


</script>
</head>
<body>
	<h1> 프로젝트 찾기 </h1>
	${pNum} 개의 프로젝트가 등록되었습니다. <br>
	
	<!-- 필터 -->
<form action="/board/listPro" method="post">	
	<button type="submit" value="개발" id="wfg" name="work_field">개발</button>
	<button type="submit" value="기획" id="wfk" name="work_field">기획</button>
	<button type="submit" value="디자인" id="wfd" name="work_field">디자인</button>
	<button type="submit" value="퍼블리싱" id="wfp" name="work_field">퍼블리싱</button>
</form>	
<!-- 	<input type="button" value="상세"> -->


	<!-- modal -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  상세
</button>

<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">필터 추가하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<!-- form -->
					<form action="/enroll/enrollProj" method="post" id="fm1" name="fm1">
					업무 분야 <br> 
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
					<h2>관련 기술</h2>
					<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					<select name="skill_nm" class="selectSk" id="skillSelect" >
					<option disabled hidden selected></option>
					<option value="자바">자바</option>
					<option value="파이썬">파이썬</option>
					<option value="CSS">CSS</option>
					<option value="MySQL">MySQL</option></select>
					<button type="button" class="addButt removeAdd">추가하기</button>
					</div>
					<div class="listPt"></div>
					<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
		
					<hr>
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
					<h2>지역</h2>
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
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">필터 적용하기</button>
				</div>
				</form>
				<!--form  -->
			</div>
		</div>
	</div>

<div>
	<form id="sort">
		<select name="sn" id="ss" >
	<!-- 		<option value="reg_date">최신 등록 순</option>
			<option value="proj_cost">견적 높은 순</option>
			<option value="deadline">마감 임박 순</option> -->
			<option value="reg_date" <c:if test="${param.sn eq 'reg_date'}" >selected</c:if>>최신 등록 순</option>
			<option value="proj_cost" <c:if test="${param.sn eq 'proj_cost'}" >selected</c:if>>견적 높은 순</option>
			<option value="deadline" <c:if test="${param.sn eq 'deadline'}" >selected</c:if>>마감 임박 순</option>
		</select>
		 <input type="hidden" name="sn">
	</form>
</div>
	

 
	
<fieldset  id="pList" >

<!-- 회색 박스 -->
<c:forEach var="v" items="${list }">
<c:set var="skillList" value="${v.skill_nm }" />
<div OnClick="location.href ='/board/detailList?proj_no=${v.proj_no}'" style="width : full; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
    <!-- 모집중, NEW!, 하트 영역 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex;">
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div>
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
        </div>
        <div style="display: flex; justify-content: end;">
            하트
        </div>
    </div>

    <!-- 제목 -->
    <div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
        ${v.proj_title }
    </div>

    <!-- 예상 금액/ 예상 기간 -->
    <div style="margin-bottom: 6px;">
        예상금액 <span style="font-weight: bold;">${v.proj_cost }원</span> | 예상 기간 <span style="font-weight: bold;">${v.deadline }일</span>
    </div>

				<!-- 기타 정보 / 등록일자 -->
				<div style="display: grid; grid-template-columns: 1fr 1fr;">
					<div style="display: flex; font-weight: bold;">
						<span style="display: flex; align-items: center;">${v.work_field }
							| ${v.region } ${v.district } |</span>
						<c:forEach items="${fn:split(skillList, ',') }" var="skill">
							<button type="button" class="btn btn-warning">
								<c:out value="${skill}" />
							</button>
						</c:forEach>
						<br>

					</div>

					<div style="display: flex; justify-content: end;">
						<span style="font-size: 14px; color: #444">${v.reg_date }</span>
					</div>
				</div>

			</div>
</c:forEach>
</fieldset>


<!-- 페이징 처리 -->
<div>
    <ul class="pagination">
        <c:if test="${pageMaker.prev }">
            <li class="page-item previous">
                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
                <a class="page-link" href="${num }">${num }</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageMaker.next }">
            <li class="page-item next">
                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
            </li>
        </c:if>
    </ul>
</div>
	
<form id='actionForm' action="/board/listProP" method='get'>
	<input id="pageNum" type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input id ="amount" type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input id ="sn2" type='hidden' name='sn' value='reg_date'>
</form>


<script>

  var actionForm = $("#actionForm");

  $(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	actionForm.submit();
  });
</script>
<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	
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
      $(document).ready(function(){
    	  $('.selectSk').select2({
    	    dropdownParent: $('#exampleModal')    
        });
		})
			
		/* [추가하기] 클릭 */
				$(function() {
					$('.addButt').click(function(){
						let skill = $('.selectSk').val()

						
						/* [추가하기] 클릭 시 추가되는 기술 리스트 출력 */
						$('.listPt').prepend('<p><div class="border border-1 rounded-3 m-2 p-4" role="group" style="width: 230px; display: inline-block;"><input type="hidden" value='+$('.listPt').children("p").length+' name="count"><input type="hidden" value='+skill+' name="skill_nm"><span class="badge bg-warning m-3">'
						+skill+'</span><button class="removeSk btn-close" aria-label="Close"></button></div></p>');
		
					});
					
				});
				
				/* 리스트에 추가된 기술 삭제 */
				$(document).on('click','.removeSk',function(){
			        $(this).parent().remove()
			    })
			    
// 			    /* [추가하기] 클릭 동시에 버튼 삭제 */
// 				$(document).on('click','.removeAdd',function(){
// 			        $(this).parent().remove()
// 			    })
				

</script>
</body>
</html>
