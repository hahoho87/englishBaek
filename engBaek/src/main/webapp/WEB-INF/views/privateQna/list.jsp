<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp"%>


<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
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


<form action="/privateQna/list">
<table  class="table table-striped table-bordered table-hover" border="3">
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
			    &nbsp RE:<a href="../privateQna/replyRead?privateQnaReplyNo=${privateQnaReply.privateQnaReplyNo}"> ${privateQnaReply.privateQnaReplyTitle}</a>
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

<!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
<div class='row'>
	<div class="col-lg-12">
		<form id="searchForm" action="/privateQna/list">
			<select name="type">
				<c:set var="type" value="${pageMaker.cri.type }" />
				<!-- 검색 조건이 없을 경우 selected 표시 -->
				<option value="" <c:out value="${type == null?'selected':'' }"/>>검색 조건 지정</option>
				<!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
				<option value="T" <c:out value="${type == 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${type == 'C'?'selected':'' }"/>>내용</option>
				<option value="TC" <c:out value="${type == 'TC'?'selected':'' }"/>>제목 + 내용</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.cri.keyword }"> <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-default">Search</button>
		</form>
	</div>

</div>



<!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->


<!-- 페이지 번호 출력 -->
<div class="pull-right">
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<!-- previous 버튼 표시 -->
			<li class="paginate_button page-item previous"><a class="page-link" href="${pageMaker.startPage - 1 }"> Previous</a></li>
		</c:if>

		<!-- 페이지 번호 표시 -->
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active': '' }"><a class="page-link" href="${num }">${num }</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next }">
			<!-- next 버튼 표시 -->
			<li class="paginate_button page-item next"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
		</c:if>
	</ul>
</div>
<!-- END 페이지 번호 출력 -->

<!--  페이지 번호와 개수 넘겨주기 -->
<form id="actionForm" action="/private/list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<!-- 검색 키워드와 조건 파라미터 추가 -->
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> <input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>
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


//페이지 번호 클릭 해당 페이지 목록 표시하기 
		var actionForm = $("#searchForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault(); //a 태그 기본 동작 막기

			//pageNum의 값을 클릭된 a의 href 값으로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			//폼 전송
			actionForm.submit();
		});    
	
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>