<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<link href="../resources/css/main.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>프투프 PTP</title>
</head>
<body>

<header class="p-3 mb-3 border-bottom" style="height: 110%;">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
         <img src="../resources/ptp_logo.png" alt="logo" height="50" class="nav-r1"/>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
<!--      <li><a href="#" class="nav-link px-2 link-secondary nav-r">프로젝트 찾기</a></li> -->
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">프로젝트 찾기</a></li>
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">프리랜서 찾기</a></li>
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">프로젝트 등록</a></li>
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">이용방법</a></li>
          <li><a href="#" class="nav-link px-2 link-body-emphasis nav-r4">내 프로필</a></li>
          <li><a href="#" class="nav-link px-2 link-body-emphasis nav-r4">내 프로젝트 등록</a></li>
        </ul>

        <div class="dropdown text-end pro-l">
          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="../resources/증명1.jpg" alt="profile" width="40" height="40" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" style="">
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
            <li><a class="dropdown-item" href="#">계정설정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>
  
<h1>대한민국 NO.1
IT 프리랜서 매칭 플랫폼</h1>

<h2><p>강력한 어쩌고로 가장 정확하게, 쉽고 빠르게
프로젝트 매칭을 경험하세요!</p></h2>
  
  <button class="btn rounded-3 px-3" id="b1" type="button" style="background-color: #F76A22; color: #fff">무료로 프로젝트 등록</button>
  <button class="btn btn-outline-dark rounded-3" id="b2" type="button" >회원가입</button>
  
  <div id="text">100,000+ 기업이 믿고 사용 중인 국내 1위 IT 프로젝트 플랫폼</div>
  
  <div id="slider">
   <div class="image-box">
    <div><img class="" src="../resources/대기업 로고 모음/네이버.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/농협.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/넥슨.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/롯데.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/카카오.jpg" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/삼성.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/한화.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/SM.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/두산.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/금호아시아나.png" alt="" width="340"></div> 
    <!-- clone -->     
    <div><img class="" src="../resources/대기업 로고 모음/네이버.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/농협.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/넥슨.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/롯데.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/카카오.jpg" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/삼성.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/한화.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/SM.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/두산.png" alt="" width="340"></div>        
    <div><img class="" src="../resources/대기업 로고 모음/금호아시아나.png" alt="" width="340"></div> 
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