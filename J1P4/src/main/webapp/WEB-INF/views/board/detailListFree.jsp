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
<%-- free_no:${free_no } --%>
<div class="container light-style flex-grow-1 container-p-y text-center" style="width:1100px; padding-top:15px;padding-bottom: 10px;">
	<!-- 프리랜서 상세페이지 상단 박스 시작 -->
	<div class="card overflow-hidden card-2">
		<!-- 프리랜서 정보 출력 : 이름 / 분야 / 레벨 -->
		<p class="userName" style="position: absolute; left:180px; top:35px; font-size: 30px; font-weight: bold;">${myUser.name}</p>
		<div style="display: inline-block; position: absolute; left:180px;bottom:40px;">
		<span class="workField" style="font-size: 16px; margin-right:7px;">분야</span>
		<span class="userWf" style="font-size: 16px; font-weight: bold; border-right: 1px solid gray; padding-right: 10px;">${myProfile.work_field }</span>
		<span class="level" style="margin-left:7px; margin-right:7px;font-size: 16px;">레벨</span>
		<span class ="userLev" style="font-size: 16px; font-weight: bold;">${myCareer[0].job_lev }</span>
		</div>
		
		<!-- 한줄 소개 말풍선 -->
		<div class="border border-secondary rounded p-2" style="padding-left:5px;position: absolute; top:35px; right:54px; font-size: 20px; font-weight: bold;">" ${myProfile.oneline_bio} "</div>
		
		<!-- 스킬 -->
		<div style="display: inline-block; position: absolute; right:54px; bottom:30px;">
			<c:forEach items="${mySkill }" var="mySkill">
				<c:if test="${not empty mySkill.skill_nm }">
					<span style="font-size: 16px;" class="badge bg-light text-dark border">
					${mySkill.skill_nm }
					</span>
				</c:if>
			</c:forEach>
		</div>
		
		<!-- 프로필 사진 -->
		<img src="../resources/증명1.jpg" alt="profile" width="100" height="100" class="border border-secondary rounded-circle my-4 mx-5">
	</div>
	<!-- 프리랜서 상세페이지 상단 끝 -->
