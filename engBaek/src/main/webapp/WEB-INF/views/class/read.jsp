<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ include file="../includes/header.jsp" %>
<%@ include file="../about/sidebar.jsp" %>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">수업자료 및 공지</h1>
          <span class="color-text-a">Notice</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/class/list/">수업자료 및 공지</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->


<!-- Page Content -->
<form role="form" class="form-a classDataForm" method="post" action="/notice/modify/">
  <input type="hidden" id="classDataNo" name="classDataNo" value="${classData.classDataNo}">
  <input type="hidden" id="courseCode" name="courseCode" value="${classData.courseCode}">
<%--   <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
  <input type="hidden" name="noticeTitle" value="${notice.noticeTitle }">
  <input type="hidden" name="adminId" value="${notice.adminId }">
  <input type="hidden" name="noticeContent" value="${notice.noticeContent }"> --%>
  <div class="container">
    <div class="row">
      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Title -->
        <h3 class="mt-3">${classData.classDataTitle}</h3>
        <!-- Author -->
        <p class="lead">
          by <a href="#">${classData.name}</a>
        </p>
        <hr>
        <!-- Date/Time -->
        <p>
          <fmt:formatDate value="${classData.classDataRegdate}" pattern="yyyy-MM-dd a HH:mm " />
        </p>
        <hr>
        <!-- Post Content -->
        <div style="height: 200px">
          <p class="lead">${classData.classDataContent}</p>
        </div>
        <hr>
      </div>
    </div>
    <button type="submit" data-oper="modify" class="btn btn-a">Modify</button>
    <!-- 수정 처리 -->
    <button type="submit" data-oper="remove" class="btn btn-a">Remove</button>
    <!-- 삭제 처리 -->
    <button data-oper='list' class="btn btn-a">List</button>
    <!-- 목록 페이지 이동 -->
  </div>
</form>
<!-- End Page Content -->

<%-- <br>
<div>
<label>제목 : </label>           
<input name="classDataTitle" readonly = "readonly" value="${classData.classDataTitle}">
</div>

<div>
<label>작성자 : </label>
<input name="name" readonly = "readonly" value="${classData.name}">
<label>작성일 : </label>
<fmt:formatDate value="${classData.classDataRegdate}" pattern="yyyy-MM-dd"/>
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classDataContent" readonly = "readonly">${classData.classDataContent}</textarea>

<button type = "submit" id="updateBtn">수정</button>
<button id="deleteBtn">삭제</button>
<button id="listBtn">목록</button>

<br> --%>

<script>
  $(function() {
    var formObj = $(".classDataForm");

    $('button').on("click", function(e) {
      e.preventDefault();

      var operation = $(this).data("oper");
      console.log("operation : " + operation);

      if (operation === 'remove') { //삭제 버튼이 눌린 경우 
        var deleteConfirm = confirm("정말 삭제하시겠습니까?")
        if (deleteConfirm == true) {
          alert("삭제가 완료되었습니다.")
          formObj.attr("action", "/class/remove");
        } else {
          return;
        }

      } else if (operation === 'list') { //목록 버튼이 눌린 경우
        //        self.location = "/notice/list"; 
        //        return;

        //페이지 번호와 게시물 개수 복사
        var pageNumTag = $("input[name='pageNum']").clone();
        var amountTag = $("input[name='amount']").clone();

        //검색 조건과 키워드 복사
        var typeTag = $("input[name='type']").clone();
        var keywordTag = $("input[name='keyword']").clone();

        formObj.attr("action", "/class/list").attr("method", "get");
        formObj.empty(); //폼 태그 모든 내용을 지움

        //페이지 번호와 게시물 개수만 폼에 추가
        formObj.append(pageNumTag);
        formObj.append(amountTag);

        //검색 조건과 키워드 폼에 추가 
        formObj.append(typeTag);
        formObj.append(keywordTag);

      } else {
        formObj.attr("action", "/class/modify").attr("method", "get");
      }

      formObj.submit();
    });
  });
</script>
<!-- 
<script type="text/javascript">

$(function(){
	var classDataNo = "${classData.classDataNo}"; //게시글 번호 
	var classDataForm = $("#classDataForm");
	
	   $("#listBtn").on("click", function(e){
		   classDataForm.find("#classDataNo").remove();
		   classDataForm.attr("action", "/class/list");
		   classDataForm.submit();
	   });
	   
	   $("#updateBtn").on("click",function(e){
		   classDataForm.attr("action","/class/modify").submit();
	   });
	   
	   $("#deleteBtn").on("click",function(){
		   classDataForm.attr("action","/class/remove");
		   classDataForm.attr("method","post");
		   classDataForm.submit();
		  alert("삭제가 완료되었습니다.");
	   });   
	   
	 });
</script> -->
<%@ include file = "../includes/footer.jsp" %>