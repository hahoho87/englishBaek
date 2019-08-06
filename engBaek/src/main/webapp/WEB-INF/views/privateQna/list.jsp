<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp"%>

<form action="/privateQna/list">
<table border="3">
	<!-- 목록 출력 -->
	<thead>
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	
	<c:forEach items="${list}" var="privateQna">
	<!-- 원글 자리  -->
	
		<tr>
			<td>${privateQna.privateQnaNo}</td>
			<td>
				<a href="../privateQna/read?privateQnaNo=${privateQna.privateQnaNo}"> ${privateQna.privateQnaTitle}</a>
			</td>
			<td>${privateQna.studentId}</td>
			<td>
				<fmt:formatDate value="${privateQna.privateQnaRegdate}" pattern="yyyy-MM-dd" />
			</td>
			</tr>
	
			
			
			
			<tr>
			<c:forEach items="${replylist}" var="privateQnaReply">
			  <c:if test="${privateQnaReply.privateQnaNo eq privateQna.privateQnaNo}"> 
			
			<td></td>
			<td>
			    &nbsp RE:<a href="../privateQnaReply/read?privateQnaReplyNo=${privateQnaReply.privateQnaReplyNo}"> ${privateQnaReply.privateQnaReplyTitle}</a>
			</td>	
			<td>${privateQnaReply.adminId}</td>
			<td>
				<fmt:formatDate value="${privateQnaReply.privateQnaReplyRegdate}" pattern="yyyy-MM-dd" />
			</td>
				
			
			</c:if>
			</c:forEach>
			</tr>
			
			</c:forEach>
		
		
	
			
	
	
</table>
</form> 
<button id="regBtn" type="button" class="btn btn-xs pull-right">등록</button>

<script>
//a 태그의 move 클래스 속성을 이용

$(".move").on("click", function(e){
	//a 태그의 기본 동작 막고
	e.preventDefault();	
	
	actionForm.append("<input type='hidden' name='privateQnaNo' value='"+
					 $(this).attr('href')+"'>'");
	actionForm.attr("action", "/privateQna/register").attr("Method","get");
	actionForm.submit();
});
	

//등록 버튼 처리
$("#regBtn").on("click", function() {
	self.location = "/privateQna/register";
});
	
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>