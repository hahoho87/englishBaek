<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/sidebar.jsp"%>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">수업자료 및 공지</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/class/list?courseCode=" ${classDataList.courseCode }>수업자료 및 공지</a>
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
            <form role="form" class="form-a" method="post" action="/class/register/">
              <input type="hidden" name="courseCode" value="${param.courseCode}">
              <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="noticeNo">작성자</label>
                    <input type="text" name="teacherId" class="form-control form-control-lg form-control-a" id="teacherId" value="<sec:authentication property="principal.username"/>" readonly="readonly">
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="noticeTitle">제목</label>
                    <input type="text" name="classDataTitle" class="form-control form-control-lg form-control-a" id="classDataTitle" placeholder="제목 *" required>
                  </div>
                </div>

                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">내용</label>
                    <textarea id="classDataContent" class="form-control" placeholder="내용 *" name="classDataContent" cols="45" rows="8"></textarea>
                  </div>
                </div>
              </div>
              <button type="submit" data-oper="register" class="btn btn-a">Register</button>
              <!-- 등록 처리 -->
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
		$("#registerBtn").on("click", function(e) {
			e.preventDefault();
			var classQnaTitle = $("input[name='classDataTitle']").val();
			var classQnaContent = $("textarea[name='classDataContent']").val();
			if (classQnaTitle == "") {
				alert("제목을 입력해주세요");
				return false;
			} else if (classQnaContent == "") {
				alert("내용을 입력해주세요");
				return false;
			} else {
				formObj.submit();
				alert("등록이 완료 되었습니다");
			}
		});

		$("#cancel").on("click", function(e) {
			self.location = "/class/list?courseCode=" + $
			{
				param.courseCode
			};
		});
	});
</script>
<%--<%@ include file="../includes/footer.jsp" --%>