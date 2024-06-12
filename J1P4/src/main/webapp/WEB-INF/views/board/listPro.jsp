<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body {
font-family: "Nanum Gothic", sans-serif !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#ss").change(function(){
		var sn = $('#ss').val();
		console.log(sn)
		
		$.ajax({
			url: "/board/listProto",
			type: 'GET',
			data: { "sn":sn },
			success: function(data){
			
			var proList = $('#pList');
			proList.empty();
			
			var show = "";
						

				 
			[].forEach.call(data, function(element, index, array){
						console.log(element, index);
						
					 

						show += '<div style="width : full; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;"> <div style="display: grid; grid-template-columns: 1fr 1fr;"> <div style="display: flex;"> <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div> <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div> </div> <div style="display: flex; justify-content: end;"> 하트 </div> </div>'+
								'<div style="font-weight: bold; font-size: 20px; margin: 6px 0;">'+
								data[index].proj_title+
								'</div> <div style="margin-bottom: 6px;"> 예상금액 <span style="font-weight: bold;">'+
								data[index].proj_cost+'원</span> | 예상 기간 <span style="font-weight: bold;">'+
								data[index].deadline+'일</span> </div>'+
						    
						   		 '<div style="display: grid; grid-template-columns: 1fr 1fr;"> <div style="display: flex; font-weight: bold;"> <span style="display: flex; align-items: center;">'+
						   		 data[index].work_field+
						         ' | 서울시 강남구 |</span> <div style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">'+
						         'JAVA'+
						         '</div> <div style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">'+
						         'MySql'+
						         '</div> </div> <div style="display: flex; justify-content: end;"> <span style="font-size: 14px; color : #444">'+
						         data[index].reg_date+
						         '</span> </div> </div> </div>';
						
			});

			proList.append(show); 

				
			},	
		      error: function() {
		          alert("에러 발생");
		      }
		});
	});
});

</script>
</head>
<body>
	<h1> 프로젝트 찾기 </h1>
	${pNum} 개의 프로젝트가 등록되었습니다. <br>
	
	<!-- 필터 -->
	
	<input type="button" value="개발">
	<input type="button" value="기획">
	<input type="button" value="디자인">
	<input type="button" value="퍼블리싱">
	
<!-- 	<input type="button" value="상세"> -->


	<!-- modal -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  상세
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">필터 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		업무 분야 <br>
       		<input type="button" value="개발">
			<input type="button" value="기획">
			<input type="button" value="디자인">
			<input type="button" value="퍼블리싱">
			<hr>
			관련 기술<br>
			<input type="search" name="관련기술">
			<hr>
			숙련도 <br>
			<input type="button" value="주니어">
			<input type="button" value="미들">
			<input type="button" value="시니어">
			<hr>
			지역<br>
			<select>
		    <option>서울</option>
		    <option>부산</option>
		    <option>대구</option>
		    <option>인천</option>
		    <option>광주</option>
		    <option>대전</option>
		    <option>울산</option>
		    </select><br>
		    <select>
		    <option>시/군/구</option>
		    </select>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">필터 적용하기</button>
      </div>
    </div>
  </div>
</div>

<div>
	<form name="sort">
		<select name="sn" id="ss">
			<option value="reg_date">최신 등록 순</option>
			<option value="proj_cost">견적 높은 순</option>
			<option value="deadline">마감 임박 순</option>
		</select>
	</form>
</div>
	
<fieldset  id="pList">


<!-- 회색 박스 -->
<c:forEach var="v" items="${list }">
<div style="width : full; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
    <!-- 모집중, NEW!, 하트 영역 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex;">
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div>
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
        </div>
        <div style="display: flex; justify-content: end;">
            하트
        </div>
    </div>

    <!-- 제목 -->
    <div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
        ${v.proj_title }
    </div>

    <!-- 예상 금액/ 예상 기간 -->
    <div style="margin-bottom: 6px;">
        예상금액 <span style="font-weight: bold;">${v.proj_cost }원</span> | 예상 기간 <span style="font-weight: bold;">${v.deadline }일</span>
    </div>
    
    <!-- 기타 정보 / 등록일자 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex; font-weight: bold;">
            <span style="display: flex; align-items: center;">${v.work_field } | 서울시 강남구 |</span>
            <div style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
                JAVA
            </div>
            <div style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
                MySql
            </div>
        </div>

        <div style="display: flex; justify-content: end;">
            <span style="font-size: 14px; color : #444">${v.reg_date }</span>
        </div>
    </div>
    
</div>
</c:forEach>


	<!-- 페이징 처리 -->
	<div class="float-center">
	    <ul class="pagination">
	        <c:if test="${pageMaker.prev }">
	            <li class="page-item previous">
	                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
	            </li>
	        </c:if>
	        
	        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
	                <a class="page-link" href="${num }">${num }</a>
	            </li>
	        </c:forEach>
	        
	        <c:if test="${pageMaker.next }">
	            <li class="page-item next">
	                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
	            </li>
	        </c:if>
	    </ul>
	</div>
	
<form id='actionForm' action="/board/listPro" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

</fieldset>

<div style="width : full; margin: 2px 3px; padding: 12px; background-color: #dddddd; border-radius: 7px; border: 1px solid black;">
    <!-- 모집중, NEW!, 하트 영역 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex;">
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px; margin-right: 6px;">모집중</div>
            <div style="background-color: white; border: 1px solid #333; border-radius: 5px; padding: 3px 12px;">NEW!</div>
        </div>
        <div style="display: flex; justify-content: end;">
            하트
        </div>
    </div>

    <!-- 제목 -->
    <div style="font-weight: bold; font-size: 20px; margin: 6px 0;">
        선불시스템 및 웹/앱 구축
    </div>

    <!-- 예상 금액/ 예상 기간 -->
    <div style="margin-bottom: 6px;">
        예상금액 <span style="font-weight: bold;">ㅇㅇㅇ원</span> | 예상 기간 <span style="font-weight: bold;">90일</span>
    </div>
    
    <!-- 기타 정보 / 등록일자 -->
    <div style="display: grid; grid-template-columns: 1fr 1fr;">
        <div style="display: flex; font-weight: bold;">
            <span style="display: flex; align-items: center;">개발 | 서울시 강남구 |</span>
            <div style="margin: 0 6px; padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
                JAVA
            </div>
            <div style="padding: 3px 12px; border: 1px solid #333; border-radius: 5px; background-color: white;">
                MySql
            </div>
        </div>

        <div style="display: flex; justify-content: end;">
            <span style="font-size: 14px; color : #444">등록일자 0000.00.00</span>
        </div>
    </div>
    
</div>

<script>

  var actionForm = $("#actionForm");

  $(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	actionForm.submit();
  });
</script>
</body>
</html>
