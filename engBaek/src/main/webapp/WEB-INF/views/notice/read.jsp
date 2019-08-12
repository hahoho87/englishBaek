<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>
<section class="intro-single">
	<div class="container">
		<div class="row">
			<div class="panel-body">
				<!-- 게시물 등록 폼 -->
				<form role="form" method="post" action="/notice/modify">
					<input type="hidden">
					<div class="form-group">
						<label>Date</label> <input type="hidden" name="noticeNo"
							value="${notice.noticeNo }"> <input class="form-control"
							name="noticeRegedate"
							value='<fmt:formatDate value="${notice.noticeRegdate}"
                   	   	   					   pattern="yyyy-MM-dd"/>'
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control"
							name="noticeTitle"
							value='<c:out value="${notice.noticeTitle }"/>'
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" name="noticeContent"
							readonly="readonly"><c:out
								value="${notice.noticeContent }" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="adminId"
							readonly="readonly" value='<c:out value="${notice.adminId }"/>'
							readonly="readonly" />
					</div>
					<button type="submit" data-oper="modify" class="btn btn-info">Modify</button>
					<!-- 수정 처리 -->
					<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
					<!-- 삭제 처리 -->
					<button data-oper='list' class="btn btn-default">List</button>
					<!-- 목록 페이지 이동 -->
				</form>
				<!-- END 게시물 등록 폼 -->
			</div>
			<!-- /.panel-body -->
		</div>
	</div>
</section>
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
	$(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'remove') { //삭제 버튼이 눌린 경우 
				var deleteConfirm = confirm("정말 삭제하시겠습니까?")
				if (deleteConfirm == true) {
					alert("삭제가 완료되었습니다.")
					formObj.attr("action", "/notice/remove");
				} else {
					return;
				}

			} else if (operation === 'list') { //목록 버튼이 눌린 경우
				//				self.location = "/notice/list";	
				//				return;

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/notice/list").attr("method", "get");
				formObj.empty(); //폼 태그 모든 내용을 지움

				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);

			} else {
				formObj.attr("action", "/notice/modify").attr("method", "get");
			}

			formObj.submit();
		});
	});
</script>
</body>
</html>