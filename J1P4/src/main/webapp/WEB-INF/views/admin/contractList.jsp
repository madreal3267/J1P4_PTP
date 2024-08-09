<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/adminHeader.jsp" %>

<!-- Upload Contract Button -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#uploadContractModal">
    Upload Contract
</button>

<!-- Contract List Table -->
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
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">Contract No</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프로젝트 번호</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프로젝트 제목</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">클라이언트 아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">프리랜서 아이디</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">계약서 제목</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">파일 경로</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">업로드 날짜</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">다운로드</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contract" items="${contracts}">
                            <tr>
                                <td>${contract.contract_no}</td>
                                <td>${contract.proj_no}</td>
                                <td>${contract.proj_title}</td>
                                <td>${contract.ct_id}</td>
                                <td>${contract.free_id}</td>
                                <td>${contract.contract_title}</td>
                                <td>${contract.contract_path}</td>
                                <td>${contract.upload_date}</td>
                                <td>
                                    <a href="/admin/contract/download?contract_no=${contract.contract_no}" class="btn btn-success">Download</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Pagination -->
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

<!-- Upload Contract Modal -->
<div class="modal fade" id="uploadContractModal" tabindex="-1" role="dialog" aria-labelledby="uploadContractModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="uploadContractModalLabel">Upload Contract</h4>
            </div>
            <div class="modal-body">
                <form id="uploadForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="proj_no">Project No:</label>
                        <input type="text" class="form-control" id="proj_no" name="proj_no">
                    </div>
                    <div class="form-group">
                        <label for="contract_title">Contract Title:</label>
                        <input type="text" class="form-control" id="contract_title" name="contract_title">
                    </div>
                    <div class="form-group">
                        <label for="file">Upload Contract:</label>
                        <input type="file" class="form-control" id="file" name="file">
                    </div>
                    <button type="submit" class="btn btn-primary">Upload</button>
                </form>
            </div>
        </div> 
    </div>
</div>

<%@ include file="../include/adminFooter.jsp" %>

<script>
    function changePageSize(pageSize) {
        window.location.href = '/admin/contracts?pageSize=' + pageSize;
    }

    function validateForm() {
        var projNo = document.getElementById('proj_no').value;
        var contractTitle = document.getElementById('contract_title').value;
        var file = document.getElementById('file').value;

        console.log("Project No:", projNo);
        console.log("Contract Title:", contractTitle);
        console.log("File:", file);    

        if (projNo === '') {
            alert('프로젝트 번호를 입력하세요!');
            return false;
        }

        if (contractTitle === '') {
            alert('계약서 제목을 입력하세요!');
            return false;
        }

        if (file === '') {
            alert('업로드 할 파일을 선택해 주세요!');
            return false;
        }

        return true;
    }

    document.getElementById('uploadForm').onsubmit = function(e) {
        e.preventDefault(); // 기본 폼 제출 동작 방지

        if (!validateForm()) {
            return;
        }

        var formData = new FormData(this);
        fetch('/admin/contracts/upload', {
            method: 'POST',
            body: formData
        })
        .then(function(response) {
            return response.text().then(function(text) {
                if (response.status === 409) {
                    alert('중복된 프로젝트 번호입니다.');
                    throw new Error('중복된 프로젝트 번호입니다.');
                }
                if (!response.ok) {
                    throw new Error('업로드 실패');
                }
                return text;
            });
        })
        .then(function(text) {
            $('#uploadContractModal').modal('hide');
            alert(text);
            window.location.reload(); // 페이지 새로고침하여 목록 갱신
        })
        .catch(function(error) {
            console.error('문제가 발생하였습니다. :', error);
        });
    };
</script>
