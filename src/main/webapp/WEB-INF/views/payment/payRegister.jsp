<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<title>Baek 어학원</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="../../../resources/img/favicon.png" rel="icon">
<link href="../../../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="../../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="../../../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="../../../resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="../../../resources/css/style.css" rel="stylesheet">ㄴ
<title>수강신청</title>
</head>
<body>	<div class="panel-body">
		<!-- 게시물 등록 폼 -->
		<form role="form" method="post" action="/payment/payRegister">
			<!--  <div class="form-group">

			<input type="hidden" class="form-control" name="paymentNo" value="1" />
			</div>  -->
			
			<div class="form-group">
			<label>강의명:${courseName}</label>
			<input type="hidden" class="form-control" name="courseCode" value="${courseCode}" />
			</div>
			<div class="form-group">
				<label>결제금액:${paymentPrice}</label>
				<input type="hidden" class=
				"form-control" name="paymentPrice" value="${paymentPrice}" />
			</div>
			<div class="form-group">
			<label>결제자:</label>
				 <input  type="hidden" class="form-control" name="studentId" value="stu1" />
			</div>
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="paymentMethod" value="card" />
			</div>
			
			<div class="form-group">
				 <input  type="hidden" class="form-control" name="paymentState" value="결제완료" />
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
	    name : '주문명:${courseName}',
	    amount :'${paymentPrice}',
	    buyer_email : 'iamport@siot.do',
	    buyer_name : 'stu1',
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
