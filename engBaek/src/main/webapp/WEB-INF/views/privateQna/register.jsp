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
				<form role="form" method="post" action="/privateQna/register">
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="privateQnaTitle">
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" name="privateQnaContent"></textarea>
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
 <script>
 
 $(function(){
	 
	$("#regBtn").on("click",function(){
		
		self.location="/privateQna/register";
	});
	 
 });

 </script>