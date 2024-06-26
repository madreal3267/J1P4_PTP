// payment.js

document.addEventListener("DOMContentLoaded", function() {
    // 포트원(PortOne) API를 초기화합니다.
    IMP.init('imp41432400');  // 고객사 식별코드를 입력합니다.

    // 결제 처리 메서드
    function processPayment(settlementNo, bankNm, account, depositor, fee, settledCost) {
        // 포트원 결제 요청 메서드 호출
        IMP.request_pay({
            pg: "kakaopay", // PG사 (여기서는 카카오페이)
            pay_method: "easy", // 결제 방식: 간편결제
            merchant_uid: "test_" + Math.random().toString(36).substr(2, 9), // 고유 주문번호 (중복 결제를 막기 위해 고유값 처리)
            name: "정산 처리", // 결제명
            amount: settledCost, // 결제 금액 (수수료를 제외한 금액)
            buyer_name: "PTP" // 구매자 이름
        }, function (rsp) {
            // 결제 성공 시
            if (rsp.success) {
                var xhr = new XMLHttpRequest(); // 새로운 XMLHttpRequest 객체 생성
                xhr.open('POST', '/admin/settlements/' + settlementNo + '/update', true); // 서버에 POST 요청을 보냄
                xhr.setRequestHeader('Content-Type', 'application/json'); // 요청 헤더 설정

                // 서버 응답 처리
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // 결제 및 서버 업데이트 성공 시
                        alert("정산 처리 완료\n계좌번호: " + account + "\n은행명: " + bankNm + "\n예금주: " + depositor + "\n수수료: " + fee + "\n정산금액: " + settledCost);
                        location.reload(); // 페이지 새로고침
                    } else if (xhr.readyState === 4) {
                        // 결제는 성공했으나 서버 업데이트 실패 시
                        alert("결제는 성공하였으나 서버 업데이트에 실패하였습니다. 에러 내용: " + xhr.responseText);
                    }
                };

                // 서버로 보낼 데이터 설정
                xhr.send(JSON.stringify({
                    fee: fee, // 수수료
                    settled_cost: settledCost // 정산 금액
                }));
            } else {
                // 결제 실패 시
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
    }

    // .process-form 클래스를 가진 모든 폼에 대해 이벤트 리스너를 설정합니다.
    var buttons = document.querySelectorAll('.process-form');
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('submit', function (e) {
            e.preventDefault(); // 폼 기본 제출 동작을 막음
            var settlementNo = this.querySelector('input[name="settlement_no"]').value; // 폼에서 settlement_no 값을 가져옴
            var settlementRequested = this.querySelector('input[name="settlement_requested"]').value; // 폼에서 settlement_requested 값을 가져옴

            // 정산 요청 체크
            if (settlementRequested === "false" && !confirm("클라이언트의 정산 요청이 필요합니다. 강제로 진행하시겠습니까?")) {
                return; // 정산 요청이 false이고 사용자가 강제 진행을 원하지 않으면 종료
            }

            var xhr = new XMLHttpRequest(); // 새로운 XMLHttpRequest 객체 생성
            // /calculate 엔드포인트로 GET 요청을 보냄
            xhr.open('GET', '/admin/settlements/' + settlementNo + '/calculate', true);

            // 서버 응답 처리
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 400) {
                    // 서버로부터 받은 데이터를 JSON으로 파싱
                    var data = JSON.parse(xhr.responseText);
                    var bankNm = data.bank_nm; // 은행명
                    var account = data.account; // 계좌번호
                    var depositor = data.depositor; // 예금주
                    var fee = data.fee; // 수수료
                    var settledCost = data.settled_cost; // 정산 금액

                    // 결제 처리 메서드 호출
                    processPayment(settlementNo, bankNm, account, depositor, fee, settledCost);
                }
            };
            xhr.send(); // 요청을 보냄
        });
    }
});
