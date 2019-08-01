<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp"%>
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
	<c:forEach items="${faqList}" var="faq">

		<tr>
			<td>${faq.faqNo}</td>
			<td>
				<a href="../classQna/read?classQnaNo=${faq.faqTitle}"> ${faq.faqTitle}</a>
			</td>
			<td>${faq.adminId}</td>
			<td>
				<fmt:formatDate value="${faq.faqRegdate}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
	</c:forEach>

</table>

<script>
	
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>