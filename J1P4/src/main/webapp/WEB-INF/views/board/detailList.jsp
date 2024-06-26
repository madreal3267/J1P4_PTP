<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
free_no: ${sessionScope.free_no },
<%-- ct_no: ${sessionScope.ct_no } --%>

<div class="container light-style flex-grow-1 container-p-y text-center" style="width:1100px; padding-top:15px;padding-bottom: 10px;">
	<!-- 프로젝트 상세페이지 상단 박스 시작 -->
	<div class="card overflow-hidden card-2" style="height: 150px;">
		<!-- 프로젝트 정보 출력 -->
		<p class="userName" style="position: absolute; left:180px; top:35px; font-size: 30px; font-weight: bold;"></p>
		<div style="display: inline-block; position: absolute; left:20px;top:35px;">
		<span class="workField" style="font-size: 16px; margin-right:7px;">예상 금액</span>
		<span class="userWf" style="font-size: 16px; font-weight: bold; border-right: 1px solid gray; padding-right: 10px;">${projectVO.proj_cost } 원</span>
		<span class="level" style="margin-left:7px; margin-right:7px;font-size: 16px;">모집 마감일</span>
		<span class ="userLev" style="font-size: 16px; font-weight: bold;">${projectVO.deadline }</span> <br>
		</div>
		<div style="display: inline-block; position: absolute; left:20px;bottom:60px;">
		<span class="workField" style="font-size: 16px; margin-right:7px; ">분야</span>
		<span class="userWf" style="font-size: 16px; font-weight: bold; border-right: 1px solid gray; padding-right: 10px;">${projectVO.work_field }</span>
		<span class="level" style="margin-left:7px; margin-right:7px;font-size: 16px;">지역</span>
		<span class ="userLev" style="font-size: 16px; font-weight: bold;">${projectVO.region} ${projectVO.district}</span> <br>
		</div>
		<div style="display: inline-block; position: absolute; left:20px;bottom:15px;">
		       <div class="rating-display">
		<span class="workField" style="font-size: 16px; margin-right:7px; ">클라이언트 평점</span>
                        <c:set var="score" value="${score}" />
                        <c:forEach begin="1" end="5" var="i">
                        
                           <span class="star ${ score >= (i * 2)-1 ? 'filled' : ''}">
                              <c:choose>
                                 <c:when test="${score >= i * 2}">
                                    <i class="fa fa-star fa-2x" ></i>
                                 </c:when>
                                 <c:when test="${score >= (i * 2) - 1}">
                                    <i class="fa fa-star-half-empty fa-2x"></i>
                                 </c:when>
                                 <c:otherwise>
                                    <i class="fa fa-star-o fa-2x" ></i>
                                 </c:otherwise>
                              </c:choose>
                           </span>
                           </c:forEach>
      			</div>
		</div>
		<!-- 프로젝트 타이틀 말풍선 -->
		<div class="border border-secondary rounded p-2" style="padding-left:5px;position: absolute; top:35px; right:54px; font-size: 20px; font-weight: bold;">" ${projectVO.proj_title} "</div>
		
		<!-- 스킬 -->
		<div style="display: inline-block; position: absolute; right:54px; bottom:30px;">
			<c:set var="skillList" value="${projectVO.skill_nm }" />
			<c:forEach items="${fn:split(skillList, ',') }" var="skill">
					<span style="font-size: 16px;" class="badge bg-light text-dark border">
					<c:out value="${skill}" />
					</span>
			</c:forEach>
		</div>
	</div>	
