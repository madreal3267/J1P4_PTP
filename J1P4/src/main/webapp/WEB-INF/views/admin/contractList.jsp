<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contract List</title>
</head>
<body>
	<div class="container">
		<h2>Contract List</h2>
		<table class="table table-bordered">
			<tr>
				<th>Project No</th>
				<th>Client No</th>
				<th>Freelancer No</th>
				<th>Project Title</th>
				<th>Contract File</th>
			</tr>
			<c:forEach var="contract" items="${contractList}">
				<tr>
					<td>${contract.proj_no}</td>
					<td>${contract.ct_no}</td>
					<td>${contract.free_no}</td>
					<td>${contract.proj_title}</td>
					<td><c:if test="${contract.contract_file != null}">
							<a
								href="/admin/contract/download?contract_file=${contract.contract_file}">Download</a>
						</c:if> <c:if test="${contract.contract_file == null}">
							<form action="/admin/contract/upload" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="proj_no" value="${contract.proj_no}">
								<input type="hidden" name="ct_no" value="${contract.ct_no}">
								<input type="hidden" name="free_no" value="${contract.free_no}">
								<input type="hidden" name="proj_title"
									value="${contract.proj_title}"> <input type="file"
									name="file">
								<button type="submit" class="btn btn-primary">Upload</button>
							</form>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>
