<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detailList</title>
</head>
<body>



<div style="width: 60%; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
<h1>${projectVO.proj_title}</h1>
			<div style="display: flex; justify-content: end;">
				<div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div>
				<div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
			</div>
	<br>

	<div style="width: 95%; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
		<!-- 모집중, NEW!, 하트 영역 -->

		<!-- 제목 -->
		<div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
			${projectVO.proj_title }</div>

		<!-- 예상 금액/ 예상 기간 -->
		<div style="margin-bottom: 6px;">
			예상금액 <span style="font-weight: bold;">${projectVO.proj_cost }원</span> | 모집 마감일
			<span style="font-weight: bold;">${projectVO.deadline }일</span>
		</div>

		<!-- 기타 정보 / 등록일자 -->
		<div style="display: grid; grid-template-columns: 1fr 1fr;">
			<div style="display: flex; font-weight: bold;">
				<span style="display: flex; align-items: center;">${projectVO.work_field }
					| ${projectVO.region} ${projectVO.district} |</span>
				<!-- <div
					style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
					JAVA</div>
				<div
					style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
					MySql</div> -->
				<c:set var="skillList" value="${projectVO.skill_nm }" />
                  <c:forEach items="${fn:split(skillList, ',')}" var="skill">
                      <button type="button" class="btn btn-warning" ><c:out value="${skill}" /></button>
                  </c:forEach>
                  <br>
			</div>

			<div style="display: flex; justify-content: end;">
				<span style="font-size: 14px; color: #444">${projectVO.reg_date }</span>
			</div>
		</div>
	</div>
	<hr>
사전 미팅 방식 ${projectVO.pmeet_meth} <br>
프로젝트 진행 중 ${projectVO.meet_cycle} <br>
클라이언트 위치-${projectVO.region} ${projectVO.district} <br>
프로젝트 상세 내용 <br>
${projectVO.proj_content} <br>
<br>
주요기술스택 ${projectVO.skill_nm}  <br>
구인 등급 ${projectVO.job_level}  <br>
희망 경력 ${projectVO.wanted_career} <br>
경력 증빙 자료 ${projectVO.career_proof} <br>
전달 사항 또는 우대 사항 ${projectVO.dlvy_msg} <br>

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
<h1>프로젝트 문의</h1>
</body>
</html>