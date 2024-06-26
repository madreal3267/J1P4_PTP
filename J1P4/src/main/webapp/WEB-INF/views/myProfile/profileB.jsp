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

<div class="container light-style flex-grow-1 container-p-y text-center" style="width:1100px; padding-top:15px;padding-bottom: 10px;">
	<!-- 프리랜서 상세페이지 상단 박스 시작 -->
	<div class="card overflow-hidden card-2">
		<!-- 프리랜서 정보 출력 : 이름 / 분야 / 레벨 -->
		<p class="userName" style="position: absolute; left:180px; top:35px; font-size: 30px; font-weight: bold;">커밋 컴퍼니</p>
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
		<img src="../resources/커밋.jpg" alt="profile" width="100" height="100" class="border border-secondary rounded-circle my-4 mx-5">
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
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_school">회사연혁</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_license">협력업체 및 기관</a>
			<a class="list-group-item list-group-item-action" data-toggle="list" href="#free_portf">포트폴리오</a>
		</div>
	</div>
	<!-- 사이드 메뉴 끝 -->
		
	<div class="col-md-9">
	<div class="tab-content">
<%-- 	<button type="button" class="btn btn-dark" style="position: absolute; right:54px; top:25px;" onclick = "location.href = '/myProfile/modify?free_no=${sessionScope.free_no}'">수정하기</button> --%>
	
	
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
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">
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
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px; ">
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

		<!-- 회사연혁 탭 시작 -->
		<div class="tab-pane fade" id="free_school"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">회사연혁</h4>
			</div>	
			<div class="mx-4 my-3">
			<div class="gap">	
				<h5>회사연혁</h5>
				<div class="content" style="margin-bottom: 367px;">
					<c:forEach items="${myComp }" var="myComp">
					<c:if test="${empty myComp.hDetails }">
						<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
						<span style="padding-left: 20px; font-size: 22px;" >등록된 회사연혁이 없습니다.</span><br>
						</div>
					</c:if>
					<c:if test="${not empty myComp.hDetails }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">	
						<span style="padding-left: 20px;font-size: 18px; font-weight: bold;">${myComp.yearmonth } | ${myComp.hDetails }</span>	
					</div>
					</c:if>
				</c:forEach>
				</div>
			</div>	
			</div>	
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 회사연혁 탭 끝 -->					

		<!-- 협력업체 및 기관 탭 시작 -->
		<div class="tab-pane fade" id="free_license"  >
		<!-- card body 시작 -->
		<div class="card-body border-start" >
			<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
				<h4 class="font-weight-bold mx-4 my-3">협력업체 및 기관</h4>
			</div>
			<div class="mx-4 my-3">
			<div class="gap">	
				<h5>협력업체 및 기관</h5>
				<div class="content" style="margin-bottom: 367px;">
				<c:forEach items="${myPartn }" var="myPartn">
					<c:if test="${empty myPartn.partners_nm }">
						<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; ">
						<span style="padding-left: 20px; font-size: 22px;" >등록된 협력업체 및 기관이 없습니다.</span><br>
						</div>
					</c:if>
					<c:if test="${not empty myPartn.partners_nm }">
					<div class="border border-1 rounded-3 p-2" role="group" style="width: 700px; margin-bottom: 20px;">	
						<span style="padding-left: 20px;font-size: 18px; font-weight: bold;">${myPartn.partners_nm } | ${myPartn.pDetails }</span>	
					</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
			</div>		
		</div>
		<!-- card body 끝 -->
		</div>
		<!-- 협력업체 및 기관 탭 끝 -->
		
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
		
		<c:if test="${sessionScope.identB == 1}">
		<button type="button" class="btn btn-dark" style="position: absolute; right:54px; top:25px;" onclick = "location.href = '/myProfile/modifyB?free_no=${sessionScope.free_no}'">수정하기</button>		
		</c:if>
		<c:if test="${sessionScope.identB == 0}">
		<button type="button" class="btn btn-dark" style="position: absolute; right:54px; top:15px;" onclick = "location.href = '/member/mypage'">신원인증</button>
		<div style="position: absolute; right:54px; top:57px; font-size: 12px;">
		신원인증이 필요합니다.
		</div>		
		</c:if>
		
		
	
	</div>
	</div>
</div>
</div>
</div>

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
	
</body>
</html>