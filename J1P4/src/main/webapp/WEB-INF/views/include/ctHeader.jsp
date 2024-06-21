<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>프투프 PTP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="../resources/css/ctHeader.css" rel="stylesheet" />
<link href="../resources/css/main.css" rel="stylesheet" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body style="padding-top: 75px;">

<!-- =============================== 클라이언트 헤더 =============================== -->
<%-- <c:if test="${user_id eq '' and ct_no not empty}"> --%>
<header class="mb-3 border-bottom" style="background-color:#fff; position: fixed; top: 0; left: 0; right: 0; z-index: 999;">
    <div class="container p-3" style="width: 1100px;">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/main/home" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
         <img src="../resources/ptp_logo.png" alt="logo" height="50" class="nav-r1"/>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" >
<!--      <li><a href="#" class="nav-link px-2 link-secondary nav-r">프로젝트 찾기</a></li> -->
          <li><a href="/board/listPro" class="nav-link px-3 link-body-emphasis nav-r1">프로젝트 찾기</a></li>
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">프리랜서 찾기</a></li>
          <li><a href="/enroll/enrollProj" class="nav-link px-3 link-body-emphasis nav-r1">프로젝트 등록</a></li>
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">이용방법</a></li>
          <li><a href="/myProManage/interestProject" class="nav-link px-2 link-body-emphasis nav-r4">내 프로젝트 관리</a></li>
        </ul>

        <div class="dropdown text-end pro-l" >
		  <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="../resources/스마일감자.jpg" alt="profile" width="45" height="45" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
            <li><a class="dropdown-item" href="#">계정설정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>
<%-- </c:if> --%>
