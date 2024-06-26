<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<div style="margin-top: 30px;">
<div style="margin-left: 418px; display: inline-block; width:1070px;" >
<h3>${pNum} 명의 프리랜서가 등록되었습니다.</h3> <br>
	<!-- 필터 -->
	<div style="">
<form action="/board/listFreeFi" method="post" id="fbtn" style="display: inline-block;">	

		<input type="radio" value="개발" class="btn-check" name="work_field" id="radioWf1"  <c:if test='${param.work_field eq "개발"}' >checked</c:if>> 
		<label class="btn btn-outline-dark filterWf" for="radioWf1">⚙️ 개발</label> 
		<input type="radio" value="기획" class="btn-check" name="work_field" id="radioWf2" <c:if test='${param.work_field eq "기획"}' >checked</c:if>> 
		<label class="btn btn-outline-dark filterWf"" for="radioWf2">🛠️ 기획</label> 
		<input type="radio" value="디자인" class="btn-check" name="work_field" id="radioWf3" <c:if test='${param.work_field eq "디자인"}' >checked</c:if>> 
		<label class="btn btn-outline-dark filterWf"" for="radioWf3">🎨 디자인</label> 
		<input type="radio" value="퍼블리싱" class="btn-check" name="work_field" id="radioWf4" <c:if test='${param.work_field eq "퍼블리싱"}' >checked</c:if>> 
		<label class="btn btn-outline-dark filterWf"" for="radioWf4">🖋️ 퍼블리싱</label>
</form>	


	<!-- modal -->
<!-- Button trigger modal -->
<button type="button" class="btn btn-outline-dark filterWf" data-toggle="modal" data-target="#exampleModal" style="position: absolute; margin-left: 5px;">
  <img alt="" src="../resources/filter2.png" height="20px;">
</button>

