<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>


<div class="box-header">
    <h3 class="box-title">정산관리</h3>
</div>

<div class="btn-group" role="group" aria-label="Settlement Filter">
    <a href="/admin/settlement/paymentDetail" class="btn btn-default">전체</a>
    <a href="/admin/settlement/paymentDetail?price_check=true" class="btn btn-default">대금지불</a>
    <a href="/admin/settlement/paymentDetail?price_check=false" class="btn btn-default">대금미지불</a>
</div>

<div class="box-body">
    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="example1_length">
                    <label>Show 
                        <select name="example1_length" aria-controls="example1" class="form-control input-sm">
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select> entries
                    </label>
                </div>
            </div>
            <div class="col-sm-6">
                <div id="example1_filter" class="dataTables_filter">
                    <label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1"></label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                        <tr role="row">
                            
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프로젝트 번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">제목</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">클라이언트 아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프리랜서 아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">대금</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">대금지불여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${settlements}">
                            <tr>
                                <td>${item.proj_no}</td>
                                <td>${item.proj_title}</td>
                                <td>${item.ct_id}</td>
                                <td>${item.free_id}</td>
                                <td>${item.price}</td>
                                <td><c:choose>
                                <c:when test="${item.price_check == false}">
                                No
                                </c:when>
                                <c:otherwise>
                                Yes
                                </c:otherwise>
                                </c:choose></td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
            </div>
            <div class="col-sm-7">
                <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                    <ul class="pagination">
                        <li class="paginate_button previous disabled" id="example1_previous">
                            <a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
                        </li>
                        <li class="paginate_button active">
                            <a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a>
                        </li>
                        <li class="paginate_button ">
                            <a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a>
                        </li>
                        <li class="paginate_button ">
                            <a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a>
                        </li>
                        <li class="paginate_button ">
                            <a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a>
                        </li>
                        <li class="paginate_button ">
                            <a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a>
                        </li>
                        <li class="paginate_button ">
                            <a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a>
                        </li>
                        <li class="paginate_button next" id="example1_next">
                            <a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
	
	
<%@ include file="../include/footer.jsp"%>
