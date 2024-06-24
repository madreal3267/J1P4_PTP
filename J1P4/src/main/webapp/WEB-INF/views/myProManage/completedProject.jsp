<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@ include file="../include/headerMPM_F.jsp"%>

<h1>/myProManage/completedProject.jsp</h1>

<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<h1>완료한 프로젝트</h1>
			평가가 완료된 프로젝트 목록
		</div>
	</div>
</div>


<div class="col-md-12">
	<div class="box box-default">
		<div class="box-header with-border">
			<div class="box-header with-border">
				1. 평가를 완료한 프로젝트 목록입니다.<br> 
				2. 클라이언트가 남긴 평가는 [프로필 관리] > [클라이언트의평가]에서 확인할 수 있습니다.<br> 
				3. 공정하게 평가를 작성할 수 있도록 상호 평가가 완료되거나 작성 기한이 종료된 뒤에 평가가 공개됩니다 .
			</div>
			<br>
			<c:forEach var="projDTO" items="${completedProjectList}">
				<div class="box-header with-border">
					<h4>${projDTO.proj_title }</h4>
					${projDTO.ct_id } 클라이언트
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-${projDTO.proj_no}">수정하기</button>
					<div class="rating-display">
						<c:set var="score" value="${projDTO.score}" />
						<c:forEach begin="1" end="5" var="i">
						
							<span class="star ${projDTO.score >= (i * 2)-1 ? 'filled' : ''}">
								<c:choose>
									<c:when test="${projDTO.score >= i * 2}">
										<i class="fa fa-star"></i>
									</c:when>
									<c:when test="${projDTO.score >= (i * 2) - 1}">
										<i class="fa fa-star-half-empty"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-star-o"></i>
									</c:otherwise>
								</c:choose>
							</span>
 
								<!-- 모달창 생성하기 -->
								<div class="modal fade" id="modal-${projDTO.proj_no}">
									<div class="modal-dialog">
										<div class="modal-content">
											<form action="/myProManage/completedProject" method="post">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
													<h4 class="modal-title">프로젝트 평가하기</h4>
												</div>
												<div class="modal-body">
													별점을 매겨주세요<br>
												<fieldset class="rate">
											<input type="radio" id="rating10-${projDTO.proj_no}" name="score" value="10" <c:if test="${projDTO.score == 10}">checked</c:if>><label for="rating10-${projDTO.proj_no}" title="10점"></label> 
											<input type="radio" id="rating9-${projDTO.proj_no}" name="score" value="9" <c:if test="${projDTO.score == 9}">checked</c:if>><label class="half" for="rating9-${projDTO.proj_no}" title="9점"></label> 
											<input type="radio" id="rating8-${projDTO.proj_no}" name="score" value="8" <c:if test="${projDTO.score == 8}">checked</c:if>><label for="rating8-${projDTO.proj_no}" title="8점"></label> 
											<input type="radio" id="rating7-${projDTO.proj_no}" name="score" value="7" <c:if test="${projDTO.score == 7}">checked</c:if>><label class="half" for="rating7-${projDTO.proj_no}" title="7점"></label> 
											<input type="radio" id="rating6-${projDTO.proj_no}" name="score" value="6" <c:if test="${projDTO.score == 6}">checked</c:if>><label for="rating6-${projDTO.proj_no}" title="6점"></label> 
											<input type="radio" id="rating5-${projDTO.proj_no}" name="score" value="5" <c:if test="${projDTO.score == 5}">checked</c:if>><label class="half" for="rating5-${projDTO.proj_no}" title="5점"></label> 
											<input type="radio" id="rating4-${projDTO.proj_no}" name="score" value="4" <c:if test="${projDTO.score == 4}">checked</c:if>><label for="rating4-${projDTO.proj_no}" title="4점"></label> 
											<input type="radio" id="rating3-${projDTO.proj_no}" name="score" value="3" <c:if test="${projDTO.score == 3}">checked</c:if>><label class="half" for="rating3-${projDTO.proj_no}" title="3점"></label> 
											<input type="radio" id="rating2-${projDTO.proj_no}" name="score" value="2" <c:if test="${projDTO.score == 2}">checked</c:if>><label for="rating2-${projDTO.proj_no}" title="2점"></label> 
											<input type="radio" id="rating1-${projDTO.proj_no}" name="score" value="1" <c:if test="${projDTO.score == 1}">checked</c:if>><label class="half" for="rating1-${projDTO.proj_no}" title="1점"></label>
										</fieldset>
													<hr>
													<textarea name="content" placeholder="프로젝트를 평가해주세요" rows="4" cols="50">${projDTO.content}</textarea>
													<input type="hidden" name="ct_no" value="${projDTO.ct_no }">
													<input type="hidden" name="proj_no" value="${projDTO.proj_no }">										
													<input type="hidden" name="free_no" value="${projDTO.free_no }">										
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
						<div>${projDTO.score}</div>
					</div>
					${projDTO.content }
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	
	// 프로젝트 평가 후 이동하였을때 모달창 생성
	var result = "${msg}";
	
	if(result == "evaluateOK"){

		Swal.fire({
		  icon: "info",
		  title: "평가가 성공적으로 등록되었습니다.",
		  showConfirmButton: true,
		  confirmButtonText: "확인"
		});
	}		
	
	// 프로젝트 수정 후 모달창 생성
	if(result == "modifyOK"){

		Swal.fire({
		  icon: "info",
		  title: "평가가 성공적으로 수정되었습니다.",
		  showConfirmButton: true,
		  confirmButtonText: "확인"
		});
	}		
	
});
</script>
<%@ include file="../include/footer.jsp"%>
