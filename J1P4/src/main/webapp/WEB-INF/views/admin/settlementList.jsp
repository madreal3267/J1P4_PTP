<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="box-header">
    <h3 class="box-title">정산관리</h3>
</div>

<div class="btn-group" role="group" aria-label="Settlement Filter">
    <a href="/admin/settlements" class="btn btn-default">전체</a>
    <a href="/admin/settlements?priceCheck=true" class="btn btn-default">대금지불</a>
    <a href="/admin/settlements?priceCheck=false" class="btn btn-default">대금미지불</a>
    <a href="/admin/settlements?settlementCheck=true" class="btn btn-default">정산완료</a>
    <a href="/admin/settlements?settlementCheck=false" class="btn btn-default">정산미완료</a>
</div>

<div class="box-body">
    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
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
                                <td>
                                    <button class="btn btn-primary" <%-- onclick="processSettlement(${item.settlement_no}, '${item.free_id}', '${item.bank_nm}', '${item.depositor}', '${item.account}', ${item.price}) --%>">정산 처리</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>
</div>

<script>
//     function processSettlement(settlementNo, freeId, bankNm, depositor, account, price) {
//         const IMP = window.IMP;
//         IMP.init("imp41432400"); // 가맹점 식별코드

//         IMP.request_pay({
//             pg: 'tosspayments',
//             pay_method: 'trans',
//             merchant_uid: 'merchant_' + new Date().getTime(),
//             name: 'Settlement Payment',
//             amount: price * 0.9, // 수수료 10% 제외
//             buyer_name: freeId,
//             buyer_email: 'buyer@example.com', // 샘플 이메일
//             buyer_tel: '010-1234-5678', // 샘플 전화번호
//             escrow: true
//         }, function (rsp) {
//             if (rsp.success) {
//                 // 결제 성공 시 서버로 결제 결과 전송
//                 $.ajax({
//                     url: "/admin/settlements/process",
//                     method: "POST",
//                     data: {
//                         settlement_no: settlementNo,
//                         fee: price * 0.1,
//                         settled_cost: price * 0.9
//                     },
//                     success: function (response) {
//                         alert('결제 성공: ' + bankNm + ', ' + depositor + ', ' + account);
//                         location.reload();
//                     },
//                     error: function (error) {
//                         alert('결제 처리 중 오류가 발생했습니다.');
//                     }
//                 });
//             } else {
//                 alert('결제에 실패했습니다. ' + rsp.error_msg);
//             }
//         });
//     }
</script>

<%@ include file="../include/footer.jsp" %>
