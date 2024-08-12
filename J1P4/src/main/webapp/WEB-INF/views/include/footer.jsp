<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     
     
<div class="container" style="margin-top: 100px;">
	<footer class="py-3 my-4">
	<ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
    </ul>
    <p class="text-center text-body-secondary">© 2024-06-06 Zip-Ga-Go-Ship-Da, Inc</p>
   </footer>
</div>
     
     
     <script type="text/javascript">
     $(function(){
			
			$("#projButt").click(function(){
// 				alert("@@@@@");
				if("${sessionScope.ident }"== 1 || "${sessionScope.identB}"== 1){
					location.href="/J1P4_PTP/enroll/enrollProj";
				} else {
					alert("신원인증이 필요합니다");
					
					location.href="/J1P4_PTP/member/mypage";
				}
				
			});
			
		});
     </script>
     
     </body>
</html>