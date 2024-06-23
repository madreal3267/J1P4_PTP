<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="d-flex justify-content-center">
   <form action="/blog/user?cmd=profileUploadProc" method="post" enctype="multipart/form-data">
      <div class="form-group">
         <img id = "img__wrap" onerror="this.src='/blog/image/userProfile.png'" src="${sessionScope.principal.userProfile}" width="350px" height="300px" />
      </div>
      <div class= "form-group">
         <input type="file" name="userProfile" id="img__preview" />
      </div>
      
        <input type="hidden" name="id" value="${sessionScope.principal.id}" />
     
      <div class="form-group">
      	<button class="btn btn-primary w-100">사진전송</button>
      </div>
   </form>
   </div>
</div>






<script type="text/javascript">
$(document).ready(function() {

	$("#img__preview").on("change", function(e){ // change는 변화감지 , e는 이벤트를 전달받음
		var f = e.target.files[0];
		if(!f.type.match("image*")){ //match도 사용 가능
			$("#img__preview").val("");
			alert('이미지만 첨부할 수 있습니다.');
			
			}
		// f.size = 1024*1024*2 --> 2MB
		var reader = new FileReader();
		reader.onload = function(e){ 
			$("#img__wrap").attr("src", e.target.result); //이미지가 담김 
			// 이때 e 실행가능, 밑에 있으면 못찾을 수 있다. 위에 작성, 다운로드 완료시 콜백
				
			}
		reader.readAsDataURL(f); // 비동기적으로 실행
	
		// ${"#img_wrap"}.attr("src", e.target.result); // 만약 동기적으로 실행된다면 해당 구문실행
		 
	}); // click이라는 이벤트가 발생하면, function이 실행

});
</script>
</body>
</html>