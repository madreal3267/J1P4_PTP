<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/completedProject.jsp</h1> <br>
	
	<section>
		<h1>완료한 프로젝트</h1>
		평가가 완료된 프로젝트 목록
	</section>
	
	<section>
		<div> 1. 평가를 완료한 프로젝트 목록입니다.<br>
			  2. 클라이언트가 남긴 평가는 [프로필 관리] > [클라이언트의 평가]에서 확인할 수 있습니다.<br>
			  3. 공정하게 평가를 작성할 수 있도록 상호 평가가 완료되거나 작성 기한이 종료된 뒤에 평가가 공개됩니다 .
		</div> 
		
		<c:forEach var="projectVO" items="${pageProjects}">
			<p > <h4>${projectVO.proj_title }</h4>
				${projectVO.ct_no }<br>
				 project_value의 score <%-- ${score } --%> <button>수정하기</button ><br>
				 project_value의 content <%-- ${content } --%>	
			</p>
		</c:forEach>
    <div class="pagination">
        
            <c:if test="${currentPage > 1}">
               <a href="?page=${currentPage - 1}&pageSize=${pageSize}">&laquo; 이전</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span>${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}&pageSize=${pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&pageSize=${pageSize}">다음 &raquo;</a>
            </c:if>
        
    </div>
		
	</section>


<%@ include file="../include/footer.jsp" %>
	