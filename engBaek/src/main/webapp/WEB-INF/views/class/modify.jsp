<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/sidebar.jsp"%>

<form role="form" method="post" action="/class/modify">
  <!-- 게시물 번호 파라미터 추가 -->
  <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
  <!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
  <input type="hidden" name="pageNum" value="${cri.pageNum }">
  <input type="hidden" name="amount" value="${cri.amount }">
  <!-- 검색 조건과 키워드 파라미터 추가 -->
  <input type="hidden" name="type" value="${cri.type }">
  <input type="hidden" name="keyword" value="${cri.keyword }">
  <input type="hidden">
</form>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">공지사항 수정</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/class/list/">공지사항</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <br> <br>
    <!--/ News Single Star /-->
    <section class="news-single nav-arrow-b">
      <div class="container">
        <div class="row">
          <div class="form-comments">
            <form role="form" class="form-a" method="post" action="/class/modify/">
              <input type="hidden" name="classDataNo" value="${classData.classDataNo}">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="noticeNo">작성자</label>
                    <input type="text" name="name" class="form-control form-control-lg form-control-a" id="adminId" value="<sec:authentication property="principal.username"/>" readonly="readonly">
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="noticeTitle">제목</label>
                    <input type="text" name="classDataTitle" class="form-control form-control-lg form-control-a" id="classDataTitle" value="${classData.classDataTitle}" required>
                  </div>
                </div>

                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">내용</label>
                    <textarea id="classDataContent" class="form-control" placeholder="내용 *" name="classDataContent" cols="45" rows="8">${classData.classDataContent}</textarea>
                  </div>
                </div>
              </div>
              <button type="submit" data-oper="modify" class="btn btn-a">Modify</button>
              <!-- 수정 처리 -->
              <button type="submit" data-oper="cancel" class="btn btn-a">Cancel</button>
              <!-- 취소 처리 -->
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--/ News Single End /-->

  </div>
</section>
<!--/ Intro Single End /-->

<script>
	var formObj = $("form");

	$(function() {
		var classDataNo = "${classData.classDataNo}"; //게시글 번호 
		var courseCode = '${classData.courseCode}';
		$("#updateDoneBtn").on("click", function(e) {
			var classDataTitle = $("input[name='classDataTitle']").val();
			var classDataContent = $("textarea[name='classDataContent']").val();
			if (classDataTitle == "") {
				alert("제목을 입력해주세요");
				return false;
			} else if (classDataContent == "") {
				alert("내용을 입력해주세요");
				return false;
			} else {
				formObj.append("<input type='hidden' name='courseCode' value='"
					+courseCode+"'>'");
				formObj.submit();
				alert("수정이 완료 되었습니다");
			}
		});

		$("#cancel").on("click", function(e) {
			history.back(-1);
		});
	});
</script>

<%--<%@ include file="../includes/footer.jsp" --%>