<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- ============== 비회원 헤더 ================= -->

<c:if test="${empty sessionScope.user_id }">
<c:import url="../include/header.jsp"></c:import>
</c:if>
<!-- ============== 프리랜서 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('프리랜서') }">
<c:import url="../include/freeHeader.jsp"></c:import>
</c:if>

<!-- ============== 클라이언트 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('클라이언트') }">
<c:import url="../include/ctHeader.jsp"></c:import>
</c:if>
<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; margin-top: 500px;">
 <div class="card overflow-hidden card-2 py-5" >
  <div class="row no-gutters row-bordered row-border-light">	
	<h2> 프로젝트 등록 요청이 성공적으로 되었습니다.</h2>
	<h4>해당 프로젝트는 PTP 전문 매니저의 24시간 내 최종 검수를 거쳐 등록됩니다.<br>
	문제 발생 시 프로젝트 등록이 반려될 수 있으며 내 프로젝트 관리에서 확인 가능합니다.
	</h4>
	
	</div>
	</div>
	</div>

</body>
</html>