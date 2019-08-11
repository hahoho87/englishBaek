<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <!-- DataTables Advanced Tables -->
                Board Register
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
				<!-- 게시물 등록 폼 -->	
				<form role="form" method="post" action="/review/register">
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="reviewTitle">
					</div>
			
					<!-- 강의명 -->
					<label for="CourseId"> 강의명</label>
					<select  class="form-control" name="courseCode">
						<option value="1">미친토익</option>
						<option value="2">돌아버린 토익</option>
						<option value="3">미친토스</option>
					</select>
					
					
					
					<!-- 강사명 -->
					<label for="teacherId">강사명</label>
					<select id="course" class="form-control" name="teacherId" >
						<option value="tc1">김하나</option>
						<option value="tc2">김두나</option>
						<option value="tc3">김세나</option>
					</select>
					
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" name="reviewContent"></textarea>
					</div>			
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="studentId">
					</div>	
					<button type="submit" class="btn btn-default">
						Submit</button>
					<button type="reset" class="btn btn-default">
						Reset</button>
				</form>
				<!-- END 게시물 등록 폼 -->			
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-6 -->
</div>
<!-- /.row -->

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

 <script>
 
 $(function(){
	 
	$("#regBtn").on("click",function(){
		
		self.location="/review/register";
	});
	 
 });

 </script>