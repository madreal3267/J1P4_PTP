<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<style type="text/css">
 th, td {
 border: 1 solid black;
 }


</style>

</head>

<!-- ============== 비회원 헤더 ================= -->
<c:if test="${empty sessionScope.user_id }">
<c:import url="../include/header.jsp"></c:import>
</c:if>

<!-- ============== 프리랜서 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('프리랜서') }">
<c:import url="../include/freeHeader.jsp"></c:import>
</c:if>

<!-- ============== 클라이언트 헤더 ================= -->
<c:if test="${not empty sessionScope.user_id && sessionScope.user_cf.equals('클라이언트') }">
<c:import url="../include/ctHeader.jsp"></c:import>
</c:if>

<!-- ============== 로그인 했을 때 담기는 세션 값 (추후 삭제 예정) ================= -->
user_id: ${sessionScope.user_id },
user_cf: ${sessionScope.user_cf },
user_type: ${sessionScope.user_type },
free_no: ${sessionScope.free_no },
ct_no: ${sessionScope.ct_no }

<!-- ============== 페이지 시작 ================= -->

<div class="container light-style flex-grow-1 container-p-y" style="width:1100px; ">
 <div class="card overflow-hidden card-2" >
  <div class="row no-gutters row-bordered row-border-light">
  
  <!-- 사이드 메뉴 필요할 경우 사용 -->
   <div class="col-md-3 pt-0">
      <div class="list-group list-group-flush account-settings-links" style="width:274px;">
         <h4 class="font-weight-bold py-1 mx-4 my-3">이용방법</h4>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example1">클라이언트 등록</a>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example2">프리랜서 등록</a>
         <a class="list-group-item list-group-item-action" data-toggle="list" href="#ui_example3">이용요금</a>
      </div>
   </div>
   <!-- 사이드 메뉴 끝 -->
      
   <div class="col-md-9">
   <div class="tab-content">
   
   
   
      <!-- UI 예시용1 탭 시작 -->
      <div class="tab-pane fade active show" id="ui_example1"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">클라이언트 등록</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
		
			         
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- UI 예시용1 탭 끝 -->
      
      
      <!-- UI 예시용2 탭 시작 -->
      <div class="tab-pane fade" id="ui_example2"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">프리랜서 등록</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
         UI 예시용2
         
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- 프로젝트 등록하기 탭 끝 -->
      
      
      <!-- UI 예시용3 탭 시작 -->
      <div class="tab-pane fade" id="ui_example3"  >
         <!-- card body 시작 -->
         <div class="card-body border-start" >
            <div class="border-bottom" style="position: relative; right:16px; width:1000px; padding-bottom: 10px;" >
            <h4 class="font-weight-bold mx-4 my-3">이용요금</h4>
            </div>
         
         <!-- 본문 내용 시작 -->
            <table style="width: 600px; height: 200px; " >
         	<tr style="border: 1px solid black;">
         	<th style="border: 1px solid black;" colspan="2">클라이언트 이용 요금</th>
         	<td style="border: 1px solid black;" >무료(프로젝트 비용만 부담, 부가세 별도)</td>
         	</tr>
     		<tr>
     		<th style="border: 1px solid black;" rowspan="2">프리랜서 이용요금</th>
     		<td style="border: 1px solid black;">기업</td>
     		<td style="border: 1px solid black;">프로젝트 대금의 10%(부가세 별도)</td>
     		</tr>  
     		<tr style="border: 1px solid black;">
     		<td style="border: 1px solid black;">개인</td>
     		<td style="border: 1px solid black;">프로젝트 대금의 10%(원천징수 3.3% 공제)</td>
     		</tr>	
         	</table>
         </div>
       		<br>
       	 <h4>* 예시</h4>
       	 <h5>(프로젝트 금액이 1,000,000원일 때)</h5><br>	
         <table style="width: 700px; height: 200px; ">
         	<tr style="border: 1px solid black;">
         	<th style="border: 1px solid black;" colspan="2">클라이언트 결제금액</th>
         	<td style="border: 1px solid black;">1,100,000원(1,000,000원 + 부가세 10%)</td>
         	</tr>
     		<tr style="border: 1px solid black;">
     		<th style="border: 1px solid black;" rowspan="2">프리랜서 수령금액</th>
     		<td style="border: 1px solid black;">기업</td>
     		<td style="border: 1px solid black;">990,000원(이용요금을 제외한 프로젝트 대금 900,000원 + 부가세 10%)</td>
     		</tr>  
     		<tr style="border: 1px solid black;">
     		<td style="border: 1px solid black;">개인</td>
     		<td style="border: 1px solid black;">870,300원(이용요금을 제외한 프로젝트 대금 900,000원 - 원천징수 3.3%)</td>
     		</tr>	
         	</table>
         	<br>
         	<br>
        	
        	<h2>에스크로란?</h2>
        	<p>
			에스크로(Escrow)시스템은 클라이언트가  대금을 플랫폼에 예치하면<br>
			제3자인 플랫폼이보관 후, 프리랜서가 업무를 끝내면 클라이언트의 승인을 받은 뒤<br>
			대금을 지급하는 방식입니다. <br>

			* 에스크로는 거래의 안전성을 위한 보호장치로 클라이언트와 프리랜서 모두에게 이점이 있습니다.
        	</p>
        	<br>
        	<img width="800" height="400" alt="에스크로" src="../../resources/스크린샷(2).png">
        	
        	
         <!-- 본문 내용 끝 -->
         
         </div>
         <!-- card body 끝 -->   
      </div>
      <!-- UI 예시용3 탭 끝 -->
   
   
   
   
   </div>
   </div>
   
  </div>
 </div>
</div>

    
<%@ include file="../include/footer.jsp" %>