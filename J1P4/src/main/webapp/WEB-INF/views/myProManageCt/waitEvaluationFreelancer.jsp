<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/headerCt.jsp" %>

	<h1>/myProManageCt/waitEvaluationFreelancer.jsp</h1> <br>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
		<h1>평가 대기 중</h1>
		프리랜서에게 정산이 완료된 프로젝트를 확인할 수 있습니다.
		</div>
	</div>
</div>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<div>
					<i class="fa fa-fw fa-exclamation"></i>평가는 평가 기간 내에만 작성하실 수 있습니다.
				</div>

				<c:forEach var="freeDTO" items="${waitEvaluationFreelancerList}">
					<p>
						<b>${freeDTO.name }</b><br>
						${freeDTO.proj_title}<br>
						작성기간 <fmt:formatDate value="${freeDTO.mod_date }" pattern="yyyy-mm-dd"/>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-${freeDTO.free_no}">평가하기</button>
					</p>

					<!-- 모달창 생성하기 -->
					<div class="modal fade" id="modal-${freeDTO.free_no}">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="/myProManageCt/waitEvaluationFreelancer" method="post">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title text-center">프리랜서 평가하기</h4>
									</div>
									<div class="modal-body">
										별점을 매겨주세요<br>
										<fieldset class="rate">
											<input type="radio" id="rating10" name="score" value="10"><label for="rating10" title="5점"></label> 
											<input type="radio" id="rating9" name="score" value="9"><label class="half" for="rating9" title="4.5점"></label> 
											<input type="radio" id="rating8" name="score" value="8"><label for="rating8" title="4점"></label> 
											<input type="radio" id="rating7" name="score" value="7"><label class="half" for="rating7" title="3.5점"></label> 
											<input type="radio" id="rating6" name="score" value="6"><label for="rating6" title="3점"></label> 
											<input type="radio" id="rating5" name="score" value="5"><label class="half" for="rating5" title="2.5점"></label> 
											<input type="radio" id="rating4" name="score" value="4"><label for="rating4" title="2점"></label> 
											<input type="radio" id="rating3" name="score" value="3"><label class="half" for="rating3" title="1.5점"></label> 
											<input type="radio" id="rating2" name="score" value="2"><label for="rating2" title="1점"></label> 
											<input type="radio" id="rating1" name="score" value="1"><label class="half" for="rating1" title="0.5점"></label>
										</fieldset>
										<hr>
										<textarea name="content" placeholder="프리랜서를 평가해주세요" rows="4" cols="50"></textarea>
										<input type="hidden" name="ct_no" value="${freeDTO.ct_no }">									
										<input type="hidden" name="free_no" value="${freeDTO.free_no }">											
										<input type="hidden" name="proj_no" value="${freeDTO.proj_no}">											
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
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
	