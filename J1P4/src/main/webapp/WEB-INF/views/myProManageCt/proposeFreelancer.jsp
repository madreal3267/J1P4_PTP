<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/headerCt.jsp"%>

<h1>/myProManage/proposeFreelancer.jsp</h1>
<hr>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>제안한 프리랜서</h1>
			프로젝트 진행상태를 확인할 수 있습니다.
		</div>
	</div>
</div>
<div class="col-md-12">
    <div class="box box-default">
        <div class="box-header with-border">
            <section>
                <table class="table table-bordered bg-light" border="1">
                    <tr>
                        <td>프로젝트 이름</td>
                        <td>프리랜서 이름</td>
                        <td>기술</td>
                        <td>경력</td>
                        <td>지원 여부 확인</td>
                    </tr>
                    <c:set var="prevProjectName" value="" />
                    <c:set var="rowCount" value="0" />
                    <c:forEach var="proFreeDTO" items="${proposeFreelancerList}" varStatus="status">
                        <c:choose>
                            <c:when test="${prevProjectName != proFreeDTO.proj_title}">
                                <!-- 이전 프로젝트 이름과 현재 프로젝트 이름이 다른 경우 -->
                                <c:if test="${status.index > 0}">
                                    <!-- 이전 프로젝트의 행 끝 -->
                                    <c:out value="${rowCount}" />
                                    <c:set var="rowCount" value="0" />
                                </c:if>
                                <tr>
                                    <td rowspan="1" id="proj${status.index}"><a href="#">${proFreeDTO.proj_title}</a></td>
                                    <td><a href="#">${proFreeDTO.name}</a></td>
                                    <td>${proFreeDTO.skills}</td>
                                    <td>${proFreeDTO.yeoncha}</td>
                                    <td><b>${proFreeDTO.apply_YN}</b></td>
                                </tr>
                                <c:set var="prevProjectName" value="${proFreeDTO.proj_title}" />
                                <c:set var="rowCount" value="1" />
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td><a href="#">${proFreeDTO.name}</a></td>
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
            </section>
        </div>
    </div>
</div>








<!-- 외형만 복사. 작동원리 탐구 필요. -->
<div class="dataTables_paginate paging_simple_numbers"
	id="example2_paginate">
	<ul class="pagination">
		<li class="paginate_button previous disabled" id="example2_previous"><a
			href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
		<li class="paginate_button active"><a href="#"
			aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2"
			data-dt-idx="2" tabindex="0">2</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2"
			data-dt-idx="3" tabindex="0">3</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2"
			data-dt-idx="4" tabindex="0">4</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2"
			data-dt-idx="5" tabindex="0">5</a></li>
		<li class="paginate_button "><a href="#" aria-controls="example2"
			data-dt-idx="6" tabindex="0">6</a></li>
		<li class="paginate_button next" id="example2_next"><a href="#"
			aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
	</ul>
</div>

<%@ include file="../include/footer.jsp"%>

