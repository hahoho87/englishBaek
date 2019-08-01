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
		<!-- 게시물 등록 폼 -->
		<form role="form" method="post" action="/faq/modify">
			<input type="hidden">
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="faqTitle">
			</div>
			<div class="form-group">
				<label>Text area</label>
				<textarea rows="3" class="form-control" name="faqContent"></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input class="form-control" name="adminId" readonly="readonly"/>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
			<button type="reset" class="btn btn-default">Reset</button>
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
</body>
</html>