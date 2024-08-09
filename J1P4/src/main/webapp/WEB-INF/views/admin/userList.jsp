<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>

<div class="box-header">
    <h3 class="box-title">회원 조회 내역</h3>
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
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">이름</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">유저 유형</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">가입날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">역할</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${users}">
                            <tr>
                                <td>${item.no}</td>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${item.user_type}</td>
                                <td>${item.formattedRegDate}</td>
                                <td>${item.role}</td>
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
                                <a href="?page=${pagination.startPage - 1}&pageSize=${pagination.pageSize}&type=${type}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="paginate_button <c:if test="${i == pagination.currentPage}">active</c:if>">
                                <a href="?page=${i}&pageSize=${pagination.pageSize}&type=${type}" aria-controls="example1" data-dt-idx="${i}" tabindex="0">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.hasNextPageBlock()}">
                            <li class="paginate_button next" id="example1_next">
                                <a href="?page=${pagination.endPage + 1}&pageSize=${pagination.pageSize}&type=${type}" aria-controls="example1" data-dt-idx="${pagination.endPage + 1}" tabindex="0">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/adminFooter.jsp" %>

<script>
    function changePageSize(pageSize) {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('pageSize', pageSize);
        urlParams.set('page', 1); // Reset to page 1 when changing page size
        urlParams.set('type', '${type}'); // Ensure the type parameter is included
        window.location.search = urlParams.toString();
    }
</script>
