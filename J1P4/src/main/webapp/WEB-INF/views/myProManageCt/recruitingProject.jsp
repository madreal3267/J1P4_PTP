<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%@ include file="../include/headerCt.jsp"%>

<h1>/myProManageCt/recruitingProject.jsp</h1>

<section>
	<div class="col-md-12">
		<div class="box box-default">
			<div class="box-header with-border">
				<h1>지원자 모집중</h1>
				지원자를 모집 중인 프로젝트를 관리할 수 있습니다.
			</div>
		</div>
	</div>
</section>

<section>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
    <table class="table table-bordered bg-light" border="1">
        <tr>
            <td>모집 중인 프로젝트 </td>
            <td>지원한 프리랜서</td>
            <td>기술</td>
            <td>연차</td>
            <td>지원 거절/계약하기</td>
            <td>모집완료</td>
        </tr>
        <c:set var="prevProjectName" value="" />
        <c:set var="rowCount" value="0" />
        <c:forEach var="proFreeDTO" items="${recruitingProjectList}" varStatus="status">
            <c:choose>
                <c:when test="${prevProjectName != proFreeDTO.proj_title}">
                    <!-- 이전 프로젝트 이름과 현재 프로젝트 이름이 다른 경우 -->
                    <c:if test="${status.index > 0}">
                        <!-- 이전 프로젝트의 행 끝 -->
                        <c:out value="${rowCount}" />
                        <c:set var="rowCount" value="0" />
                    </c:if>
                    <tr>
                        <td rowspan="${rowCount+1}" id="proj${status.index}"><a href="#">${proFreeDTO.proj_title}</a></td>
                        <td><a href="#">${proFreeDTO.free_id}</a></td>
                        <td>
                        	<c:set var="skillList" value="${proFreeDTO.skill_nm }" />
								<c:forEach items="${fn:split(skillList, ',')}" var="skill">
								    <button type="button" class="btn btn-warning" ><c:out value="${skill}" /></button>
								</c:forEach><br>
						</td>
                        <td>${proFreeDTO.yeoncha} </td>
                        <td> 
                        <form action="/myProManageCt/rejectApply" method="post">
                            <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
                            <input type="hidden" name="free_no" value="${proFreeDTO.free_no}">
                            <button type="submit" class="btn btn-warning">지원 거절</button>
                        </form>
					    <c:choose>
					        <c:when test="${proFreeDTO.meetingOK == 0}">
					            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${proFreeDTO.free_no}">계약하기</button>
					        </c:when>
					        <c:otherwise>
					            <button class="btn btn-success">계약 동의</button>
					        </c:otherwise>
					    </c:choose>
                        </td>
                    <!-- 수정된 부분 시작: 모집완료 버튼을 합치기 위해 rowspan 추가 -->
                    <td rowspan="${rowCount + 1}" id="complete${status.index}">
                        <!-- <button type="submit" class="btn btn-danger">모집완료</button> -->
                       <form action="/myProManageCt/recruitmentCompleted" method="post">
                     		<input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
                       		<button type="submit" class="btn btn-danger">모집완료</button>
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
                        	<c:set var="skillList" value="${proFreeDTO.skill_nm }" />
								<c:forEach items="${fn:split(skillList, ',')}" var="skill">
								    <button type="button" class="btn btn-warning" ><c:out value="${skill}" /></button>
								</c:forEach><br>
						</td>
                        <td>${proFreeDTO.yeoncha} </td>
                        <td>
						 <form action="/myProManageCt/rejectApply" method="post">
                            <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
                            <input type="hidden" name="free_no" value="${proFreeDTO.free_no}">
                            <button type="submit" class="btn btn-warning">지원 거절</button>
                        </form>
					    <c:choose>
					        <c:when test="${proFreeDTO.meetingOK == 0}">
					            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${proFreeDTO.free_no}">계약하기</button>
					        </c:when>
					        <c:otherwise>
					            <button class="btn btn-success">계약 동의</button>
					        </c:otherwise>
					    </c:choose>
                        </td>
                                         <!-- 수정된 부분 시작: 동일한 프로젝트일 때 모집완료 버튼 칸을 없애기 위해 rowspan 업데이트 -->
                    <c:if test="${prevProjectName != proFreeDTO.proj_title}">
                        <td rowspan="${rowCount + 1}" id="complete${status.index}">
                            <!-- <button type="submit" class="btn btn-danger">모집완료</button> -->
                            <form action="/myProManageCt/recruitmentCompleted" method="post">
                                <input type="hidden" name="proj_no" value="${proFreeDTO.proj_no}">
                                <button type="submit" class="btn btn-danger">모집완료</button>
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
				<div class="modal fade" id="modal-${proFreeDTO.free_no}" style="display: none;">
					<form action="/myProManageCt/offerContract" method="post">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h4 class="modal-title">계약을 위한 사전미팅을 제안합니다.</h4>
							</div>
							<div class="modal-body">
								
									<label for="md">미팅 날짜를 정해주세요</label><input id="md" type="datetime-local" name="meeting_dt"><br>
									<label for="mp">미팅 장소와 내용에 대해 알려주세요</label><br>
									<textarea id="mp" name="meeting_pc" rows="6" cols="80" placeholder="미팅 장소와 내용에 대해 입력해주세요."></textarea>
									<input type="hidden" name="proj_no" value="${proFreeDTO.proj_no }">
									<input type="hidden" name="free_no" value="${proFreeDTO.free_no }">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
								<input type="submit" class="btn btn-primary" value="계약 제안">
							</div>
						</div>
					</div>
					</form>
				</div>
        </c:forEach>
    </table>
  		</div>
	</div>
</div>  
</section>






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
<%@ include file="../include/footer.jsp"%>

