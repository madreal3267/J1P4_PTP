<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/ctHeader.jsp"%>
<style>
#linkG {color: black; text-decoration: none; font-weight: bolder;}
#linkG:hover {
	color: #31b9a9;
}
</style>
<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
	<div class="card overflow-hidden card-2" >
		<div class="row no-gutters row-bordered row-border-light">
		    		    <!-- 사이드 메뉴 시작 -->
			<div class="col-md-3 pt-0" >
				<div class="list-group list-group-flush account-settings-links" style="width:274px;">
					<h4 class="font-weight-bold py-1 mx-4 my-3">내 프로젝트 관리</h4>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/interestFreelancer">관심 프리랜서</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/proposeFreelancer">제안한 프리랜서</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/underReviewProject">검수중</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/temSaveProject">임시저장</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/regFailedProject">등록실패</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/recruitingProject">지원자 모집중 </a>
					<a class="list-group-item list-group-item-action"
					href="/J1P4_PTP/myProManageCt/ctContractProject">계약 진행중</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/ctOngoingProject">프로젝트 진행중</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/waitEvaluationFreelancer">평가대기중</a>
					<a class="list-group-item list-group-item-action" 
					href="/J1P4_PTP/myProManageCt/completedFreelancer">완료한 프로젝트</a>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show"  >
							<!-- card body 시작 -->
							<div class="card-body border-start" >
								<div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
									<h4 class="font-weight-bold mx-4 my-3">제안한 프리랜서</h4>
									프로젝트 진행상태를 확인할 수 있습니다.
								</div><br>	
									1. 관심 프로젝트로 추가한 프로젝트 목록입니다. <br> 
									2. [프로젝트 지원하기]버튼을 클릭하여 해당 프로젝트에 지원할 수 있습니다. <br>
								<br>
			                <table class="table table-bordered table-striped bg-light" border="1">
			                    <tr>
			                        <th>프로젝트 이름</th>
			                        <th>프리랜서 이름</th>
			                        <th>기술</th>
			                        <th>경력</th>
			                        <th>지원 여부 확인</th>
			                    </tr>
			                    <c:set var="prevProjectName" value="" />
			                    <c:set var="rowCount" value="0" />
			                    <c:forEach var="proFreeDTO" items="${proposeFreelancerList}" varStatus="status">
			                        <c:choose>
			                            <c:when test="${prevProjectName != proFreeDTO.proj_title}">
			                                <!-- 이전 프로젝트 이름과 현재 프로젝트 이름이 다른 경우 -->
			                                <c:if test="${status.index > 0}">
			                                    <!-- 이전 프로젝트의 행 끝 -->
			                                    
			                                    <c:set var="rowCount" value="0" />
			                                </c:if>
			                                <tr>
			                                    <td rowspan="1" id="proj${status.index}"><a id="linkG" href="/J1P4_PTP/board/detailList?proj_no=${proFreeDTO.proj_no }">${proFreeDTO.proj_title}</a></td>
			                                    <td><a id="linkG" href="/J1P4_PTP/board/detailListFreeC?free_no=${proFreeDTO.free_no }">${proFreeDTO.name}</a></td>
			                                    <td>${proFreeDTO.skills}</td>
			                                    <td>${proFreeDTO.yeoncha}</td>
			                                    <td><b>${proFreeDTO.apply_YN}</b></td>
			                                </tr>
			                                <c:set var="prevProjectName" value="${proFreeDTO.proj_title}" />
			                                <c:set var="rowCount" value="1" />
			                            </c:when>
			                            <c:otherwise>
			                                <tr>
			                                    <td><a id="linkG" href="#">${proFreeDTO.name}</a></td>
			                                    <td>${proFreeDTO.skills}</td>
			                                    <td>${proFreeDTO.yeoncha}</td>
			                                    <td><b>${proFreeDTO.apply_YN}</b></td>
			                                </tr>
			                                <c:set var="rowCount" value="${rowCount + 1}" />
			                                <script>
			                                    document.getElementById("proj${status.index - 1}").rowSpan = ${rowCount};
			                                </script>
			                            </c:otherwise>
			                        </c:choose>
			                        <c:if test="${status.last}">
			                            <!-- 마지막 항목인 경우 -->
			                            <script>
			                                document.getElementById("proj${status.index}").rowSpan = ${rowCount};
			                            </script>
			                        </c:if>
			                    </c:forEach>
			                </table>
					        </div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>

