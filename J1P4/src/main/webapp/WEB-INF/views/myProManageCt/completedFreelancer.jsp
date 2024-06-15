<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/completedFreelancer.jsp</h1> <br>


<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
		<h1>완료한 프로젝트</h1>
		프리랜서에게 정산이 완료된 프로젝트를 확인 할 수 있습니다.
		</div>
	</div>
</div>

	<section>
		<div> 1. 평가를 완료한 프리랜서 목록입니다.<br>
			  2. 프리랜서가 남긴 평가는 [프로필 관리] > [프리랜서의 평가]에서 확인할 수 있습니다.<br>
			  3. 공정하게 평가를 작성할 수 있도록 상호 평가가 완료되거나 작성 기한이 종료된 뒤에 평가가 공개됩니다 .
		</div> 
		
		<c:forEach var="cflDTO" items="${completedFreelancerList}">
			<p> <h4>${cflDTO.name }</h4>
				  ${cflDTO.proj_title }<br>
				 ${cflDTO.score } <%-- ${score } --%> <button>수정하기</button ><br>
				 ${cflDTO.content} <%-- ${content } --%>	
			</p>
		</c:forEach>
		
	</section>



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

<%@ include file="../include/footer.jsp" %>
	