<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/interestFreelancer.jsp</h1> <hr>
	
<section>	
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>관심 프리랜서 관리</h1>
				북마크한 프리랜서를 관리할 수 있습니다.	
			</div>
		</div>
	</div>	
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<select class="pull-right">
			 		<option>기본 정렬 순</option>
				 	<option>포트폴리오 많은 순</option>
				 	<option>최근 업데이트 순</option>	
				</select>
			 	<c:forEach var="free" items="${interestFreelancerList}">
			 		<hr>
			 		<!-- div에서 onclick으로 프리랜서 상세페이지로 이동 -->
					<div style=" background-color: white; padding:10px; width: 900px; height: auto; cursor: pointer;" onclick="#">
						[프로필사진]
						<b>${free.name }</b>
						분야 <b>${free.work_field }</b> | [레벨] <b>${free.job_level }</b><br>
						경력 <b>${free.yeoncha }</b> 년차 |
						학력 <b>${free.school_type }</b> | 
						지역 <b>${free.region } ${free.district }</b>	
						<table class="text-center pull-right">
							<tr>
								<th>근무경력</th>
								<th>포트폴리오</th>
							</tr>
							<tr>
								<td>${free.career_count }</td>
								<td>${free.portfolio_count }</td>
							</tr>
						</table><br>				
					<!-- 스킬 버튼 생성 test -->
							<c:set var="skillList" value="${free.skills }" />
								<c:forEach items="${fn:split(skillList, ',')}" var="skill">
								    <button type="button" class="btn btn-warning" ><c:out value="${skill}" /></button>
								</c:forEach><br>	
						<span class="pull-right">[한줄소개] ${free.oneline_bio }</span> 
					</div>
				</c:forEach>
			</div>
		</div>
	</div>			
</section>

<%@ include file="../include/footer.jsp" %>
	
	