<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">필터 추가하기</h5>
					<button type="button" class="close btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body p-4">
				<!-- form -->
					<form action="/board/moFiListFree" method="post" id="fm1" name="fm1">
						<h6 class="modalText"> 업무 분야 </h6> 
						<input type="radio" value="개발" class="btn-check" name="work_field" id="radio1"> 
						<label class="btn btn-outline-dark modalWf" for="radio1">⚙️ 개발</label> 
						<input type="radio" value="기획" class="btn-check" name="work_field" id="radio2"> 
						<label class="btn btn-outline-dark modalWf" for="radio2">🛠️ 기획</label> 
						<input type="radio" value="디자인" class="btn-check" name="work_field" id="radio3"> 
						<label class="btn btn-outline-dark modalWf" for="radio3">🎨 디자인</label> 
						<input type="radio" value="퍼블리싱" class="btn-check" name="work_field" id="radio4"> 
						<label class="btn btn-outline-dark modalWf" for="radio4">🖋️ 퍼블리싱</label>
						<hr>
						<h6 class="modalText">관련 기술</h6>
					
						<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
							<select class="selectSk">
								<option disabled hidden selected></option>
								<option value=".NET">.NET</option>
								<option value="AA">AA</option>
								<option value="Adobe Photoshop">Adobe Photoshop</option>
								<option value="AfterEffect">AfterEffect</option>
								<option value="Ajax">Ajax</option>
								<option value="Android">Android</option>
								<option value="Angular.js">Angular.js</option>
								<option value="Apache">Apache</option>
								<option value="Bootstrap">Bootstrap</option>
								<option value="C">C</option>
								<option value="C#">C#</option>
								<option value="C++">C++</option>
								<option value="CentOS">CentOS</option>
								<option value="Cloud">Cloud</option>
								<option value="CSS">CSS</option>
								<option value="DA">DA</option>
								<option value="Flutter">Flutter</option>
								<option value="Git">Git</option>
								<option value="GitHub">GitHub</option>
								<option value="Governance">Governance</option>
								<option value="HTML">HTML</option>
								<option value="IOS">IOS</option>
								<option value="ISP">ISP</option>
								<option value="JAVA">JAVA</option>
								<option value="Javascript">Javascript</option>
								<option value="JQuery">JQuery</option>
								<option value="JSON">JSON</option>
								<option value="JSP">JSP</option>
								<option value="Linux">Linux</option>
								<option value="MacOS">MacOS</option>
								<option value="MariaDB">MariaDB</option>
								<option value="Maven">Maven</option>
								<option value="MyBatis">MyBatis</option>
								<option value="MySQL">MySQL</option>
								<option value="Node.js">Node.js</option>
								<option value="Oracle">Oracle</option>
								<option value="PHP">PHP</option>
								<option value="PL">PL</option>
								<option value="PM">PM</option>
								<option value="PowerPoint">PowerPoint</option>
								<option value="Python">Python</option>
								<option value="React.js">React.js</option>
								<option value="Spring">Spring</option>
								<option value="Spring Boot">Spring Boot</option>
								<option value="Tomcat">Tomcat</option>
								<option value="Unity">Unity</option>
								<option value="Unix">Unix</option>
								<option value="VisualStudio">VisualStudio</option>
								<option value="Vue.js">Vue.js</option>
								<option value="Windows">Windows</option>
								<option value="모바일 웹/앱">모바일 웹/앱</option>
								<option value="앱디자인">앱디자인</option>
								<option value="웹디자인">웹디자인</option>
								<option value="전자정부프레임워크">전자정부프레임워크</option>
								<option value="한글">한글</option>
							</select>
							<button type="button" class="btn btn-dark addButt removeAdd">+</button>
                     </div>
						
					<div class="listPt"></div>
					<!-- [추가하기] 클릭 시 추가되는 기술 리스트 출력되는 공간-->
					모달
					<hr>
					<h6 class="modalText">숙련도</h6>
					<div class="btn-group" role="group"
						aria-label="Basic checkbox toggle button group">
						<input type="radio" value="주니어" class="btn-check" name="job_lev" id="radioLev1">
						<label class="btn btn-outline-dark modalWf" for="radioLev1">주니어</label>
						<input type="radio" value="미들" class="btn-check" name="job_lev" id="radioLev2">
						<label class="btn btn-outline-dark modalWf" for="radioLev2">미들</label>
						<input type="radio" value="시니어" class="btn-check" name="job_lev" id="radioLev3">
						<label class="btn btn-outline-dark modalWf" for="radioLev3">시니어</label>
					</div> 

					<hr>
					<h6 class="modalText">근무 가능 위치</h6>
					<select name='region' onchange="change(this.selectedIndex);"
						class=input>
						<option value="">전체</option>
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
					<input type='hidden' name='modalCheck' value='modalCheck'>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button> -->
					<button type="submit" class="btn btn-dark" id="filterBtn">필터 적용하기</button>
				</div>
				</form>
				<!--form  -->
			</div>
		</div>
	</div>

<div style="margin-bottom: 50px;">
<!-- 	<form id="sort" style="display: inline-box;"> -->
<!-- 		<select name="sn" id="ss" style="display: inline-block; float: right; width: 10rem; padding: 7px ;"> -->
<%-- 			<option value="reg_date" <c:if test="${param.sn eq 'reg_date'}" >selected</c:if>>최신 등록 순</option> --%>
<%-- 			<option value="proj_cost" <c:if test="${param.sn eq 'proj_cost'}" >selected</c:if>>견적 높은 순</option> --%>
<%-- 			<option value="deadline" <c:if test="${param.sn eq 'deadline'}" >selected</c:if>>마감 임박 순</option> --%>
<!-- 		</select> -->
<!-- 		 <input type="hidden" name="sn"> -->
<!-- 	</form> -->
</div>
</div>
</div>
<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
<!--  <div class="card overflow-hidden card-2" > -->
  <div class="row no-gutters row-bordered row-border-light">
 
<div id="ajax_contetns">
<fieldset  id="pList" >

