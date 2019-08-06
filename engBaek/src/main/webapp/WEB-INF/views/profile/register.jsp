<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../../../resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="../../../resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link
	href="../../../resources/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link href="../../../resources/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="../../../resources/css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="panel-body">
		<!-- 게시물 등록 폼 -->
		<form role="form" method="post" action="/profile/register">
			<div class="form-group">
				<label>강사 ID</label> 
				<input id="teacherId" class="form-control" name="teacherId">
				<button type="button" id="idCheck" class="idCheck">id check</button>
				<p class="result"><span class="msg"></span></p>
			</div>
			<div class="form-group">
				<label>과목</label> 
				<input type="checkbox" name="teacherSubject"
					value="toeic 550">Toeic 550 
				<input type="checkbox" name="teacherSubject" 
					value="toeic 700">Toeic 700 
				<input type="checkbox" name="teacherSubject" 
					value="toeic 850">Toeic 850 <br> 
				<input type="checkbox" name="teacherSubject"
					value="toeic speacking 5">Toeic Speaking 5 
				<input type="checkbox" name="teacherSubject" 
					value="toeic speacking 6">Toeic Speaking 6 
				<input type="checkbox" name="teacherSubject"
					value="toeic speacking 7">Toeic Speaking 7
			</div>
			<div class="form-group">
				<label>강사 소개</label> 
				<input class="form-control" name="teacherProfile" />
			</div>
			<div class="form-group">
				<label>강사 사진</label> 
				<input class="form-control" name="teacherProfilePicture" />
			</div>
			<div class="form-group">
				<label>강사 uuid</label> 
				<input class="form-control" name="teacherProfileUuid" />
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

	<script type="text/javascript">
		//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
		$(".idCheck").click(function() {

			var query = {
				teacherId : $("#teacherId").val()
			};
			
			var teacherId = $("#teacherId").val()
			
			$.ajax({
				url : "/profile/idCheck",
				type : "post",
				data : { teacherId : teacherId },
				dataType : "json",
				success : function(data) {
					if ($.trim(data) == 0) {
				 		$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");
					} else {
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");
					}
				}
			}); // ajax 끝
		});
	</script>

</body>
</html>