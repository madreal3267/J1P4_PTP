<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<div class="box-header">
    <h3 class="box-title">정산관리</h3>
</div>

<div class="btn-group" role="group" aria-label="Settlement Filter">
    <a href="/admin/settlements" class="btn btn-default">전체</a>
    <a href="/admin/settlements?price_check=true" class="btn btn-default">대금지불</a>
    <a href="/admin/settlements?price_check=false" class="btn btn-default">대금미지불</a>
    <a href="/admin/settlements?settlement_check=true" class="btn btn-default">정산완료</a>
    <a href="/admin/settlements?settlement_check=false" class="btn btn-default">정산미완료</a>
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
                                    <c:if test="${item.price_check == true && item.settlement_check == false}">
                                        <form class="process-form" action="/admin/settlements/process" method="post">
                                            <input type="hidden" name="settlement_no" value="${item.settlement_no}" />
                                            <input type="hidden" name="settlement_requested" value="${item.settlement_requested}" />
                                            <button type="submit" class="btn btn-primary">정산 처리</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
    IMP.init('imp41432400');  // 이곳에 고객사 식별코드 입력

    function processPayment(settlementNo, bankNm, account, depositor, fee, settledCost) {
        IMP.request_pay({
            pg: "kakaopay",
            pay_method: "easy",
            merchant_uid: "test_" + Math.random().toString(36).substr(2, 9),
            name: "정산 처리",
            amount: settledCost,
            buyer_name: depositor
        }, function (rsp) {
            if (rsp.success) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/admin/settlements/' + settlementNo + '/update', true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert("정산 처리 완료\n계좌번호: " + account + "\n은행명: " + bankNm + "\n예금주: " + depositor + "\n수수료: " + fee + "\n정산금액: " + settledCost);
                        location.reload();
                    } else if (xhr.readyState === 4) {
                        alert("결제는 성공하였으나 서버 업데이트에 실패하였습니다. 에러 내용: " + xhr.responseText);
                    }
                };
                xhr.send(JSON.stringify({
                    fee: fee,
                    settled_cost: settledCost
                }));
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
    }

    var buttons = document.querySelectorAll('.process-form');
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('submit', function (e) {
            e.preventDefault();
            var settlementNo = this.querySelector('input[name="settlement_no"]').value;
            var settlementRequested = this.querySelector('input[name="settlement_requested"]').value;

            if (settlementRequested === "false" && !confirm("클라이언트의 정산 요청이 필요합니다. 강제로 진행하시겠습니까?")) {
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/admin/settlements/' + settlementNo + '/calculate', true);
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 400) {
                    var data = JSON.parse(xhr.responseText);
                    var bankNm = data.bank_nm;
                    var account = data.account;
                    var depositor = data.depositor;
                    var fee = data.fee;
                    var settledCost = data.settled_cost;

                    processPayment(settlementNo, bankNm, account, depositor, fee, settledCost);
                }
            };
            xhr.send();
        });
    }
</script>

<%@ include file="../include/footer.jsp" %>
