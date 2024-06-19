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
<link href="../resources/css/header.css" rel="stylesheet" />
<link href="../resources/css/main.css" rel="stylesheet" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.ui-w-80 {
    width: 80px !important;
    height: auto;
}

.btn-default {
    border-color: rgba(24,28,33,0.1);
    background: rgba(0,0,0,0);
    color: #4E5155;
}

label.btn {
    margin-bottom: 0;
}

.btn-outline-primary {
    border-color: #26B4FF;
    background: transparent;
    color: #26B4FF;
}

.btn {
    cursor: pointer;
}

.text-light {
    color: #babbbc !important;
}

.btn-facebook {
    border-color: rgba(0,0,0,0);
    background: #3B5998;
    color: #fff;
}

.btn-instagram {
    border-color: rgba(0,0,0,0);
    background: #000;
    color: #fff;
}

.card {
    background-clip: padding-box;
    box-shadow: 0 1px 4px rgba(24,28,33,0.012);
}

.row-bordered {
    overflow: hidden;
}

.account-settings-fileinput {
    position: absolute;
    visibility: hidden;
    width: 1px;
    height: 1px;
    opacity: 0;
}
.account-settings-links .list-group-item.active {
    font-weight: bold !important;
}
html:not(.dark-style) .account-settings-links .list-group-item.active {
    background: transparent !important;
}
.account-settings-multiselect ~ .select2-container {
    width: 100% !important;
}
.light-style .account-settings-links .list-group-item {
    padding: 0.85rem 1.5rem;
    border-color: rgba(24, 28, 33, 0.03) !important;
}
.light-style .account-settings-links .list-group-item.active {
    color: #4e5155 !important;
}
.material-style .account-settings-links .list-group-item {
    padding: 0.85rem 1.5rem;
    border-color: rgba(24, 28, 33, 0.03) !important;
}
.material-style .account-settings-links .list-group-item.active {
    color: #4e5155 !important;
}
.dark-style .account-settings-links .list-group-item {
    padding: 0.85rem 1.5rem;
    border-color: rgba(255, 255, 255, 0.03) !important;
}
.dark-style .account-settings-links .list-group-item.active {
    color: #fff !important;
}
.light-style .account-settings-links .list-group-item.active {
    color: #4E5155 !important;
}
.light-style .account-settings-links .list-group-item {
    padding: 0.85rem 1.5rem;
    border-color: rgba(24,28,33,0.03) !important;
}
 
h1 {
 font-weight: bolder !important;
 white-space: pre;
 text-align: center;
 }
 
h2>p {
 white-space: pre;
 text-align: center;
 color: #808080;
 }

#slider {
	overflow: hidden;
	position: relative;
	width: 1440px;
	height: 65px;
	box-sizing: border-box;
	margin: auto;
}
.image-box {
	width: 12000px;
	height:100%;
	display: flex;
	flex-wrap: nowrap;
	animation: bannermove 100s linear infinite;

}
.image_box>div {
	margin: 0px -1px 0px 0px;
}

@keyframes bannermove {
	0% {
		transform:translate(0,0);
	}
	100% {
		transform:translate(-50%,0);
	}
}

#text{
	text-align: center;
	font-size: large;
	font-weight: bolder;
}

button {
	position: relative; left: 120px;
}

#b1 {
	padding: 15px 40px !important;
	margin-right: 10px;
	
}

#b2 {
	padding: 15px 35px !important;
	margin: auto;
}

.logo{
	margin-right: 70px;
}

body{
    background: #f0f5f5;
    margin-top:20px;
    font-family: "Nanum Gothic", sans-serif !important;
}

</style>
</head>
<body style="padding-top: 75px;">

<!-- =============================== 비회원 헤더 =============================== -->

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
          <li><a href="#" class="nav-link px-3 link-body-emphasis nav-r1">이용방법</a></li>
          <li><a href="#" class="nav-link px-2 link-body-emphasis nav-r4">로그인</a></li>
          <li><a href="/myProManage/interestProject" class="nav-link px-2 link-body-emphasis nav-r4">회원가입</a></li>
        </ul>
        
      </div>
    </div>
  </header>
  
  
