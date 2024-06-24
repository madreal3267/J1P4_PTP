<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<div class="box-header">
    <h3 class="box-title">매니저 목록</h3>
</div>

<div class="box-body">
    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="example1_length">
                    <label>Show 
                        <select name="example1_length" aria-controls="example1" class="form-control input-sm" onchange="changePageSize(this.value)">
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
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">이름</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">전화번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">이메일</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">승인 상태</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">승인</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="manager" items="${managers}">
                            <tr>
                                <td>${manager.manager_no}</td>
                                <td>${manager.manager_id}</td>
                                <td>${manager.manager_nm}</td>
                                <td>${manager.manager_call}</td>
                                <td>${manager.manager_email}</td>
                                <td><c:choose>
                                    <c:when test="${manager.approved}">승인됨</c:when>
                                    <c:otherwise>미승인</c:otherwise>
                                </c:choose></td>
                                <td><c:if test="${!manager.approved}">
                                    <form action="/admin/managers/approve" method="post" style="display:inline;">
                                        <input type="hidden" name="manager_no" value="${manager.manager_no}" />
                                        <button type="submit" class="btn btn-primary btn-sm">승인</button>
                                    </form>
                                </c:if></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing ${pagination.startRecord + 1} to ${pagination.endRecord} of ${pagination.totalRecords} entries</div>
            </div>
            <div class="col-sm-7">
                <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                    <ul class="pagination">
                        <c:if test="${pagination.hasPreviousPageBlock()}">
                            <li class="paginate_button previous" id="example1_previous">
                                <a href="?page=${pagination.startPage - 1}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="paginate_button <c:if test="${i == pagination.currentPage}">active</c:if>">
                                <a href="?page=${i}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="${i}" tabindex="0">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.hasNextPageBlock()}">
                            <li class="paginate_button next" id="example1_next">
                                <a href="?page=${pagination.endPage + 1}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="${pagination.endPage + 1}" tabindex="0">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function changePageSize(pageSize) {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('pageSize', pageSize);
        urlParams.set('page', 1);
        window.location.search = urlParams.toString();
    }
</script>

<%@ include file="../include/footer.jsp"%>
