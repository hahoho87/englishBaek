<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<title>Baek 어학원</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="../../../resources/img/favicon.png" rel="icon">
<link href="../../../resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="../../../resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link
	href="../../../resources/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link href="../../../resources/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<div>
	<!--/ Intro Single star /-->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">공지사항</h1>
						<span class="color-text-a">Notice</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a
								href="/notice/list">공지사항</a></li>
						</ol>
					</nav>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<!-- 목록 출력 -->
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="notice">

							<tr>
								<td>${notice.noticeNo}</td>
								<td><a class="move" href="${notice.noticeNo}">
										${notice.noticeTitle}</a></td>
								<td>${notice.adminId}</td>
								<td><fmt:formatDate value="${notice.noticeRegdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
			<div class='row'>
				<div class="col-lg-12">
					<form id="searchForm" action="/notice/list">
						<select name="type">
							<c:set var="type" value="${pageMaker.cri.type }" />
							<!-- 검색 조건이 없을 경우 selected 표시 -->
							<option value="" <c:out value="${type == null?'selected':'' }"/>>검색
								조건 지정</option>
							<!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
							<option value="T" <c:out value="${type == 'T'?'selected':'' }"/>>제목</option>
							<option value="C" <c:out value="${type == 'C'?'selected':'' }"/>>내용</option>
							<option value="TC"
								<c:out value="${type == 'TC'?'selected':'' }"/>>제목 + 내용</option>
						</select> <input type="text" name="keyword"
							value="${pageMaker.cri.keyword }"> <input type="hidden"
							name="pageNum" value="${pageMaker.cri.pageNum }"> <input
							type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button class="btn btn-default">Search</button>
					</form>

				</div>

			</div>
			<!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->
		</div>
	</section>
</div>
<!--/ Intro Single End /-->





<!-- 페이지 번호 출력 -->
<div class="pull-right">
	<nav class="pagination-a">
		<ul class="pagination justify-content-end">
			<c:if test="${pageMaker.prev }">
				<!-- previous 버튼 표시 -->
				<li class="paginate_button page-item previous"><a
					class="page-link" href="${pageMaker.startPage - 1 }"> Previous</a></li>
			</c:if>

			<!-- 페이지 번호 표시 -->
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="num">
				<li
					class="paginate_button page-item  ${pageMaker.cri.pageNum == num ? 'active': '' }"><a
					class="page-link" href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<!-- next 버튼 표시 -->
				<li class="paginate_button page-item next"><a class="page-link"
					href="${pageMaker.endPage + 1 }">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
<!-- END 페이지 번호 출력 -->
<button id="regBtn" type="button" class="btn btn-a pull-right">글쓰기</button>

<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/notice/list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<!-- 검색 키워드와 조건 파라미터 추가 -->
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>

<script>
	$(function() {

		//등록 버튼 처리
		$("#regBtn").on("click", function() {
			self.location = "/notice/register";
		});

		//페이지 번호를 클릭하면 해당 페이지 목록 표시
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault(); //a 태그 기본 동작 막기

			//pageNum의 값을 클릭된 a의 href 값으로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			//폼 전송
			actionForm.submit();
		});

		//a 태그의 move 클래스 속성을 이용
		$(".move")
				.on(
						"click",
						function(e) {
							//a 태그의 기본 동작 막고
							e.preventDefault();

							actionForm
									.append("<input type='hidden' name='noticeNo' value='"
											+ $(this).attr('href') + "'>'");
							actionForm.attr("action", "/notice/read");
							actionForm.submit();
						});

		//검색 버튼 이벤트 처리
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 조건을 선택해 주세요."); //검색 조건 선택 알림
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("검색어를 입력해 주세요."); //검색어 입력 알림
				return false;
			}

			//검색 시 페이지 번호는 1이 되도록 처리
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit(); //폼 전송
		});

	});
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>