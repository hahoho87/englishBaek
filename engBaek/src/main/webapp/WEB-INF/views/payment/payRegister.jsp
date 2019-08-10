<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>수강신청</title>
</head>
<body>	<div class="panel-body">
		<!-- 게시물 등록 폼 -->
		<form role="form" method="post" action="/payment/payRegister">
			<div class="form-group">
			<input type="hidden"  class ="form-control"  name="paymentNo" value="7" />
			</div>
			<div class="form-group">
			<label>강의명:미친토익</label>
			<input type="hidden" class="form-control" name="courseCode" value="1" />
			</div>
			<div class="form-group">
				<label>결제금액 :210,000 </label>
				<input type="hidden" class="form-control" name="paymentPrice" value="210000" />
			</div>
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="studentId" value="stu1" />
			</div>
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="paymentMethod" value="card" />
			</div>
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="cardType" value="card" />
			</div>
			
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="cardNo" value="5555-55555" />
			</div>
			
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="paymentState" value="complete" />
			</div>
			<button type="submit" class="btn btn-default" id="pay">결제하기</button>
			
		</form>
		<!-- END 게시물 등록 폼 -->
	</div>
	<!-- /.panel-body -->
	
	<!-- JavaScript Libraries -->
  <script src="../../../resources/lib/jquery/jquery.min.js"></script>
  <script src="../../../resources/lib/jquery/jquery-migrate.min.js"></script>
  <script src="../../../resources/lib/popper/popper.min.js"></script>
  <script src="../../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="../../../resources/lib/easing/easing.min.js"></script>
  <script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../../../resources/lib/scrollreveal/scrollreveal.min.js"></script>
  
  <!-- Contact Form JavaScript File -->
<script src="../../../resources/contactform/contactform.js"></script>
<!-- Template Main Javascript File -->
<script src="../../../resources/js/main.js"></script>


<script>


var IMP = window.IMP; // 생략가능
IMP.init('imp98130930'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	
	var formObj = $("form");
	
$("button").on("click",function(e){
	
		e.preventDefault();
IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	
	    	
	    	
	    	
	    	
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        formObj.attr("action", "/payment/payRegister").attr("method","post");
	        
	        
	        
	        formObj.submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
});

</script>
