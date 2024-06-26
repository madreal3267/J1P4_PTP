<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>

<div class="box-header">
    <h3 class="box-title">프로젝트 목록<c:choose><c:when test="${not empty param.proj_status}">(${param.proj_status})</c:when>
    <c:otherwise>
    	(전체)
    </c:otherwise>
    </c:choose>
    </h3>
</div>
<!-- 상태 필터 메뉴 -->
<div class="btn-group" role="group" aria-label="Project Status Filter">
    <a href="/admin/projects?proj_status=검수 단계" class="btn btn-default">검수 단계</a>
    <a href="/admin/projects?proj_status=모집중" class="btn btn-default">모집 중</a>
    <a href="/admin/projects?proj_status=반려" class="btn btn-default">반려</a>
    <a href="/admin/projects?proj_status=임시 저장" class="btn btn-default">임시 저장</a>
    <a href="/admin/projects?proj_status=등록 실패" class="btn btn-default">등록 실패</a>
    <a href="/admin/projects?proj_status=계약" class="btn btn-default">계약</a>
    <a href="/admin/projects?proj_status=진행 중" class="btn btn-default">진행 중</a>
    <a href="/admin/projects?proj_status=완료" class="btn btn-default">완료</a>
    <a href="/admin/projects" class="btn btn-default">전체</a>
</div>

<div class="box-body">
    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="example1_length">
                    <label>Show 
                        <select name="pageSize" aria-controls="example1" class="form-control input-sm" onchange="changePageSize(this.value)">
                            <option value="10" <c:if test="${pagination.pageSize == 10}">selected</c:if>>10</option>
                            <option value="25" <c:if test="${pagination.pageSize == 25}">selected</c:if>>25</option>
                            <option value="50" <c:if test="${pagination.pageSize == 50}">selected</c:if>>50</option>
                            <option value="100" <c:if test="${pagination.pageSize == 100}">selected</c:if>>100</option>
                        </select> entries
                    </label>
                </div>
            </div>
            <div class="col-sm-6">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                        <tr role="row">
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">프로젝트 번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프로젝트 제목</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">클라이언트 아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">등록날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프로젝트 기간</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">검수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${projects}">
                            <tr>
                                <td>${item.proj_no}</td>
                                <td>${item.proj_title}</td>
                                <td>${item.ct_id}</td>
                                <td>${item.formattedRegDate}</td>
                                <td>${item.work_period} 일</td>
                                <td>
                                    <c:if test="${item.proj_status == '검수 단계'}">
                                        <form action="/admin/project/approve?proj_no=${item.proj_no}" method="post" style="display:inline;">
                                            <input type="hidden" name="proj_no" value="${item.proj_no}">
                                            <button type="submit" class="btn btn-success">승인</button>
                                        </form>
                                        <button type="button" class="btn btn-danger" onclick="showRejectPopup(${item.proj_no})">반려</button>
                                    </c:if>
                                    <c:if test="${item.proj_status == '반려'}">
                                        <button type="button" class="btn btn-warning" onclick="showRejectReason(${item.proj_no})">반려 사유 확인</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">
                    Showing ${pagination.startRecord + 1} to ${pagination.endRecord} of ${pagination.totalRecords} entries
                </div>
            </div>
            <div class="col-sm-7">
                <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                    <ul class="pagination">
                        <c:if test="${pagination.hasPreviousPageBlock()}">
                            <li class="paginate_button previous" id="example1_previous">
                                <a href="?page=${pagination.startPage - 1}&pageSize=${pagination.pageSize}&proj_status=${projStatus}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="paginate_button <c:if test="${i == pagination.currentPage}">active</c:if>">
                                <a href="?page=${i}&pageSize=${pagination.pageSize}&proj_status=${projStatus}" aria-controls="example1" data-dt-idx="${i}" tabindex="0">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.hasNextPageBlock()}">
                            <li class="paginate_button next" id="example1_next">
                                <a href="?page=${pagination.endPage + 1}&pageSize=${pagination.pageSize}&proj_status=${projStatus}" aria-controls="example1" data-dt-idx="${pagination.endPage + 1}" tabindex="0">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Reject Modal -->
<div class="modal fade" id="rejectPopup" tabindex="-1" role="dialog" aria-labelledby="rejectPopupLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="rejectPopupLabel">프로젝트 반려</h4>
            </div>
            <div class="modal-body">
                <form id="rejectForm" action="/admin/project/reject" method="post">
                    <input type="hidden" id="rejectProjNo" name="proj_no">
                    <div class="form-group">
                        <label for="rejectReason">반려 사유</label>
                        <textarea id="rejectReason" name="reject_reason" class="form-control" required></textarea>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="submitRejectForm()">반려</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Reject Reason Modal -->
<div class="modal fade" id="rejectReasonPopup" tabindex="-1" role="dialog" aria-labelledby="rejectReasonPopupLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="rejectReasonPopupLabel">반려 사유</h4>
            </div>
            <div class="modal-body">
                <p id="rejectReasonText"></p>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
    function changePageSize(pageSize) {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('pageSize', pageSize);
        urlParams.set('page', 1); // Reset to page 1 when changing page size
        urlParams.set('proj_status', '${param.proj_status}'); // Ensure the proj_status parameter is included
        window.location.search = urlParams.toString();
    }

    function showRejectPopup(proj_no) {
        document.getElementById('rejectProjNo').value = proj_no;
        $('#rejectPopup').modal('show');
    }

    function submitRejectForm() {
        document.getElementById('rejectForm').submit();
    }

    function showRejectReason(proj_no) {
        // AJAX 요청을 통해 반려 사유 가져옴
        $.ajax({
            url: '/admin/project/rejectReason',
            method: 'GET',
            data: { proj_no: proj_no },
            success: function(response) {
                document.getElementById('rejectReasonText').innerText = response.reject_reason;
                $('#rejectReasonPopup').modal('show');
            },
            error: function() {
                alert('반려 사유를 가져오는데 실패했습니다.');
            }
        });
    }
</script>
