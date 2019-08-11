<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<link href="../../../resources/css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="panel-body">
		<!-- 게시물 수정 폼 -->
		<form role="form" method="post" action="/notice/modify">
			<!-- 게시물 번호 파라미터 추가 -->
			<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
			<!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
			<input type="hidden" name="pageNum" value="${cri.pageNum }"> <input type="hidden" name="amount" value="${cri.amount }">
			<!-- 검색 조건과 키워드 파라미터 추가 -->
			<input type="hidden" name="type" value="${cri.type }"> <input type="hidden" name="keyword" value="${cri.keyword }"> <input type="hidden">
			
			<div class="form-group">
			
				<label>Title</label> <input class="form-control" name="noticeTitle" value="${notice.noticeTitle }">
			</div>
			<div class="form-group">
				<label>Text area</label>
				<textarea rows="3" class="form-control" name="noticeContent">${notice.noticeContent }</textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input class="form-control" name="adminId" value="${notice.adminId }" readonly="readonly" />
			</div>
			<!-- 수정 처리 -->
			<button type="submit" data-oper="modify" class="btn btn-info">Modify</button>
			<!-- 목록 페이지 이동 -->
			<button type="submit" data-oper="cancel" class="btn btn-default">cancel</button>
			
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
$(function(){
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log("operation : " + operation);
		
		if(operation === 'cancel'){ 		
			formObj.attr("action", "/notice/read");
		} else if(operation === 'modify') {	
			

			var noticeNoTag = $("input[name='noticeNo']").clone();
			//페이지 번호와 게시물 개수 복사
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			//검색 조건과 키워드 복사
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();

			formObj.attr("action", "/notice/modify")
				   .attr("method", "post");
			formObj.append(noticeNoTag);
			//페이지 번호와 게시물 개수만 폼에 추가
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			
			//검색 조건과 키워드 폼에 추가 
			formObj.append(typeTag);
			formObj.append(keywordTag);
			alert("수정이 완료되었습니다.")
		}
		formObj.submit();
	});
});
</script>
</body>
</html>