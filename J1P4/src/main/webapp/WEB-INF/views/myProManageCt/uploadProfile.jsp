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
			<form action="/blog/user?cmd=profileUploadProc" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<img id="img__wrap"
						onerror="this.src='/blog/image/userProfile.png'"
						src="${sessionScope.principal.userProfile}" width="350px"
						height="300px" />
				</div>
				<div class="form-group">
					<input type="file" name="userProfile" id="img__preview" />
				</div>

				<input type="hidden" name="id" value="${sessionScope.principal.id}" />

				<div class="form-group">
					<button class="btn btn-primary w-100">사진전송</button>
				</div>
			</form>
		</div>
	</div>

	<!--  -->
	
	<td>
		<c:if test="${item.price_check == true && item.settlement_check == false}">
			<form class="process-form" action="/admin/settlements/process"method="post">
				<input type="hidden" name="settlement_no" value="${item.settlement_no}" /> 
				<input type="hidden" name="settlement_requested" value="${item.settlement_requested}" />
				<button type="submit" class="btn btn-primary">정산 처리</button>
			</form>
		</c:if>
	</td>
	
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
	<!--  -->



	<script type="text/javascript">
		$(document).ready(function() {

			$("#img__preview").on("change", function(e) { // change는 변화감지 , e는 이벤트를 전달받음
				var f = e.target.files[0];
				if (!f.type.match("image*")) { //match도 사용 가능
					$("#img__preview").val("");
					alert('이미지만 첨부할 수 있습니다.');

				}
				// f.size = 1024*1024*2 --> 2MB
				var reader = new FileReader();
				reader.onload = function(e) {
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