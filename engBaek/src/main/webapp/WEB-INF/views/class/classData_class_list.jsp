<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/sidebar.jsp"%>

<!--/ Intro Single star /-->
<section class="intro-single">
  <%--  <jsp:include page="sidebar.jsp"></jsp:include> --%>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">강의중인 강좌</h1>
          <span class="color-text-a">My lecture list</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/class/classData_class_list">강의중인 강좌</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ About Star /-->
<section class="section-about">
  <div class="container">
    <div class="row">
      <table class="table table-striped table-hover">
        <!-- 목록 출력 -->
        <thead>
          <tr>
            <th>No.</th>
            <th>강좌명</th>
            <th>강사명</th>
            <th>개강일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${classDataClassList}" var="classData">
            <tr>
              <td>${classData.rownum}</td>
              <td><a class="move" href="${classData.courseCode}"> ${classData.courseName}</a></td>
              <td>${classData.name}</td>
              <td>${classData.courseStart}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
      <div class='row'>
        <div class="col-lg-12">
          <form id="searchForm" action="/notice/list">
            <select name="type">
              <c:set var="type" value="${pageMaker.cri.type }" />
              <!-- 검색 조건이 없을 경우 selected 표시 -->
              <option value="" <c:out value="${type == null?'selected':'' }"/>>검색 조건 지정</option>
              <!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
              <option value="T" <c:out value="${type == 'T'?'selected':'' }"/>>제목</option>
              <option value="C" <c:out value="${type == 'C'?'selected':'' }"/>>내용</option>
              <option value="TC" <c:out value="${type == 'TC'?'selected':'' }"/>>제목 + 내용</option>
            </select>
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <button class="btn btn-b btn-search">Search</button>
          </form>
        </div>
      </div>
      <!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->

      <!-- 페이지 번호 출력 -->
      <div class="col-xs-4 col-md-12 pull-right">
        <nav class="pagination-a">
          <ul class="pagination justify-content-end">
            <c:if test="${pageMaker.prev }">
              <!-- previous 버튼 표시 -->
              <li class="paginate_button page-item previous">
                <a class="page-link" href="${pageMaker.startPage - 1 }"> Previous</a>
              </li>
            </c:if>

            <!-- 페이지 번호 표시 -->
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
              <li class="paginate_button page-item  ${pageMaker.cri.pageNum == num ? 'active': '' }">
                <a class="page-link" href="${num }">${num }</a>
              </li>
            </c:forEach>

            <c:if test="${pageMaker.next }">
              <!-- next 버튼 표시 -->
              <li class="paginate_button page-item next">
                <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
              </li>
            </c:if>
          </ul>
        </nav>
        <button id="regBtn" type="button" class="btn btn-a pull-right">글쓰기</button>
      </div>
      <!-- END 페이지 번호 출력 -->
    </div>
  </div>
</section>
<!--/ About End /-->
<!--/ Intro Single End /-->

<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/class/list">
<%--   
  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
  <!-- 검색 키워드와 조건 파라미터 추가 -->
  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
  <input type="hidden" name="type" value="${pageMaker.cri.type }"> 
  --%>
  
</form>

<script>
	$(function() {

		var actionForm = $("#actionForm");

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='courseCode' value='" + $(this).attr('href') + "'>'");
			actionForm.attr("action", "/class/list").submit();
		});
	});
</script>