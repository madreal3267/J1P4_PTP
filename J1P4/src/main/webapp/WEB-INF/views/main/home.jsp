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

<c:if test="${not empty sessionScope.user_id && empty sessionScope.user_cf}">
<meta http-equiv='refresh' content='0;url=../member/mailsend'>
</c:if>

<div style="position: relative;">
	<div class="my-3 py-3" >
	<h1 id="mainText">대한민국 NO.1 <br>
		IT 프리랜서 매칭 플랫폼</h1>
	</div>
	
	<div style="padding-bottom: 150px;">
		<h4 id="subText">강력한 어쩌고로 가장 정확하게, 쉽고 빠르게<br>
		프로젝트 매칭을 경험하세요!</h4>
	</div>
	
	<div id="mainImg">
	<img src="../resources/main.png" style="width:500px;" alt="mainImg"/>
	</div>
	
	<!-- ============== 비회원 메인 메뉴 ================= -->
	<c:if test="${empty sessionScope.user_id }">
	<div class="mainButt">
		<button class="rounded-3 p-3 butt1" type="button" onclick = "location.href = '/member/insert'">회원가입</button>
		<button class="rounded-3 p-3 butt2" type="button" >이용방법</button>
	</div>
	</c:if>
	
	<!-- ============== 프리랜서 메인 메뉴 ================= -->
	<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('프리랜서') }">
	<div class="mainButt">
		<button class="rounded-3 p-3 butt1" type="button" onclick = "location.href = '/board/listPro'">프로젝트 찾기</button>
		<button class="rounded-3 p-3 butt2" type="button" >이용방법</button>
	</div>
	</c:if>
	
	<!-- ============== 클라이언트 메인 메뉴 ================= -->
	<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('클라이언트') }">
	<div class="mainButt" >
		<button class="rounded-3 p-3 butt1" type="button" >프리랜서 찾기</button>
		<button class="rounded-3 p-3 butt2" type="button" >이용방법</button>
	</div>
	</c:if>
	  
	<div class="border-top border-bottom my-5 py-5" id="mainCount">
		<div class ="siteCount border-end px-5">총 프리랜서 수<br>
			<p>102,192,371명</p>
		</div>
		<div class ="siteCount border-end px-5">총 프로젝트 금액<br>
			<p>921,281,102,192,371원</p>
		</div>
		<div class ="siteCount border-end px-5">총 프로젝트 수<br>
			<p>592,371개</p>
		</div>
		<div class ="siteCount px-5">재의뢰율<br>
			<p>101%</p>
		</div>
	</div>
</div>

<div style="position: relative; padding-top:80px;">
	<h3 id="mainProjMenu">프로젝트 둘러보기</h3>
	<div style="text-align: center;">
		<button class="rounded-3 p-3 m-1 butt3" type="button" onclick = "location.href = '/board/listProP?pageNum=1&amount=6&sn=reg_date&work_field=개발'"><b>⚙️ 개발</b></button>
		<button class="rounded-3 p-3 m-1 butt3" type="button" onclick = "location.href = '/board/listProP?pageNum=1&amount=6&sn=reg_date&work_field=기획'"><b>🛠️ 기획</b></button>
		<button class="rounded-3 p-3 m-1 butt3" type="button" onclick = "location.href = '/board/listProP?pageNum=1&amount=6&sn=reg_date&work_field=디자인'"><b>🎨 디자인</b></button>
		<button class="rounded-3 p-3 m-1 butt3" type="button" onclick = "location.href = '/board/listProP?pageNum=1&amount=6&sn=reg_date&work_field=퍼블리싱'"><b>🖋️ 퍼블리싱</b></button>
	</div>
</div>

<div id="logoText">
100,000+ 기업이 믿고 사용 중인 국내 1위 IT 프로젝트 플랫폼</div>
  
<div class="slider my-3">
	<div class="image-box">
	    <div><img class="logo" src="../resources/logo/logo_1.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_2.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_3.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_4.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_5.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_6.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_7.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_8.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_9.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_10.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_11.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_12.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_13.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_14.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_15.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_16.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_17.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_18.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_19.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_20.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_21.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_22.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_23.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_24.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_25.svg" alt=""></div>         
	    <!-- clone -->     
	    <div><img class="logo" src="../resources/logo/logo_1.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_2.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_3.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_4.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_5.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_6.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_7.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_8.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_9.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_10.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_11.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_12.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_13.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_14.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_15.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_16.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_17.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_18.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_19.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_20.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_21.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_22.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_23.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_24.svg" alt=""></div>        
	    <div><img class="logo" src="../resources/logo/logo_25.svg" alt=""></div>                
	</div>
</div>

<%@ include file="../include/footer.jsp" %>