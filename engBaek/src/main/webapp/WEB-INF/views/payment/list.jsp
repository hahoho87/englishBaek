<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp"%>

<form action="/payment/list" id="operForm" >
<table border="4">
	<!-- 목록 출력 -->
	<thead>
		<tr>
			<th>No.</th>
			<th>강좌명</th>
			<th>결제수단</th>
			<th>결제일</th>
			<th>결제 상태</th>
		</tr>
	</thead>
	<c:forEach items="${list}" var="payment">

		<tr>
			<td>${payment.paymentNo}</td>
			<td>
				 ${payment.courseName}
			</td>
			<td>${payment.paymentMethod}</td>
			<td>
				<fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd" />
			</td>
			<td> <button id="cancel" value="${payment.paymentState}">${payment.paymentState}</button></td>
		</tr>
	
	</c:forEach>
	
</table>
</form> 

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
//a 태그의 move 클래스 속성을 이용
var  operForm = $("#operForm");

$(".move").on("click", function(e){ 
	//a 태그의 기본 동작 막고
	e.preventDefault();	
	
	actionForm.append("<input type='hidden' name='reviewNo' value='"+
					 $(this).attr('href')+"'>'");
	actionForm.attr("action", "/review/register");
	actionForm.submit();
});


$("#cancel").on("click",function(e){

	e.preventDefault();	
	

	var deletcheck=confirm("결제를 취소 하시겠습니까?")
	 if(deletcheck==true){
	 alert("결제 취소가 완료되었습니다.");
	 
	 operForm.attr("action","/payment/modify").attr("method","post");
	 
	 operForm.submit();
	 }else{
		 return;
	 }
})

	 

                                        
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>