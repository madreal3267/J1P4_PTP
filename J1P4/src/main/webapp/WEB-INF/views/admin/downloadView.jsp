<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Contract</title>
</head>
<body>

	<%
		String contractFile = (String) request.getAttribute("contract_file");
		String fileName = contractFile.substring(contractFile.lastIndexOf("/") + 1);
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		java.nio.file.Files.copy(java.nio.file.Paths.get(contractFile), response.getOutputStream());
		response.getOutputStream().flush();
		return;
	%>
</body>
</html>