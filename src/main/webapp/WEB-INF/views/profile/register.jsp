<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
	.fileDrop {
		width: 600px;
		height: 70px;
		border: 2px dotted gray;
		background-color: gray;
	}
</style>
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
				<p class="result">
					<span class="msg"></span>
				</p>
			</div>
			<div class="form-group">
				<label>과목</label> <input type="checkbox" name="teacherSubject" value="toeic 550">Toeic 550 <input type="checkbox" name="teacherSubject" value="toeic 700">Toeic 700 <input type="checkbox" name="teacherSubject" value="toeic 850">Toeic 850 <br> <input type="checkbox" name="teacherSubject" value="toeic speacking 5">Toeic Speaking 5 <input type="checkbox" name="teacherSubject" value="toeic speacking 6">Toeic Speaking 6 <input type="checkbox" name="teacherSubject" value="toeic speacking 7">Toeic Speaking 7
			</div>
			<div class="form-group">
				<label>강사 소개</label> <input class="form-control" name="teacherProfile" />
			</div>
			<div class="form-group">
				<label for="gdsImg">이미지</label> <input type="file" id="gdsImg" />
				<div class="select_img">
					<img src="" />
				</div>
			</div>
			
			<div>
				<!-- 첨부파일 등록 영역 --> 
				<div class="fileDrop"></div>
				<!-- 첨부파일 목록 출력 영 -->
				<div id="uploadList"></div>
			</div>
<!-- 			<div class="form-group">
				<label>강사 uuid</label> <input class="form-control" name="teacherProfileUuid" />
			</div> -->
			<button type="submit" class="btn btn-default">Submit</button>
			<button type="reset" class="btn btn-default">Reset</button>
		</form>
		<!-- END 게시물 등록 폼 -->
		
		<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">FILE ATTACH</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<div class='uploadDiv'>
						<input type="file" name="uploadFile" multiple>
					</div>

					<!-- 섬네일 이미지 원본 표시 -->
					<div class="bigPictureWrapper">
						<div class="bigPicture"></div>
					</div>
					<!-- END 섬네일 이미지 원본 표시 -->

					<!-- 업로드 결과 출력 -->
					<div class="uploadResult">
						<ul>
						</ul>
					</div>
					<!-- END 업로드 결과 출력 -->
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
		