</div>

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">
  
      <!-- 사이드 메뉴 시작 -->
	<div class="col-md-3 pt-0">
		<div class="list-group list-group-flush account-settings-links" style="width:274px;">
			<h4 class="font-weight-bold py-1 mx-4 my-3">내 프로필</h4>
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
				<h5>업무 가능 분야</h5>
				<div class="content">
				<h4><span class="badge rounded-pill bg-secondary">${myProfile.work_field }</span></h4>
				</div>
			</div>	
			<hr>
			<div class="gap">
				<h5>업무 상태</h5>
				<div class="content">
				<b style="border-right: 1px solid gray; padding-right: 10px;">업무 가능 여부</b>
					<c:if test="${myProfile.work_check=='1'}">
					<span style="margin-left:7px;">가넝한</span>
					</c:if>
					<c:if test="${myProfile.work_check=='0'}">
					<span style="margin-left:7px;">불가넝한</span>
					</c:if>
				<br>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">업무시작 가능일</b>
				<span style="margin-left:7px;">
				${myProfile.work_date}
				</span>
				</div>
				</div>
			</div>
			<hr>
			<div class="gap">	
				<h5>희망 조건</h5>
				<div class="content" style="margin-bottom: 60.71px; ">
				<b style="border-right: 1px solid gray; padding-right: 10px;">희망 프로젝트 대금</b>
				<span style="margin-left:7px;">
				${myProfile.proj_cost }원<br>
				</span>
				<div class="checkGap">
				<b style="border-right: 1px solid gray; padding-right: 10px;">희망 지역</b>
				<span style="margin-left:7px;">
				${myReg.region } ${myReg.district }
				</span>
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
					<input type="text" readonly="readonly" value="${myProfile.oneline_bio}" style="width:710px;">
					</div>
			</div>
			<hr>
			<div class="gap">		
				<h5>자기 소개서</h5>
					<div class="content">
					<textarea cols="84" rows="10" readonly="readonly">${myProfile.bio}</textarea>
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
				<div class="content" style="margin-bottom: 367px;">
				<c:forEach items="${mySkill }" var="mySkill">
					<c:if test="${empty mySkill.skill_nm } ">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px;">
					<span style="padding-left: 20px; font-size: 22px;" >등록된 기술이 없습니다.</span><br>
					</div>
					</c:if>
					<c:if test="${not empty mySkill.skill_nm }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px;">
						<div style="padding-bottom:5px;">
						<span style="padding-left: 20px; font-size: 22px; font-weight: bold;">${mySkill.skill_nm }</span><br>
						</div>
						<span style="padding-left: 20px;"> 레벨 : ${mySkill.skill_lev }</span>
					</div>
					</c:if>
				</c:forEach>
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
				<h4><span class="badge rounded-pill bg-secondary">${myCareer[0].job_lev }</span></h4>
				
				</div>
			</div>
			<hr>
			<div class="gap">	
				<h5>경력</h5>
				<div class="content" style=" margin-bottom: 230.7px;">
				<c:forEach items="${myCareer }" var="myCareer">
					<c:if test="${empty myCareer.company_nm }">
						<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px;">
						<span style="padding-left: 20px; font-size: 22px;" >등록된 경력이 없습니다.</span><br>
						</div>
					</c:if>
					<c:if test="${not empty myCareer.company_nm }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
						<span style="padding-left: 20px; font-size: 18px; font-weight: bold;">${myCareer.company_nm }</span><br>
						<span style="padding-left: 20px;">${myCareer.join_date } ~ ${myCareer.quit_date }</span><br>
						<span style="padding-left: 20px;">${myCareer.responsibility }</span>
					</div>
					</c:if>
				</c:forEach>
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
				<div class="content" style="margin-bottom: 367px;">
					<c:if test="${empty myProfile.school_nm }">
						<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
						<span style="padding-left: 20px; font-size: 22px;" >등록된 학력이 없습니다.</span><br>
						</div>
					</c:if>
					<c:if test="${not empty myProfile.school_nm }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px;">
					<span style="padding-left: 20px; font-size: 18px; font-weight: bold;">${myProfile.school_nm} |
					${myProfile.major}</span> <br>
					<span style="padding-left: 20px;">${myProfile.school_type}</span> <br>
					<span style="padding-left: 20px;">${myProfile.entrance} ~ ${myProfile.graduation} |
					 ${myProfile.grad_status}</span><br>
					</div>
					</c:if>
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
				<div class="content" style="margin-bottom: 367px;">
				<c:forEach items="${myLicense }" var="myLicense">
					<c:if test="${empty myLicense.license_nm }">
						<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
						<span style="padding-left: 20px; font-size: 22px;" >등록된 자격증이 없습니다.</span><br>
						</div>
					</c:if>
					<c:if test="${not empty myLicense.license_nm }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">	
						<span style="padding-left: 20px;font-size: 18px; font-weight: bold;">${myLicense.license_nm }</span><br>
						<span style="padding-left: 20px;">${myLicense.issuer } | ${myLicense.qualify_date }</span>	
					</div>
					</c:if>
				</c:forEach>
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
	            <div class="content" style="margin-bottom: 367px;">
	            <c:forEach items="${myPortf }" var="myPortf">
	               <c:if test="${empty myPortf.portfolio_title }">
	                  <div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
	                  <span style="padding-left: 20px; font-size: 22px;" >등록된 포트폴리오가 없습니다.</span><br>
	                  </div>
	               </c:if>
	               <c:if test="${not empty myPortf.portfolio_title }">
	               <div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">   
	                  <span style="padding-left: 20px;font-size: 18px; font-weight: bold;">${myPortf.portfolio_title }</span><br>
	                  <span style="padding-left: 20px;">${myPortf.p_responsibility }</span><br>
	                  <span style="padding-left: 20px;">
	                  <a href="/myProfile/download?fileName=${myPortf.file }">${myPortf.file }</a></span><br>
	               </div>
	               </c:if>
	            </c:forEach>
	            </div>
	         </div>
	         </div>      
	      </div>
	      <!-- card body 끝 -->
	      </div>
	      <!-- 포트폴리오 탭 끝 -->
		
	
	
	
	</div>		
	</div>










