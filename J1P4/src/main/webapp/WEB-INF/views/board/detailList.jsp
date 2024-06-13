<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detailList</title>
</head>
<body>



<div style="width: 60%; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
<h1>{proj_title}</h1>
			<div style="display: flex; justify-content: end;">
				<div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div>
				<div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
			</div>
	<br>

	<div style="width: 95%; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
		<!-- 모집중, NEW!, 하트 영역 -->

		<!-- 제목 -->
		<div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
			${v.proj_title }</div>

		<!-- 예상 금액/ 예상 기간 -->
		<div style="margin-bottom: 6px;">
			예상금액 <span style="font-weight: bold;">${v.proj_cost }원</span> | 예상
			기간 <span style="font-weight: bold;">${v.deadline }일</span>
		</div>

		<!-- 기타 정보 / 등록일자 -->
		<div style="display: grid; grid-template-columns: 1fr 1fr;">
			<div style="display: flex; font-weight: bold;">
				<span style="display: flex; align-items: center;">${v.work_field }
					| 서울시 강남구 |</span>
				<div
					style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
					JAVA</div>
				<div
					style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
					MySql</div>
			</div>

			<div style="display: flex; justify-content: end;">
				<span style="font-size: 14px; color: #444">${v.reg_date }</span>
			</div>
		</div>
	</div>
	<hr>
사전 미팅 방식 {pmeet_meth} <br>
프로젝트 진행 중 {meet_cycle} <br>
클라이언트 위치-지역테이블-{region}/{district} <br>
프로젝트 상세 내용 <br>
{proj_content} <br>
<br>
주요기술스택 <br>
구인 등급 <br>
희망 경력 <br>
경력 증빙 자료 <br>
전달 사항 또는 우대 사항 <br>

<div id="box">
<div style="background-color: #dddddd; position:sticky; top:30%; right:200px; border: 1px solid #333;
 border-radius:10px 10px 10px 10px;
 width: 400px;
 height: 150px;
 position: fixed;"> <h2>클라이언트 평점</h2></div>
</div>

<div style="background-color: white; border: 1px solid #333;
 border-radius:10px 10px 10px 10px;
 width: 80%;
 height: 150px;
 position: fixed;
 left: 50px; bottom: 50px;">
 n 명이 지원했습니다
		<div style="display: flex; justify-content: end;">
		<div style="background-color: #dddddd; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">지원하기</div>
		<div style="background-color: #dddddd; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">북마크</div>
	</div>
</div>




</div>
</body>
</html>