</div>
	<!-- 프리랜서 상세페이지 상단 끝 -->

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">
  

		
	<div class="col-md-9">
	<div class="tab-content">
	
		<!-- 업무조건 탭 시작 -->
		<div class="tab-pane fade active show" id="free_condition"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">${projectVO.proj_title}</h4>
			</div>
			<div class="mx-4 my-3">

			<hr>
			<div class="gap">
				<h5>클라이언트 위치</h5>
				<div class="content">
					<span style="margin-left:7px;">${projectVO.region} ${projectVO.district}</span>
				</div>
			</div>	
			<hr>
			<div class="gap">
				<h5>미팅</h5>
				<div class="content">
				<b style="border-right: 1px solid gray; padding-right: 10px;">사전 미팅 방식</b>
					<span style="margin-left:7px;"> ${projectVO.pmeet_meth}</span>
				<br>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">프로젝트 진행중 미팅</b>
				<span style="margin-left:7px;">
				${projectVO.meet_cycle}
				</span>
				</div>
				</div>
			</div>
			<hr>
			<div class="gap">	
				<h5>희망 조건</h5>
				<div class="content" style="margin-bottom: 60.71px; ">
				<b style="border-right: 1px solid gray; padding-right: 10px;">주요 기술 스택</b>
				<span style="margin-left:7px;">
				${projectVO.skill_nm}<br>
				</span>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">구인 등급</b>
				<span style="margin-left:7px;">
				${projectVO.job_level}
				</span>
				</div>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">희망 경력</b>
				<span style="margin-left:7px;">
				${projectVO.wanted_career}
				</span>
				</div>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">경력 증빙 자료</b>
				<span style="margin-left:7px;">
				${projectVO.career_proof}
				</span>
				</div>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">전달 사항 또는 우대 사항</b>
				<span style="margin-left:7px;">
				 ${projectVO.dlvy_msg}
				</span>
				</div>
				</div>
			</div>
			<hr>
			<div class="gap">
				<h5>프로젝트 상세 내용</h5>
				<div class="content">
				<h4><span class="badge rounded-pill bg-secondary">${projectVO.proj_content}</span></h4>
				</div>
			</div>	
		</div>
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 업무조건 탭 끝 -->
	

	
	</div>		
	</div>


</div>
</div>
</div>


   <c:if test="${sessionScope.free_no != null }">     
	 <div style="background-color: white; border: 1px solid #333; position: fixed; bottom: 10px; right: 0; width: 200px; display: block; font-size: 0;">
		<div class="eframe-pop-width py-0 mx-auto">
			<div class="inline-block relative w-full py-4 px-3 md:py-8 md:px-14 bg-gray-c_43 md:rounded whitespace-nowrap">
		
		<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#applyModal" id="appBtn" style="display: inline-block; margin-right: 35px;">
		  지원하기
		</button>
		
		<!-- 로그인 여부, 북마크 여부체크 -->    
        <div style="display: inline-block; justify-content: end;">
        <c:choose>
	        <c:when test="${not empty sessionScope.free_no }">
				<c:set var="Bookmarked" value="false" />
				<c:forEach  var="b" items="${bMproj_no }">
					<c:if test="${projectVO.proj_no == b.proj_no }">
						<c:set var="Bookmarked" value="true" />
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${Bookmarked}">
					<!-- 북마크 확인용 임시 데이터, 수정 필요 -->
						<a href="javascript:" class ="heart-click" value="${projectVO.proj_no }">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="crimson" class="bi bi-heart-fill" viewBox="0 0 16 16" >
		  				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
						</svg>
						</a>
					<!-- 하트 -->
					</c:when>
					<c:otherwise>
					<!-- 빈 하트 -->
						<a href="javascript:" class ="heart-click" value="${projectVO.proj_no }">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="crimson" class="bi bi-heart" viewBox="0 0 16 16" >
				 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
							</svg>
						</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
					<!-- 프리랜서가 아닐때  -->
						<a href="javascript:" class ="noHeart" value="${projectVO.proj_no }">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="crimson" class="bi bi-heart" viewBox="0 0 16 16" >
				 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
							</svg>
						</a>
			</c:otherwise>
	</c:choose>	
  </div>



		</div>
	</div>
</div>
</c:if>



<!-- 지원하기 모달창 시작 -->
<form id="fm1">

<div class="modal fade" id="applyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	    
	
	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 지원하기</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->		
				
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	<div class="m-2">
	최근 프로필 업데이트일은 ㅇㅇㅇ입니다. 
