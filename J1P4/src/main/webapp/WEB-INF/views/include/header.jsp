<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js' integrity='sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==' crossorigin='anonymous'></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>프투프 PTP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/star.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/enrollProj.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/listPro.css" rel="stylesheet" />
<!-- 별 css -->
<link href="${pageContext.request.contextPath}/resources/star.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 별 css -->
</head>
<body style="padding-top: 75px;">

<!-- =============================== 비회원 헤더 =============================== -->

<header class="mb-3 border-bottom" style="background-color:#fff; position: fixed; top: 0; left: 0; right: 0; z-index: 999;">
    <div class="container p-3" style="width: 1100px;">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/J1P4_PTP/main/home" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
         <img src="${pageContext.request.contextPath}/resources/ptp_logo.png" alt="logo" height="50" class="nav-r1"/>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" >
          <li><a href="/J1P4_PTP/board/listPro" class="nav-link px-3 link-body-emphasis nav-r1">프로젝트 찾기</a></li>
          <li><a href="/J1P4_PTP/board/listFree" class="nav-link px-3 link-body-emphasis nav-r1">프리랜서 찾기</a></li>
          <li><a href="/J1P4_PTP/member/guide" class="nav-link px-3 link-body-emphasis nav-r1">이용방법</a></li>
          <li><a href="/J1P4_PTP/member/login" class="nav-link px-2 link-body-emphasis nav-r4">로그인</a></li>
          <li><a href="/J1P4_PTP/member/insert" class="nav-link px-2 link-body-emphasis nav-r4">회원가입</a></li>
        </ul>
        
      </div>
    </div>
  </header>

