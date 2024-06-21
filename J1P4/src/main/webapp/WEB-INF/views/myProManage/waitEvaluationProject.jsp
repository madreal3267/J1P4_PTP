<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>

	<h1>/myProManage/waitEvaluationProject.jsp</h1> <br>
	
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
		<h1>평가 대기 중</h1>
		더 나은 프로젝트 거래 문화를 만들어 나가기 위해 클라이언트를 평가해 주세요.	
		</div>
	</div>
</div>
<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<section>
				<div>
					<i class="fa fa-fw fa-exclamation"></i>평가 기간 내에만 작성하실 수 있습니다.
				</div>

				<c:forEach var="projectVO" items="${waitEvaluationProjectList}">
					
						<b style="font-size: large;">${projectVO.proj_title }</b>
						<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#modal-${projectVO.ct_no}">평가하기</button>
						<br><br>
						${projectVO.ct_id } 클라이언트<span class="pull-right">작성기간 <fmt:formatDate value="${projectVO.mod_date }" pattern="yyyy-mm-dd"/></span>
						 <br>
					

					<!-- 모달창 생성하기 -->
					<div class="modal fade" id="modal-${projectVO.ct_no}">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="/myProManage/waitEvaluationProject" method="post"">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title">프로젝트 평가하기</h4>
									</div>
									<div class="modal-body">
										별점을 매겨주세요<br>
										<fieldset class="rate">
											<input type="radio" id="rating10-${projectVO.ct_no}" name="score" value="10"><label for="rating10-${projectVO.ct_no}" title="5점"></label> 
											<input type="radio" id="rating9-${projectVO.ct_no}" name="score" value="9"><label class="half" for="rating9-${projectVO.ct_no}" title="4.5점"></label> 
											<input type="radio" id="rating8-${projectVO.ct_no}" name="score" value="8"><label for="rating8-${projectVO.ct_no}" title="4점"></label> 
											<input type="radio" id="rating7-${projectVO.ct_no}" name="score" value="7"><label class="half" for="rating7-${projectVO.ct_no}" title="3.5점"></label> 
											<input type="radio" id="rating6-${projectVO.ct_no}" name="score" value="6"><label for="rating6-${projectVO.ct_no}" title="3점"></label> 
											<input type="radio" id="rating5-${projectVO.ct_no}" name="score" value="5"><label class="half" for="rating5-${projectVO.ct_no}" title="2.5점"></label> 
											<input type="radio" id="rating4-${projectVO.ct_no}" name="score" value="4"><label for="rating4-${projectVO.ct_no}" title="2점"></label> 
											<input type="radio" id="rating3-${projectVO.ct_no}" name="score" value="3"><label class="half" for="rating3-${projectVO.ct_no}" title="1.5점"></label> 
											<input type="radio" id="rating2-${projectVO.ct_no}" name="score" value="2"><label for="rating2-${projectVO.ct_no}" title="1점"></label> 
											<input type="radio" id="rating1-${projectVO.ct_no}" name="score" value="1"><label class="half" for="rating1-${projectVO.ct_no}" title="0.5점"></label>
										</fieldset>
										<hr>
										<textarea name="content" placeholder="프로젝트를 평가해주세요" rows="4" cols="50"></textarea>
										<input type="hidden" name="ct_no" value="${projectVO.ct_no }">
										<input type="hidden" name="proj_no" value="${projectVO.proj_no }">										
										<input type="hidden" name="free_no" value="${projectVO.free_no }">										
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
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
	