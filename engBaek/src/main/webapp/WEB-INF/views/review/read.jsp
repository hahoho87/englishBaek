<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
        	Board Register
        	Board Read Page</h1>
    </div>  /.col-lg-12
</div>		/.row

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                DataTables Advanced Tables
                Board Register
                Board Read Page
            </div>
            /.panel-heading
            <div class="panel-body">
				 게시물 등록 폼 	-->
			<form id="operForm" action="/review/read">
				<div>
					<label>reviewNo</label>
						<input class="form-control" name="reviewNo" id="reviewNo"
						 readonly="readonly" value="${review.reviewNo}"></div>
					<div>
						<label>Title</label>
						<input class="form-control" name="reviewTitle"
							   readonly="readonly"  value="${review.reviewTitle}"></div>
					<div class="form-group">
						<label>강의명</label>
						<input class="form-control" 
								  name="coursecode" 
								  readonly="readonly" value="${review.courseCode}"></div>
					<div>				
						<label>강사명</label>
						<input class="form-control" 
								  name="teacherId" 
								  readonly="readonly" value="${review.teacherId}"></div>			   	
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" 
								  name="reviewContent" 
								  readonly="readonly">${review.reviewContent}</textarea></div>			
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="studentId"
							   readonly="readonly"  value="${review.studentId}"></div>	
							   
							   </form>	
					<button  type="submit" data-oper="modify" class="btn btn-default">
						Modify</button>	<!-- 수정 페이지 이동 -->
					<button data-oper="remove" class="btn btn-danger">
						Remove</button>	<!-- 삭제 처리 -->
					<button data-oper="list" class="btn btn-info">
						List</button>	<!-- 목록 페이지 이동 -->		   
						
						<!-- 폼 태그 추가 -->
					<form id="operForm2" action="/review/modify">
						<input type="hidden" id="reviewNo" 
							   name="bno" value="${review.reviewNo }">
						<!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
						<input type="hidden"  
							   name="pageNum" value="${cri.pageNum }">
						<input type="hidden"  
							   name="amount" value="${cri.amount }">	
						<!-- 검색 조건과 키워드 파라미터 추가 -->   
						<input type="hidden"  
							   name="type" value="${cri.type }">
						<input type="hidden"  
							   name="keyword" value="${cri.keyword }">
					</form>
				<!-- </form> -->
<!-- 				
						
						
            </div>	/.panel-body
        </div>      /.panel
    </div>   		/.col-lg-6
</div>				/.row -->


<script>
$(function(){
	 
	 var  operForm = $("#operForm");
	 
	 //수정 버튼 이벤트 처리 
	 $("button[data-oper='modify']").on("click",function(e){
		 operForm.attr("action","/review/modify").submit();
		 
	 });
	 //목록 버튼 이벤트 처리 
	 $("button[data-oper='list']").on("click",function(e){
		 
		 operForm.find("reviewNo").remove();
		 operForm.attr("action","/review/list");
		 
			//페이지 번호와 게시물 개수 복사
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			//검색 조건과 키워드 복사
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();

			operForm.attr("action", "/review/list")
				   .attr("method", "get");
			operForm.empty();	//폼 태그 모든 내용을 지움
			
			//페이지 번호와 게시물 개수만 폼에 추가
			operForm.append(pageNumTag);
			operForm.append(amountTag);
			
			//검색 조건과 키워드 폼에 추가 
			operForm.append(typeTag);
			operForm.append(keywordTag);
		 
		 operForm.submit();
	
	 });
	 
	 $("button[data-oper='remove']").on("click",function(e){
		 var deletcheck=confirm("삭제 하시겠습니까?")
		 if(deletcheck==true){
		 alert("삭제가 완료되었습니다.");
		 operForm.attr("action","/review/remove").attr("method","post");
		 operForm.submit();
		 }else{
			 return;
		 }
		
	 });
	 
});

 </script>
 