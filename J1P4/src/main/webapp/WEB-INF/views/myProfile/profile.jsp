<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="../resources/css/enrollFree.css" rel="stylesheet" />
<!-- select2 (검색되는 select) CSS -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>내 프로필</title>
</head>
<body>
	<h1>내 프로필 - 개인/팀 (/myProfile/profile.jsp)</h1>
	<hr>
	
	<h2>업무조건</h2>
		<h4>업무 가능 분야</h4>
		${myProfile.work_field }
		<div>
		<br>
		<h4>업무 상태</h4>
		<b>업무 가능 여부</b>
		<c:if test="${myProfile.work_check=='1'}">
		가넝한
		</c:if>
		<c:if test="${myProfile.work_check=='0'}">
		불가넝한
		</c:if>

		<br>
		<b>업무시작 가능일</b>
		${myProfile.work_date}
		</div>
		<br>
		<div>
		<h4>희망 조건</h4>
		<b>희망 프로젝트 대금</b>
		${myProfile.proj_cost }원<br>
		<b>희망 지역</b>
		${myReg.region } ${myReg.district }
		</div>
	
	<hr>
	<h2>소개정보</h2>		
	<b>한줄 소개</b><br>
		${myProfile.oneline_bio}<br>
	<b>자기 소개서</b><br>
		${myProfile.bio}
		
	<hr>
	<h2>보유기술</h2>		
	<b>보유 중인 기술</b><br>
	<c:forEach items="${mySkill }" var="mySkill">
		${mySkill.skill_nm } - ${mySkill.skill_lev } <br>
	</c:forEach>
	
	<hr>
	<h2>경력</h2>		
	<b>전문성</b><br>
	${myCareer[0].job_lev }
	<br>
	<b>경력</b><br>
<%-- 	${myCareer } --%>
	<c:forEach items="${myCareer }" var="myCareer">
		회사명 : ${myCareer.company_nm }<br>
		입사연월 : ${myCareer.join_date }<br>
		퇴사연월 : ${myCareer.quit_date }<br>
		담당업무 : ${myCareer.responsibility }<hr>
	</c:forEach>

	<hr>
	<h2>학력</h2>		
	<b>최종학력</b><br>
	학력 : ${myProfile.school_type} <br>
	학교명 : ${myProfile.school_nm} <br>
	전공명 : ${myProfile.major} <br>
	재학기간 : ${myProfile.entrance} ~ ${myProfile.graduation} <br>
	졸업상태 : ${myProfile.grad_status}

	<hr>
	<h2>자격증</h2>		
	<b>자격증</b><br>
	<c:forEach items="${myLicense }" var="myLicense">
		자격증명 : ${myLicense.license_nm }<br>
		취득일 : ${myLicense.qualify_date }<br>
		발급기관 : ${myLicense.issuer }<hr>
	</c:forEach>

	<button type="button" onclick = "location.href = '/myProfile/modify?free_no=${sessionScope.free_no}'">수정하기</button>
	
<!-- 자바스크립트 시작 -->	
<script type="text/javascript">
		
</script>
<!-- 자바스크립트 끝 -->

<!-- select2 (검색되는 select) 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- 부트스트랩 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>