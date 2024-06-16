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

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<div class="box-header with-border">
				1. 평가를 완료한 프리랜서 목록입니다.<br>
			  	2. 프리랜서가 남긴 평가는 [프로필 관리] > [프리랜서의 평가]에서 확인할 수 있습니다.<br>
			  	3. 공정하게 평가를 작성할 수 있도록 상호 평가가 완료되거나 작성 기한이 종료된 뒤에 평가가 공개됩니다 .
			</div>
			<br>
			<c:forEach var="cflDTO" items="${completedFreelancerList}">
				<div class="box-header with-border">
					<h4>${cflDTO.name }</h4>
					${cflDTO.proj_title }<br>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${cflDTO.free_no}">수정하기</button>
					<div class="rating-display">
						<c:set var="score" value="${cflDTO.score}" />
						<c:forEach begin="1" end="5" var="i">
						
							<span class="star ${cflDTO.score >= (i * 2)-1 ? 'filled' : ''}">
								<c:choose>
									<c:when test="${cflDTO.score >= i * 2}">
										<i class="fa fa-star"></i>
									</c:when>
									<c:when test="${cflDTO.score >= (i * 2) - 1}">
										<i class="fa fa-star-half-empty"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-star-o"></i>
									</c:otherwise>
								</c:choose>
							</span>
 
								<!-- 모달창 생성하기 -->
								<div class="modal fade" id="modal-${cflDTO.free_no}">
									<div class="modal-dialog">
										<div class="modal-content">
											<form action="/myProManageCt/completedFreelancer" method="post">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
													<h4 class="modal-title">프로젝트 평가하기</h4>
												</div>
												<div class="modal-body">
													별점을 매겨주세요<br>
												<fieldset class="rate">
											<input type="radio" id="rating10-${cflDTO.free_no}" name="score" value="10" <c:if test="${cflDTO.score == 10}">checked</c:if>><label for="rating10-${cflDTO.free_no}" title="5점"></label> 
											<input type="radio" id="rating9-${cflDTO.free_no}" name="score" value="9" <c:if test="${cflDTO.score == 9}">checked</c:if>><label class="half" for="rating9-${cflDTO.free_no}" title="4.5점"></label> 
											<input type="radio" id="rating8-${cflDTO.free_no}" name="score" value="8" <c:if test="${cflDTO.score == 8}">checked</c:if>><label for="rating8-${cflDTO.free_no}" title="4점"></label> 
											<input type="radio" id="rating7-${cflDTO.free_no}" name="score" value="7" <c:if test="${cflDTO.score == 7}">checked</c:if>><label class="half" for="rating7-${cflDTO.free_no}" title="3.5점"></label> 
											<input type="radio" id="rating6-${cflDTO.free_no}" name="score" value="6" <c:if test="${cflDTO.score == 6}">checked</c:if>><label for="rating6-${cflDTO.free_no}" title="3점"></label> 
											<input type="radio" id="rating5-${cflDTO.proj_no}" name="score" value="5" <c:if test="${cflDTO.score == 5}">checked</c:if>><label class="half" for="rating5-${cflDTO.free_no}" title="2.5점"></label> 
											<input type="radio" id="rating4-${cflDTO.free_no}" name="score" value="4" <c:if test="${cflDTO.score == 4}">checked</c:if>><label for="rating4-${cflDTO.free_no}" title="2점"></label> 
											<input type="radio" id="rating3-${cflDTO.free_no}" name="score" value="3" <c:if test="${cflDTO.score == 3}">checked</c:if>><label class="half" for="rating3-${cflDTO.free_no}" title="1.5점"></label> 
											<input type="radio" id="rating2-${cflDTO.free_no}" name="score" value="2" <c:if test="${cflDTO.score == 2}">checked</c:if>><label for="rating2-${cflDTO.free_no}" title="1점"></label> 
											<input type="radio" id="rating1-${cflDTO.free_no}" name="score" value="1" <c:if test="${cflDTO.score == 1}">checked</c:if>><label class="half" for="rating1-${cflDTO.free_no}" title="0.5점"></label>
										</fieldset>
													<hr>
													<textarea name="content" placeholder="프로젝트를 평가해주세요" rows="4" cols="50">${cflDTO.content}</textarea>
													<input type="hidden" name="ct_no" value="${cflDTO.ct_no }">
													<input type="hidden" name="proj_no" value="${cflDTO.proj_no }">										
													<input type="hidden" name="free_no" value="${cflDTO.free_no }">										
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary">등록하기</button>
												</div>
											</form>	
										</div>			
									</div>
								</div>
						</c:forEach>
						<div>${cflDTO.score}</div>
					</div>
					${cflDTO.content }
				</div>
			</c:forEach>
		</div>
	</div>
</div>		

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
	