<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/adminHeader.jsp" %>

<div class="box-header">
    <h3 class="box-title">정산관리</h3>
</div>

<div class="btn-group" role="group" aria-label="Settlement Filter">
    <a href="/admin/settlements" class="btn btn-default">전체</a>
    <a href="/admin/settlements?price_check=true" class="btn btn-default">대금지불</a>
    <a href="/admin/settlements?price_check=false" class="btn btn-default">대금미지불</a>
    <a href="/admin/settlements?settlement_check=true" class="btn btn-default">정산완료</a>
    <a href="/admin/settlements?settlement_check=false" class="btn btn-default">정산미완료</a>
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
                            <th>정산 번호</th>
                            <th>프로젝트 번호</th>
                            <th>제목</th>
                            <th>클라이언트 아이디</th>
                            <th>프리랜서 아이디</th>
                            <th>대금</th>
                            <th>정산금</th>
                            <th>수수료</th>
                            <th>대금지불여부</th>
                            <th>정산여부</th>
                            <th>정산 요청</th>
                            <th>정산 처리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${settlements}">
                            <tr>
                                <td>${item.settlement_no}</td>
                                <td>${item.proj_no}</td>
                                <td>${item.proj_title}</td>
                                <td>${item.ct_id}</td>
                                <td>${item.free_id}</td>
                                <td>${item.price}</td>
                                <td>${item.settled_cost}</td>
                                <td>${item.fee}</td>
                                <td><c:choose>
                                    <c:when test="${item.price_check == false}">
                                        No
                                    </c:when>
                                    <c:otherwise>
                                        Yes
                                    </c:otherwise>
                                </c:choose></td>
                                <td><c:choose>
                                    <c:when test="${item.settlement_check == false}">
                                        No
                                    </c:when>
                                    <c:otherwise>
                                        Yes
                                    </c:otherwise>
                                </c:choose></td>
                                <td><c:choose>
                                    <c:when test="${item.settlement_requested == false}">
                                        No
                                    </c:when>
                                    <c:otherwise>
                                        Yes
                                    </c:otherwise>
                                </c:choose></td>
                                <!-- 정산 처리 버튼 -->
                                <td>    
                                    <c:if test="${item.price_check == true && item.settlement_check == false}">
                                        <form class="process-form" action="/admin/settlements/process" method="post">
                                            <input type="hidden" name="settlement_no" value="${item.settlement_no}" />
                                            <input type="hidden" name="settlement_requested" value="${item.settlement_requested}" />
                                            <button type="submit" class="btn btn-primary">정산 처리</button>
                                        </form>
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
                                <a href="?page=${pagination.startPage - 1}&pageSize=${pagination.pageSize}&price_check=${priceCheck}&settlement_check=${settlementCheck}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="paginate_button <c:if test="${i == pagination.currentPage}">active</c:if>">
                                <a href="?page=${i}&pageSize=${pagination.pageSize}&price_check=${priceCheck}&settlement_check=${settlementCheck}" aria-controls="example1" data-dt-idx="${i}" tabindex="0">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.hasNextPageBlock()}">
                            <li class="paginate_button next" id="example1_next">
                                <a href="?page=${pagination.endPage + 1}&pageSize=${pagination.pageSize}&price_check=${priceCheck}&settlement_check=${settlementCheck}" aria-controls="example1" data-dt-idx="${pagination.endPage + 1}" tabindex="0">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/payment.js"></script> <!-- 결제 처리 -->

<%@ include file="../include/footer.jsp" %>

<script>
    function changePageSize(pageSize) {
        var priceCheck = '<c:out value="${priceCheck}" />';
        var settlementCheck = '<c:out value="${settlementCheck}" />';
        window.location.href = '/admin/settlements?pageSize=' + pageSize + '&price_check=' + priceCheck + '&settlement_check=' + settlementCheck;
    }
</script>