<!-- 	<a href="" >내 프로필 관리 ></a> -->
	  <c:if test="${sessionScope.user_type.equals('개인') or sessionScope.user_type.equals('팀') }">
          <a href="/myProfile/profile?free_no=${sessionScope.free_no }" >내 프로필 관리</a>
      </c:if>
      <c:if test="${sessionScope.user_type.equals('사업자') }">
          <a href="/myProfile/profileB?free_no=${sessionScope.free_no }" >내 프로필 관리</a>
      </c:if>
	</div>
	<hr>
	<div class="m-2">
	해당 스펙 및 경험이 있다면 체크 부탁드립니다. (❁´◡`❁)
	</div>
		
	<c:forEach var="skill" items="${skill }" varStatus="status">
	<div class="border border-1 rounded-3 m-2 p-4" role="group" style="width: 230px; display: inline-block;">
	<input type="hidden" name="free_no" value="${sessionScope.free_no }">
	<!-- value에 원활한 테스트를 위해 임시로 상수 4를 넣음 추후 세션으로 아이디값을 받아 select로 free_no를 받아 넣을 예정 -->
	<input type="hidden" name="proj_no" value="${projectVO.proj_no }">
	<!-- value에 원활한 테스트를 위해 임시로 상수 101을 넣음 추후 상세 페이지 주소줄에서 파라미터값을 받아 넣을 예정  -->
	<h4><span class="badge bg-warning">${skill.skill_nm }</span></h4>
	<input type="radio" value="${skill.skill_nm }" name="skillCheck${status.count}" id="radioSk${status.index}">
	<label for="radioSk${status.index}"> 있음 </label>
	<input type="radio" value="${skill.skill_nm } 없음" name="skillCheck${status.count}" id="radioSk_${status.count}">
	<label for="radioSk_${status.count}"> 없음 </label>
	<!-- count : 1부터 시작 / index : 0부터 시작 -->
	</div>

	</c:forEach>
	<hr>
	<div class="m-2">
	남기는 글
	</div>
	<div>
	<textarea rows="10" cols="88" name="content" class="m-2"></textarea>
	</div>
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  <input type="button" class="btn btn-primary" id="submitButt" value="지원"
	  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#applyModalSucc">
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	
</div>
</div>
</div>
	
</form>
<!-- 지원하기 모달창 시작 -->

<!-- 지원 성공 후 모달창 시작 -->
<div class="modal fade" id="applyModalSucc" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	

	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 지원완료</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->	
	
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body" style="text-align: center;">
	<h3>프로젝트 지원이 완료되었습니다.</h3>
	<h5>지원한 프로젝트 현황은 [내 프로젝트 관리]에서 확인 가능합니다.</h5>
	<h3>축하축하룽💃🏼🕺 축하축하룽👯‍♀️ 축하축하룽🧚🏻‍♀️ 축하축하룽🤸‍♀️축하축하룽🤹 축하축하룽🎷 축하축하룽🎸 축하축하룽🎤
	축하축하룽🎻 축하축하룽🚀 축하축하룽🎡 축하축하룽🎇 축하축하룽🎉 축하축하룽🎊 축하축하룽🎀 축하축하룽🛍 축하축하룽🎁</h3>
	
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	  
</div>
</div>
</div>
<!-- 지원 성공 후 모달창 끝 -->


<!-- JQuery 자바스크립트 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script>



	$(function() {

// 		alert("테스트!");
// 		var free_no = ${sessionScope.free_no}
// 		console.log(free_no);
		
// 		$("#appBtn").click(function() {

// 			if(free_no == null){
// 				alert("프리랜서 로그인이 필요합니다");
// 			}else if(free_no != null){
// 	            //$("#appBtn").attr("data-bs-target","#applyModal");
// 				$('#applyModal').modal('show');
// 			}
// 		});
            

		$("#submitButt").click(function() {
			$.ajax({
				url : "/projectDetail/applyProj",
				type : "POST",
				data : $("#fm1").serialize(),
				success : function() {
				},
				error : function() {
					alert("오류발생");
				}
			});
		
		
	});
</script>
<script type="text/javascript">
// 하트 클릭
$(".heart-click").click(function(e){
	 
	//e.stopImmediatePropagation();
	 
	let proj_no = $(this).attr('value');
	console.log(proj_no);
	
	// 빈하트 클릭
	if($(this).children('svg').attr('class') == "bi bi-heart"){
		console.log("빈하트 클릭");
		
		$.ajax({
			url : '/board/dobMark',
			type: 'get',
			data:{
				proj_no : proj_no
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
			url : '/board/deletebMark',
			type: 'get',
			data:{
				proj_no : proj_no
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

//클라이언트가 아닐때 하트 클릭
$(".noHeart").click(function(e){
	e.stopImmediatePropagation();
	alert("프리랜서로 로그인 해야 합니다");
});
</script>
</body>
</html>