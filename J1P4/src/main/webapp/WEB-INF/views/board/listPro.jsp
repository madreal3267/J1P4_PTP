<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body {
font-family: "Nanum Gothic", sans-serif !important;
}
</style>
</head>
<body>
	<h1> 프로젝트 찾기 </h1>
	${pNum} 개의 프로젝트가 등록되었습니다. <br>
	
	<!-- 필터 -->
	
	<input type="button" value="개발">
	<input type="button" value="기획">
	<input type="button" value="디자인">
	<input type="button" value="퍼블리싱">
	
<!-- 	<input type="button" value="상세"> -->


	<!-- modal -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  상세
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">필터 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		업무 분야 <br>
       		<input type="button" value="개발">
			<input type="button" value="기획">
			<input type="button" value="디자인">
			<input type="button" value="퍼블리싱">
			<hr>
			관련 기술<br>
			<input type="search" name="관련기술">
			<hr>
			숙련도 <br>
			<input type="button" value="주니어">
			<input type="button" value="미들">
			<input type="button" value="시니어">
			<hr>
			지역<br>
			<select>
		    <option>서울</option>
		    <option>부산</option>
		    <option>대구</option>
		    <option>인천</option>
		    <option>광주</option>
		    <option>대전</option>
		    <option>울산</option>
		    </select><br>
		    <select>
		    <option>시/군/구</option>
		    </select>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">필터 적용하기</button>
      </div>
    </div>
  </div>
</div>

<div>
	<form name="sort">
		<select name="정렬방식" id="ss" onchange="selectCh()">
			<option value="1">최신 등록 순</option>
			<option value="2">견적 높은 순</option>
			<option value="3">마감 임박 순</option>
		</select>
	</form>
</div>
	
	<fieldset>
	모집중
	new<!-- 날짜 계산 해야 할듯 --> 
	북마크 하트<br>

	<table border="1">
		<tr>
			<td>프로젝트 제목</td>
			<td>예상 금액</td>
			<td>모집 마감일</td>
			<td>업무분야</td>
			<td>등록일자</td>
		</tr>
	<c:forEach var="v" items="${list }">
		<tr>
			<td>${v.proj_title }</td>
			<td>${v.proj_cost }</td>
			<td>${v.deadline }</td>
			<td>${v.work_field }</td>
			<td>${v.reg_date }</td>
		</tr>
	</c:forEach>

	</table>
	</fieldset>
	
	<!-- 페이징 처리 -->
	<div class="float-center">
	    <ul class="pagination">
	        <c:if test="${pageMaker.prev }">
	            <li class="page-item previous">
	                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
	            </li>
	        </c:if>
	        
	        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
	                <a class="page-link" href="${num }">${num }</a>
	            </li>
	        </c:forEach>
	        
	        <c:if test="${pageMaker.next }">
	            <li class="page-item next">
	                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
	            </li>
	        </c:if>
	    </ul>
	</div>

<form id='actionForm' action="/board/listPro" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

<script>

  var actionForm = $("#actionForm");

  $(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	actionForm.submit();
  });
</script>
</body>
</html>
