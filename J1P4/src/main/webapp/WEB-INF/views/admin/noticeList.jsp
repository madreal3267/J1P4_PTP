<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/adminHeader.jsp"%>

<div class="box-header">
    <h3 class="box-title">공지사항 목록</h3>
</div>

<div class="box-body">
    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="example1_length">
                    <label>Show 
                        <select name="example1_length" aria-controls="example1" class="form-control input-sm" onchange="changePageSize(this.value)">
                            <option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10</option>
                            <option value="25" <c:if test="${pageSize == 25}">selected</c:if>>25</option>
                            <option value="50" <c:if test="${pageSize == 50}">selected</c:if>>50</option>
                            <option value="100" <c:if test="${pageSize == 100}">selected</c:if>>100</option>
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
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${notices}">
                            <tr>
                                <td>${notice.announcement_id}</td>
                                <td><a href="#" onclick="showAnnouncement(${notice.announcement_id})">${notice.title}</a></td>
                                <td>${notice.manager_id}</td>
                                <td>${notice.created_at}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing ${start + 1} to ${end} of ${total} entries</div>
            </div>
            <div class="col-sm-7">
                <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                    <ul class="pagination">
                        <c:if test="${pagination.hasPreviousPageBlock()}">
                            <li class="paginate_button previous">
                                <a href="?page=${pagination.startPage - 1}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
                            <li class="paginate_button <c:if test='${i == page}'>active</c:if>">
                                <a href="?page=${i}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="${i}" tabindex="0">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.hasNextPageBlock()}">
                            <li class="paginate_button next">
                                <a href="?page=${pagination.endPage + 1}&pageSize=${pagination.pageSize}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/adminFooter.jsp"%>

<!-- 공지사항 모달 -->
<div class="modal fade" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="announcementModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="announcementModalTitle"></h4>
            </div>
            <div class="modal-body" id="announcementModalContent"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function changePageSize(pageSize) {
        var urlParams = new URLSearchParams(window.location.search);
        urlParams.set('pageSize', pageSize);
        urlParams.set('page', 1);
        window.location.search = urlParams.toString();
    }

    function showAnnouncement(id) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/admin/announcement?id=' + id, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    var data = JSON.parse(xhr.responseText);
                    document.getElementById('announcementModalTitle').innerText = data.title;
                    document.getElementById('announcementModalContent').innerText = data.content;
                    $('#announcementModal').modal('show');
                } else {
                    console.error('There was a problem with the request:', xhr.statusText);
                }
            }
        };
        xhr.send();
    }
</script>
