<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<h1>Contract List</h1>

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
                        <li class="paginate_button">
                            <a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a>
                        </li>
                        <li class="paginate_button">
                            <a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a>
                        </li>
                        <li class="paginate_button">
                            <a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a>
                        </li>
                        <li class="paginate_button">
                            <a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a>
                        </li>
                        <li class="paginate_button">
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
                <form id="uploadForm" action="/admin/contracts/upload" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
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

<script>
    function validateForm() {
        var projNo = document.getElementById('proj_no').value;
        var contractTitle = document.getElementById('contract_title').value;
        var file = document.getElementById('file').value;

        console.log("Project No:", projNo);
        console.log("Contract Title:", contractTitle);
        console.log("File:", file);	

        if (projNo === '') {
            alert('Project No is required');
            return false;
        }

        if (contractTitle === '') {
            alert('Contract Title is required');
            return false;
        }

        if (file === '') {
            alert('Please select a file to upload');
            return false;
        }

        alert('Submitting form with Project No: ' + projNo);
        return true;
    }
</script>

<%@ include file="../include/footer.jsp" %>