<!-- /.row -->
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
				data : {
					teacherId : teacherId
				},
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

		//선택 파일 출력
		$("#gdsImg").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".select_img img").attr("src",data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
	</script>
	
	<script>
	/*
		// 이미지 파일 여부 판단
		function checkImageType(fileName){
			var pattern = /jpg|png|jpeg/i;
			return fileName.match(pattern);
		}
		
		// 업로드 파일 정보 
		function getFileInfo(fullName){
			var fileName, imgsrc, getLink, fileLink;
			
			if(checkImageType(fullNmae)){ //이미지 파일일 경우
				// 이비지 파일 경로(썸네일)
				imgsrc = "/spring02/upload/displayFile?fileName="+fullName;
				console.log(imgsrc);
				// 업로드 파일명
				fileLink = fullName.substr(14);
				console.log(fileLink);
				//날짜별 디렉토리 추출
				var front = fullName.substr(0, 12);
				console.log(front);
				// s_를 제거한 업로드 이미지 파일명
				var end = fullName.substr(14);
				console.log(end);
				// 원본 이미지 파일 디렉토리
				getLink = "/spring02/uplaod/displayFile?fileName="+front+end;
				console.log(getLink);
			
			} else { //이미지 파일이 아닐 경우
				// UUID를 제외한 원본 파일명
				fileLink = fullName.substr(12);
				console.log(fileLink);
				// File directory
				getLink = "/spring02/upload/displayFile?fileName="+fullName;
				console.log(getLink);
			}
			// 목록에 출력할 원본 파일명
			fileName = fileLink.substr(fileLink.indexOf("_")+1);
			console.log(fileName);
			// Json 객채 return
			return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
		}
		
		
		$(document).ready(function(){
			$(".fileDrop").on("dragenter dragover", function(e){
				e.preventDefault();
			});
			//drag & drop 한 파일들 ajax 업로드 요청
			$(".fileDrop").on("drop", function(e){
				e.preventDefault();
				
				var files = e.originalEvent.dataTransfer.files;
				var file = files[0];
				var formData = new FromData();
				formData.append("file", file); //첨부파일 추가
				
				$.ajax({
					url: "${path}/upload/uploadAjax",
					data: formData,
					dataType: "text",
					processData: false,
					contentType: false,
					success: function(data){
						console.log(data);
						var fileInfo = getFileInfo(data);
						var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
						html += "<input type='hidden' class=file' value'"+fileInfo.fullName+"'>";
						//div에 추가
						$("#uploadedList").append(html);
					}
				});
			});
		});
	*/
	</script>
	<script>
$(document).ready(function(e) {
		
		var formObj = $("form[role='form']");
		
		//Submit Button Event
		$("button[type='submit']").on("click", function(e) {
			//Submit Button 기본 동작 막기
			e.preventDefault();
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' " + 
					   		  "name='attachList["+i+"].fileName' " + 
					   		  "value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' " + 
					   		  "name='attachList["+i+"].uuid' " + 
					   		  "value='"+jobj.data("uuid")+"'>";	   
				str += "<input type='hidden' " + 
					   		  "name='attachList["+i+"].uploadPath' " + 
					   		  "value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' " + 
					   		  "name='attachList["+i+"].fileType' " + 
					   		  "value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit();
			
		});
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //확장자 제한 정규표현식
		var maxSize = 5242880; //파일 최대 업로드 크기 제한 5MB
	
		function checkExension(fileName, fileSize){
			if(fileSize >= maxSize) {	//파일 크기 확인
				alert("파일 사이즈 초과!");	//크기를 초과하면 알림 메시지 출력
				return false;
			}
			if(regex.test(fileName)) {	//확장자 확인
				alert("업로드 불가 파일");	//제한 확장자인 경우 알림 메시지 출력
				return false
			}
			return true;	//파일 크기 및 확장자 문제가 없는 경우
		}//END checkExension()
		
		//첨부파일 상태 변경 이벤트 핸들러 등록
		$("input[type='file']").change(function(e){
			var formData = new FormData();	//가상의 <form> 태그
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i=0 ; i<files.length ; i++){
				//확장자 및 파일 크기 확인
				if(!checkExension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				type : 'post',
				url :'/images/uploadAjaxAction',
				data : formData,
				dataType : 'json',
				contentType : false,
				processData : false,
				success : function(result){
					console.log(result);	//콘솔로 결과 확인
					
					showUploadResult(result); //업로드 결과 처리 함수
					
				}
			})//END .ajax()
			
			//업로드 결과 출력 처리
			
			function showUploadResult(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length == 0) {return;}
				
				var uploadUL = $('.uploadResult ul');
				var str = "";
				$(uploadResultArr).each(function(i, obj){
					//업로드 파일명 <li>추가
					if(obj.image){	//이미지인 경우
						//섬네일 파일명 인코딩 처리
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid  + "_" + obj.fileName);
						//원본 이미지 경로 및 파일명
						var originPath = obj.uploadPath + "\\" + obj.uuid  + "_" + obj.fileName;
						// 경로 구분자 \를 /로 변경
						originPath = originPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
						str += "><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
						str += "<i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName=" + fileCallPath + "'>";
						str += "</div></li>"
						
					} else {		//이미지가 아니면 다운로드 링크 작성
						
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid  + "_" +
								 obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li ";
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div></li>";
					}
				});
				
				uploadUL.append(str);
			}//END showUploadResult()
			
			//X버튼 클릭 이벤트
			$(".uploadResult").on("click", "button", function(e){
				console.log("delete file");
				
				var targetFile 	= $(this).data("file");
				var type		= $(this).data("type");
				var targetLi 	= $(this).closest("li");
				
				$.ajax({
					url :'/images/deleteFile',
					data : {fileName:targetFile, type:type} ,
					dataType : 'text',
					type : 'POST',
					success : function(result){
						alert(result);
						targetLi.remove();
					}
				})//$.ajax
			})// X button Event
			
		});//END change function
	
	})//END $
	</script>



</body>
</html>