<!-- 회색 박스 -->
<c:forEach var="v" items="${list }">
<c:set var="skillList" value="${v.skill_nm }" />
<div class="card-2 projHover">
    <form role="form" method="post">
    	<input type="hidden" id="free_no" value="${v.free_no }">
    </form>
    <!-- 모집중, NEW!, 하트 영역 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex;">
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">구직중</div>
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
        </div>
    <!-- 로그인 여부, 북마크 여부체크 -->    
        <div style="display: flex; justify-content: end;">
        <c:choose>
	        <c:when test="${not empty sessionScope.ct_no }">
				<c:set var="Bookmarked" value="false" />
				<c:forEach  var="b" items="${bMproj_no }">
					<c:if test="${v.free_no == b.free_no }">
						<c:set var="Bookmarked" value="true" />
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${Bookmarked}">
					<!-- 북마크 확인용 임시 데이터, 수정 필요 -->
						<a href="javascript:" class ="heart-click" value="${v.free_no }">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="crimson" class="bi bi-heart-fill" viewBox="0 0 16 16" >
		  				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
						</svg>
						</a>
					<!-- 하트 -->
					</c:when>
					<c:otherwise>
					<!-- 빈 하트 -->
						<a href="javascript:" class ="heart-click" value="${v.free_no }">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="crimson" class="bi bi-heart" viewBox="0 0 16 16" >
				 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
							</svg>
						</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
					<!-- 프리랜서가 아닐때  -->
						<a href="javascript:" class ="noHeart" value="${v.free_no }">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="crimson" class="bi bi-heart" viewBox="0 0 16 16" >
				 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
							</svg>
						</a>
			</c:otherwise>
	</c:choose>	
        </div>
    </div>

    <!-- 제목 -->
   <div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
        <a href="/board/detailListFree?free_no=${v.free_no}" class="titleCss">${v.oneline_bio }</a>
    </div>

    <div style="margin-bottom: 6px;">
        분야 <span style="font-weight: bold;">${v.work_field }</span> |${v.job_lev }  <span style="font-weight: bold;"></span>
    </div>

				<!-- 기타 정보 / 등록일자 -->
				<div style="display: grid; grid-template-columns: 1fr 1fr;">
					<div style="display: flex; font-weight: bold;">
						<span style="display: flex; align-items: center;">
							학력 | ${v.school_type } ${v.grad_status }
							지역 | ${v.region } ${v.district } |</span>
						<c:forEach items="${fn:split(skillList, ',') }" var="skill">
							<span class="badge bg-secondary mx-1" style="font-size: 14px; background-color:#31b9a9 !important;">
								<c:out value="${skill}" />
							</span>
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
</div>

</div>
   </div>
   
  </div>
<!-- 페이징 처리 -->
<div style=" text-align: center;" class="my-3">
    <ul class="pagination" style="display: inline; ">
        <c:if test="${pageMaker.prev }">
            <li class="page-item previous" style="display: inline-block; ">
                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" style="display: inline-block; ">
                <a class="page-link" href="${num }">${num }</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageMaker.next }">
            <li class="page-item next" style="display: inline-block; ">
                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
            </li>
        </c:if>
    </ul>
</div>
	
<form id='actionForm' action="/board/listFreeP" method='get'>
	<input id="pageNum" type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input id ="amount" type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input id ="sn2" type='hidden' name='sn' value='reg_date'>
	<input id ="work_field2" type='hidden' name='work_field' value='개발'>
	
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