</div>
</div>
</div>
</div>

 <c:if test="${sessionScope.ct_no != null }">
          
	 <div style="background-color: white; border: 1px solid #333; position: fixed; bottom: 10px; right: 420px; width: 200px; display: block; font-size: 0;">
		<div class="eframe-pop-width py-0 mx-auto">
			<div class="inline-block relative w-full py-4 px-3 md:py-8 md:px-14 bg-gray-c_43 md:rounded whitespace-nowrap">
	
		<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#offerModal" id="offBtn" style="display: inline-block; margin-right: 35px;" >
		  제안하기
		</button>
				   <!-- 로그인 여부, 북마크 여부체크 -->    
	        <div style="display: inline-block; justify-content: end;">
	        <c:choose>
		        <c:when test="${not empty sessionScope.ct_no }">
					<c:set var="Bookmarked" value="false" />
					<c:forEach  var="b" items="${bMproj_no }">
						<c:if test="${free_no == b.free_no }">
							<c:set var="Bookmarked" value="true" />
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${Bookmarked}">
						<!-- 북마크 확인용 임시 데이터, 수정 필요 -->
							<a href="javascript:" class ="heart-click" value="${free_no }">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="crimson" class="bi bi-heart-fill" viewBox="0 0 16 16" >
			  				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
							</svg>
							</a>
						<!-- 하트 -->
						</c:when>
						<c:otherwise>
						<!-- 빈 하트 -->
							<a href="javascript:" class ="heart-click" value="${free_no }">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="crimson" class="bi bi-heart" viewBox="0 0 16 16" >
					 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
								</svg>
							</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
						<!-- 프리랜서가 아닐때  -->
							<a href="javascript:" class ="noHeart" value="${free_no }">
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
<!-- 제안하기 모달창 시작 -->
<form id="fm1">

<div class="modal fade" id="offerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	    
	
	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 제안하기</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->		
				
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	프리랜서에게 제안할 프로젝트를 골라주떼욤 (❁´◡`❁)
	<hr>
		<!-- 아코디언 시작 본문 -->
		<div class="accordion accordion-flush" id="accordionFlushExample">
 			<c:forEach var="proj" items="${proj }">
 			<div class="btn-group mb-2" role="group" aria-label="Button group with nested dropdown" >
		   	<input type="hidden" name="free_no" value="${param.free_no }">
		   	<!-- 프리랜서 상세페이지 주소값 파라미터에서 value값 받아오기 ${params.free_no } -->
		   	<input type="radio" name="proj_no" class="mx-3" value="${proj.proj_no }"> 
   			<div class="accordion-item" style="width: 700px;">
   			<h2 class="accordion-header">
		    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${proj.proj_no }" aria-expanded="false" aria-controls="flush-collapse${proj.proj_no }">
		        ${proj.proj_title } 
		    </button>
    		</h2>
    			<div id="flush-collapse${proj.proj_no }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body">
				     분야 : ${proj.work_field }<br>
				     예상 시작일 : ${proj.start_date }<br>
				     머니머니 : ${proj.proj_cost }<br>
				     상세내용 : ${proj.proj_content }
					</div>
				</div>
			</div>
  			</div>
 			</c:forEach> 
		</div>
		<!-- 아코디언 본문 끝 -->
		
	<!-- 모달 footer 시작 -->
	<div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	  <input type="button" class="btn btn-primary" id="submitButt" value="제안"
	  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#offerModalSucc">
	</div>
	<!-- 모달 footer 끝-->
	
	</div>
	<!-- 모달 본문 끝 -->
	
</div>
</div>
</div>
	
</form>
<!-- 제안하기 모달창 끝 -->

<!-- 제안 성공 후 모달창 시작 -->
<div class="modal fade" id="offerModalSucc" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
<div class="modal-content">	

	<!-- 모달 header 시작 -->		
	<div class="modal-header">
	<h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 제안완료</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<!-- 모달 header 끝 -->	
	
	<!-- 모달 본문 시작 -->   			   
	<div class="modal-body">
	<h1>제안 성공했삼</h1>
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
<!-- 제안 성공 후 모달창 끝 -->

<!-- JQuery 자바스크립트 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script>
$(function() {
	$("#submitButt").click(function() {

		$.ajax({
			url : "/board/offerProj",
			type : "POST",
			data : $("#fm1").serialize(),
			success : function() {
// 				alert("성공");
			},
			error : function() {
				alert("오류발생");
			}
			
		});			
	});
});

var ct_no = ${sessionScope.ct_no}
console.log(ct_no);


// $("#offBtn").click(function () {
// 	if(${ct_no == null}){

// 	$('#fm1').on('show.bs.modal', function (e) {
// 		 e.preventDefault();
// 	})
// 	alert("클라이언트 로그인이 필요합니다")		
// 	}
	
// })

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
				
				$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='crimson' class='bi bi-heart-fill' viewBox='0 0 16 16'> <path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314'/></svg>")
				
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
				
				$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='crimson' class='bi bi-heart' viewBox='0 0 16 16'><path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15'/></svg>")
				
			}
		});

// 클라이언트가 아닐때 하트 클릭
$(".noHeart").click(function(e){
	e.stopImmediatePropagation();
	alert("클라이언트로 로그인 해야 합니다");
});




</script>
<%@ include file="../include/footer.jsp" %>