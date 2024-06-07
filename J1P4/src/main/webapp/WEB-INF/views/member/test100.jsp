<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
function accountSend() {
b.submit();
}
</script>
<body>


<fieldset>
<legend>계좌정보</legend>
<form id="accountSend" action="" method="POST">
<label>은행명</label> <span class="box"><input type="text"></span><br>
<label>예금주</label> <span class="box"><input type="text"></span><br>
<label>계좌번호</label> <span class="box"><input type="number"></span><br>

<p>
<button class="a" type="button"
onclick="accountSend;">등록하기</button>
</p>
</form>
</fieldset>


</body>
</html>