<script>
$(document).ready(function(){
  var actionForm = $("#actionForm");
  

  /* 페이징 버튼 클릭 */
  $(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	if('${modalCheck}' != ''){
		actionForm.append("<input id ='skill_nm' type='hidden' name='skill_nm' value='${skill_nm}'>");
		actionForm.append("<input id ='job_level' type='hidden' name='job_level' value='${job_level}'>");
		actionForm.append("<input id ='region' type='hidden' name='region' value='${region}'>");
		actionForm.append("<input id ='district' type='hidden' name='district' value='${district}'>");
		actionForm.append("<input id ='modalCheck' type='hidden' name='modalCheck' value='${modalCheck}'>");
		actionForm.attr("action","/board/moFiListFree");
		actionForm.attr("method","post");
		actionForm.submit();
	}
	actionForm.submit();
  });
  
  /* 정렬 변경 */
  $("#ss").change(function(){
		var sn = $('#ss').val();
		//var pageNum = $('#pageNum').val();
		//var amount = $('#amount').val();
		//var list = "";
		console.log(sn)
		
		$("#sn2").val( $("#ss").val() );
		actionForm.find("input[name='pageNum']").val(1);
		if('${modalCheck}' != ''){
			actionForm.append("<input id ='skill_nm' type='hidden' name='skill_nm' value='${skill_nm}'>");
			actionForm.append("<input id ='job_level' type='hidden' name='job_level' value='${job_level}'>");
			actionForm.append("<input id ='region' type='hidden' name='region' value='${region}'>");
			actionForm.append("<input id ='district' type='hidden' name='district' value='${district}'>");
			actionForm.append("<input id ='modalCheck' type='hidden' name='modalCheck' value='${modalCheck}'>");
			actionForm.attr("action","/board/moFiListFree");
			actionForm.attr("method","post");
			actionForm.submit();
		}
	  	actionForm.submit();
  });
  
  /* 필터버튼 클릭 */
  $("#work_field_m").change(function(){
	  e.stopImmediatePropagation();
  });
  
  $("#fbtn").change(function(){
		$('#work_field2').val($("input:radio[name='work_field']:checked").val());
		var sn = $('#ss').val();

		actionForm.find("input[name='pageNum']").val(1);
		actionForm.submit();
		
	  
  });

});  
</script>
<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->

	
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
				$('.listPt').prepend('<p><div class="border border-1 rounded-3 m-2 p-4" role="group" style="width: 230px; display: inline-block;"><input type="hidden" value='+$('.listPt').children("p").length+' name="count"><input type="hidden" value="'+skill+'" name="skill_nm"><span class="badge bg-warning m-3">'
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
		
		// 하트 클릭
		$(".heart-click").click(function(e){
			 
			e.stopImmediatePropagation();
			 
			let free_no = $(this).attr('value');
			console.log(free_no);
			
			// 빈하트 클릭
			if($(this).children('svg').attr('class') == "bi bi-heart"){
				console.log("빈하트 클릭");
				
				$.ajax({
					url : '/board/dobMarkC',
					type: 'get',
					data:{
						free_no : free_no
					},
					sucess : function(){
						
					},
					error : function(){
						alert('오류 발생');
					}
				});
				
				$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-heart-fill' viewBox='0 0 16 16'> <path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314'/></svg>")
				
			// 하트 클릭
			}else if($(this).children('svg').attr('class') == "bi bi-heart-fill"){
				console.log("하트 클릭");
				
				$.ajax({
					url : '/board/deletebMarkC',
					type: 'get',
					data:{
						free_no : free_no
					},
					sucess : function(){
						
					},
					error : function(){
						alert('오류 발생');
					}
				});
				
				$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width'16' height='16' fill='currentColor' class='bi bi-heart' viewBox='0 0 16 16'><path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15'/></svg>")
				
			}
		});
		
		// 클라이언트가 아닐때 하트 클릭
		$(".noHeart").click(function(e){
			e.stopImmediatePropagation();
			alert("클라이언트로 로그인 해야 합니다");
		});
		
		$(document).ready(function(){
			if(${!empty param.sn}){
			$("#sn2").val( $("#ss").val() );		
			}
			if(${empty param.sn}){
				var sn = "";
				sn = $('#ss').val("reg_date");
			}
			
			if(${empty param.work_field}){
			 $("#radioWf1").prop("checked",true);		
			}else{
				$('#work_field2').val($("input:radio[name='work_field']:checked").val());
			}
			

		});



</script>
</body>
</html>
