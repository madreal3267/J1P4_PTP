<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/headerMPM_F.jsp"%>

<h1>/myProManage/proposedProject.jsp</h1>
<hr>

<section class="content">
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>제안받은 프로젝트</h1>
				클라이언트에게 지원을 제안받은 프로젝트를 확인할 수 있습니다.
			</div>
		</div>
	</div>

	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<section>
					<div>
						1. 클라이언트에게 제안받은 프로젝트 목록입니다. <br> 
						2. 지원 완료한 프로젝트의 경우, 목록에서 지원 내역으로 이동합니다. <br> 
						3. 지원자 모집이 마감되면, 목록에서 자동으로 삭제됩니다. <br> 
						4. 프로젝트 내용을 충분히 검토 후, 실제 진행 가능한 프로젝트에 지원하세요. <br>
					</div>
					<select class="pull-right">
						<option selected>기본 정렬 순</option>
						<option>금액 높은순</option>
						<option>지원 적은 순</option>
						<option>최신 등록 순</option>
						<option>마감 임박 순</option>
					</select>
					<c:forEach var="projDTO" items="${proposedProjectList}">
						<div>
							<h2>${projDTO.proj_title }</h2>
							예상 금액 ${projDTO.proj_cost } | 예상 기간 ${ProjectDTO.work_period } <br> 
							${projDTO.work_field } | ${projDTO.region } ${projDTO.district } | 
						<!-- 스킬 나열 -->
							<c:set var="skillList" value="${projDTO.skill_nm }" />
							<c:forEach items="${fn:split(skillList, ',')}" var="skill">
								<button type="button" class="btn btn-warning">
									<c:out value="${skill}" />
								</button>
							</c:forEach>
							
						<!-- 하트위치 -->
						<!-- 지원하기 -->
							<form action="/projectDetail/applyProj" method="get">
								<input type="hidden" name="free_no" value="${projDTO.free_no }"> 
								<input type="hidden" name="proj_no" value="${projDTO.proj_no }">
								<input type="submit" value="지원하기">
							</form>
							등록일자 <fmt:formatDate value="${projDTO.reg_date }" pattern="yyyy-mm-dd" />
						</div>
					</c:forEach>
				</section>
			</div>
		</div>
	</div>
</section>


<%@ include file="../include/footer.jsp"%>