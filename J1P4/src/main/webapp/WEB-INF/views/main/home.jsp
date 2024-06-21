<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- ============== 비회원 헤더 ================= -->
<c:if test="${empty sessionScope.user_id }">
<c:import url="../include/header.jsp"></c:import>
</c:if>
<!-- ============== 프리랜서 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.user_cf.equals('프리랜서') }">
<c:import url="../include/freeHeader.jsp"></c:import>
</c:if>

<!-- ============== 클라이언트 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.user_cf.equals('클라이언트') }">
<c:import url="../include/ctHeader.jsp"></c:import>
</c:if>

<div class="my-3 py-3" style="position: static;">
<h1>대한민국 NO.0 (허언사이트)<br>
	IT 프리랜서 매칭 플랫폼</h1>
</div>

<div style="padding-bottom: 150px;">
	<h4>강력한 어쩌고로 가장 정확하게, 쉽고 빠르게<br>
	프로젝트 매칭을 경험하세요!</h4>
</div>

<div style="position: absolute; left:1000px; bottom:450px;">
<img src="../resources/main_side.svg" alt="mainImg"/>
</div>
<c:if test="${empty sessionScope.user_id }">
<div style= "width: 400px; position: absolute; bottom: 490px; left:415px;" >
	<button class="rounded-3 p-3 b1" type="button" onclick = "location.href = '/member/insert'">회원가입</button>
	<button class="rounded-3 p-3 b2" type="button" >이용방법</button>
</div>
</c:if>
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.user_cf.equals('프리랜서') }">
<div style= "width: 400px; position: absolute; bottom: 490px; left:415px;" >
	<button class="rounded-3 p-3 b1" type="button" onclick = "location.href = '/board/listPro'">프로젝트 찾기</button>
	<button class="rounded-3 p-3 b2" type="button" >이용방법</button>
</div>
</c:if>
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.user_cf.equals('클라이언트') }">
<div style= "width: 400px; position: absolute; bottom: 490px; left:415px;" >
	<button class="rounded-3 p-3 b1" type="button" >프리랜서 찾기</button>
	<button class="rounded-3 p-3 b2" type="button" >이용방법</button>
</div>
</c:if>
  
<div style="text-align: center; padding-top: 50px;" class="border-top border-bottom my-5 py-5" >
	<div class ="siteInfo border-end px-5">총 프리랜서 수<br>
		<p>102,192,371명</p>
	</div>
	<div class ="siteInfo border-end px-5">총 프로젝트 금액<br>
		<p>921,281,102,192,371원</p>
	</div>
	<div class ="siteInfo border-end px-5">총 프로젝트 수<br>
		<p>592,371개</p>
	</div>
	<div class ="siteInfo px-5">재의뢰율<br>
		<p>101%</p>
	</div>
</div>

<div class="my-5" >
<h3>프로젝트 둘러보기</h3>
</div>
<div style="padding-left: 415px;">
	<button class="rounded-3 p-3 m-1 b3" type="button"><b>⚙️ 개발</b></button>
	<button class="rounded-3 p-3 m-1 b3" type="button"><b>🛠️ 기획</b></button>
	<button class="rounded-3 p-3 m-1 b3" type="button"><b>🎨 디자인</b></button>
	<button class="rounded-3 p-3 m-1 b3" type="button"><b>🖋️ 퍼블리싱</b></button>
</div>

<div class="subject" style="margin-top: 100px; margin-bottom: 50px;">100,000+ 기업이 믿고 사용 중인 국내 1위 IT 프로젝트 플랫폼</div>
  
<div class="my-3 slider">
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