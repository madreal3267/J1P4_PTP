<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%@ include file="../include/headerCt.jsp"%>

<!-- 폼태그 -->
<form role="form" action="" method="post">
	<input type="hidden" name="proj_no" value="${proFreeDTO.proj_no }">
	<input type="hidden" name="free_no" value="${proFreeDTO.free_no }">
</form>

<h1>/myProManageCt/recruitingProject.jsp</h1>

<section>
	<h1>지원자 모집중</h1>
	지원자를 모집 중인 프로젝트를 관리할 수 있습니다.
</section>
<section>
    <table class="table table-bordered bg-light" border="1">
        <tr>
            <td>모집 중인 프로젝트 </td>
            <td>지원한 프리랜서</td>
            <td>기술</td>
            <td>연차</td>
            <td>지원 거절/계약하기</td>
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
                        	<button type="submit" class="btn btn-warning" >지원 거절</button>
                        	<button type="submit" class="btn btn-primary" >계약하기</button>
                        </td>
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
						   	<button type="submit" class="btn btn-warning" >지원거절</button>
                        	<button type="submit" class="btn btn-primary" >계약하기</button>
                        </td>
                    </tr>
                    <c:set var="rowCount" value="${rowCount + 1}" />
                    <script>
                        document.getElementById("proj${status.index - 1}").rowSpan = ${rowCount+1};
                    </script>
                </c:otherwise>
            </c:choose>
            <c:if test="${status.last}">
                <!-- 마지막 항목인 경우 -->
                <script>
                    document.getElementById("proj${status.index}").rowSpan = ${rowCount+1};
                </script>
            </c:if>
        </c:forEach>
    </table>
</section>



<script type="text/javascript">
	$(document).ready(function(){
		
		// '지원 거절' 버튼 클릭 -> update table apply_mgmt set reject_apply
		$(".btn-warning").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/rejectApply]]");
			$("form[role='form']").submit();			
			
		});
		
		// '계약하기' 버튼 클릭 -> update table project set proj_status
		$(".btn-warning").click(function(){
			$("form[role='form']").attr("action","/myProManageCt/Contract");
			$("form[role='form']").submit();			
			
		});
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
	})	
</script>	
<%@ include file="../include/footer.jsp"%>
