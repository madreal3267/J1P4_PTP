<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
								<h4 class="font-weight-bold mx-4 my-3">지원자 모집중</h4>
								지원자를 모집 중인 프로젝트를 관리할 수 있습니다.
							</div><br>	
						    <table class="table table-bordered table-striped bg-light" border="1">
						        <tr>
						            <th>모집 중인 프로젝트</th>
						            <th>지원한 프리랜서</th>
						            <th>기술</th>
						            <th>연차</th>
						            <th>지원 거절/계약하기</th>
						            <th>모집완료</th>
						        </tr>
						        <c:set var="prevProjectName" value="" />
						        <c:set var="rowCount" value="0" />
						        <c:forEach var="proFreeDTO" items="${recruitingProjectList}" varStatus="status">
						            <c:choose>
						                <c:when test="${prevProjectName != proFreeDTO.proj_title}">
						                    <!-- 이전 프로젝트 이름과 현재 프로젝트 이름이 다른 경우 -->
						                    <c:if test="${status.index > 0}">
						                        <!-- 이전 프로젝트의 행 끝 -->
						                      <%--   <c:out value="${rowCount}" /> --%>
						                        <c:set var="rowCount" value="0" />
						                    </c:if>
						                    <tr>
						                        <td rowspan="${rowCount+1}" id="proj${status.index}">
						                        	<a id="linkG" href="/J1P4_PTP/board/detailList?proj_no=${proFreeDTO.proj_no }">${proFreeDTO.proj_title}</a>
						                        </td>
						                        <td><a id="linkG" href="/J1P4_PTP/board/detailListFreeC?free_no=${proFreeDTO.free_no }">${proFreeDTO.free_id}</a></td>
						                        <td>
						                        	<c:set var="skillList" value="${proFreeDTO.skills }" />
														<c:forEach items="${fn:split(skillList, ',')}" var="skill">
														    <span style="background-color: #31b9a9;" class="badge" ><c:out value="${skill}" /></span>
														</c:forEach><br>
												</td>
						                        <td>${proFreeDTO.yeoncha} </td>
						                        <td> 
						                        <form action="/J1P4_PTP/myProManageCt/rejectApply" method="post" style="display: inline-block;">
						                            <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
						                            <input type="hidden" name="free_no" value="${proFreeDTO.free_no}">
						                            <button style="background-color: #31b9a9; color: white;" type="submit" class="btn">지원 거절</button>
						                        </form>
											    <c:choose>
											        <c:when test="${proFreeDTO.meetingOK == 0}">
											            <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#modal-${proFreeDTO.free_no}">계약하기</button>
											        </c:when>
											        <c:otherwise>
											            <button class="btn btn-outline-dark">계약 동의</button>
											        </c:otherwise>
											    </c:choose>
						                        </td>
						                    <!-- 수정된 부분 시작: 모집완료 버튼을 합치기 위해 rowspan 추가 -->
						                    <td rowspan="${rowCount + 1}" id="complete${status.index}">
						                        <!-- <button type="submit" class="btn btn-danger">모집완료</button> -->
						                       <form action="/J1P4_PTP/myProManageCt/recruitmentCompleted" method="post">
						                     		<input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
						                       		<button type="submit" class="btn btn-dark">모집완료</button>
						                       </form>
						                    </td>
						                    <!-- 수정된 부분 끝 -->
						                    </tr>
						                    <c:set var="prevProjectName" value="${proFreeDTO.proj_title}" />
						                    <c:set var="rowCount" value="1" />
						                </c:when>
						                <c:otherwise>
						                    <tr>
						                        <td><a href="#">${proFreeDTO.free_id}</a></td>
						                        <td>
						                        	<c:set var="skillList" value="${proFreeDTO.skills }" />
														<c:forEach items="${fn:split(skillList, ',')}" var="skill">
														    <span style="background-color: #31b9a9;" class="badge"><c:out value="${skill}" /></span>
														</c:forEach><br>
												</td>
						                        <td>${proFreeDTO.yeoncha} </td>
						                        <td>
												 <form action="/J1P4_PTP/myProManageCt/rejectApply" method="post">
						                            <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
						                            <input type="hidden" name="free_no" value="${proFreeDTO.free_no}">
						                            <button style="background-color: #31b9a9; color: white;" type="submit" class="btn">지원 거절</button>
						                        </form>
											    <c:choose>
											        <c:when test="${proFreeDTO.meetingOK == 0}">
											            <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#modal-${proFreeDTO.free_no}">계약하기</button>
											        </c:when>
											        <c:otherwise>
											            <button class="btn btn-outline-dark">계약 동의</button>
											        </c:otherwise>
											    </c:choose>
						                        </td>
						                                         <!-- 수정된 부분 시작: 동일한 프로젝트일 때 모집완료 버튼 칸을 없애기 위해 rowspan 업데이트 -->
						                    <c:if test="${prevProjectName != proFreeDTO.proj_title}">
						                        <td rowspan="${rowCount + 1}" id="complete${status.index}">
						                            <!-- <button type="submit" class="btn btn-danger">모집완료</button> -->
						                            <form action="/J1P4_PTP/myProManageCt/recruitmentCompleted" method="post">
						                                <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
						                                <button type="submit" class="btn btn-dark">모집완료</button>
						                            </form>
						                        </td>
						                    </c:if>
						                    <!-- 수정된 부분 끝 -->   
						                    </tr>
						                    <c:set var="rowCount" value="${rowCount + 1}" />
						                    <script>
						                        document.getElementById("proj${status.index - 1}").rowSpan = ${rowCount+1};
						                        document.getElementById("complete${status.index - 1}").rowSpan = ${rowCount + 1};
						                    </script>
						                </c:otherwise>
						            </c:choose>
						            <c:if test="${status.last}">
						                <!-- 마지막 항목인 경우 -->
						                <script>
						                    document.getElementById("proj${status.index}").rowSpan = ${rowCount+1};
						                    document.getElementById("complete${status.index}").rowSpan = ${rowCount + 1};
						                </script>
						            </c:if>
						            
				<!-- modal 창 -->
				<form action="/J1P4_PTP/myProManageCt/offerContract" method="post">
					<div class="modal fade" id="modal-${proFreeDTO.free_no}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">계약을 위한 사전미팅을 제안합니다.</h4>
									<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<label for="date">미팅 날짜를 정해주세요</label><input type="date" id="date" name="meeting_dt">
									<label for="mp">미팅 장소와 내용에 대해 알려주세요</label><br>
									<textarea id="mp" name="meeting_pc" rows="6" cols="54" placeholder="미팅 장소와 내용에 대해 입력해주세요." required></textarea>
									<input type="hidden" name="proj_no" value="${proFreeDTO.proj_no }">
									<input type="hidden" name="free_no" value="${proFreeDTO.free_no }">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									<input type="submit" class="btn btn-dark" value="계약 제안">
								</div>
							</div>
						</div>
					</div>	
				</form>
				        		</c:forEach>
				    		</table>
				  		</div>
					</div>
				</div>  
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 지원 거절후 페이지 로딩시 모달창 생성
		var result = "${msg}";
		
		if(result == "rejectApply"){
			Swal.fire({
			  icon: "info",
			  title: "지원을 거절하였습니다.",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
		
		// 계약하기후 페이지 로딩시 모달창 생성
		if(result == "offerContract"){
			Swal.fire({
			  icon: "info",
			  title: "계약을 제안하였습니다.",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
		
		// 모집 완료 후 페이지 로딩시 모달창 생성
		if(result == "recruitmentCompleted"){
			Swal.fire({
			  icon: "info",
			  title: "모집을 완료하였습니다.",
			  showConfirmButton: true,
			  confirmButtonText: "확인"
			});
		}
			
	});
</script>	
<%@ include file="../include/footer.jsp" %>
