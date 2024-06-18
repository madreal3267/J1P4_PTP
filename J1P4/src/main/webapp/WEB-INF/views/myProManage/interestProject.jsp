<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/header.jsp" %>

<section class="content"> 
	<h1>/myProManage/interestProject.jsp</h1> <hr>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>관심 프로젝트</h1>
			관심 프로젝트로 추가한 프로젝트를 확인할 수 있습니다.				
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<div>
					1. 관심 프로젝트로 추가한 프로젝트 목록입니다. <br> 
					2. [프로젝트 지원하기]버튼을 클릭하여 해당 프로젝트에 지원할 수 있습니다. <br>
				</div>
				<select>
					<option>정렬방식</option>
					<option></option>
					<option selected>정렬방식</option>
					<option>기본 정렬 순</option>
					<option>금액 높은순</option>
					<option>지원 적은 순</option>
					<option>최신 등록 순</option>
					<option>마감 임박 순</option>
				</select>

				<c:forEach var="projDTO" items="${interestProjectList}">
					<div>                         
						<hr>
						<c:choose>
                			<c:when test="${projDTO.proj_status == '계약'}">
                   				 <span class="badge btn-warning">모집중</span>
               				 </c:when>
                			<c:otherwise>
                    			<span class="badge btn-primary">모집종료</span>
               				 </c:otherwise>
           				 </c:choose>
						<h2>${projDTO.proj_title }</h2>
						예상 금액 ${projDTO.proj_cost } 만원  |  예상 기간 ${projDTO.work_period } 개월<br> 
						${projDTO.work_field }  |  ${projDTO.region } ${projDTO.district }  |
						
			<!-- 스킬 버튼 생성 test -->
					<c:set var="skillList" value="${projDTO.skill_nm }" />
						<c:forEach items="${fn:split(skillList, ',')}" var="skill">
						    <button type="button" class="btn btn-warning" ><c:out value="${skill}" /></button>
						</c:forEach><br>				
			<!-- 스킬 버튼 생성 test -->
			

			
						
			<!-- 프로젝트 지원하기  -->
						<form action="/myProManage/interestProject" method="post">
							<input type="hidden" name="free_no" value="${projDTO.free_no }">
							<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
							<input type="submit" value="지원하기"> 
						</form>
						등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-mm-dd"/>
					</div>

				</c:forEach>
				<!-- 외형만 복사. 작동원리 탐구 필요. -->
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
	<ul class="pagination">
		<li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
		<li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
		<li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
	</ul>
</div>
				
			</section>
		</div>
	</div>
</div>
</section>




<%@ include file="../include/footer.jsp" %>
	
	