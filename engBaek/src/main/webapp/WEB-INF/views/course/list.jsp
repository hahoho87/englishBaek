<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/course/list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<!-- 검색 키워드와 조건 파라미터 추가 -->
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>

	<!--/ Intro Single star /-->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">강좌 소개</h1>
						<span class="color-text-a">Course Introduce</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">강좌 소개
							</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!--/ Intro Single End /-->

	<!--/ Property Grid Star /-->
	<section class="property-grid grid">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="grid-option">
						<form>
							<select class="custom-select">
								<option value="">ALL</option>
                				<optgroup label="Toeic">
                    				<option value="550">토익-550</option>
                    				<option value="700">토익-700</option>
                    				<option value="850">토익-850</option>
				                </optgroup>
				                <optgroup label="Toeic Speaking">
				                    <option value="5">토스-5</option>
				                    <option value="6">토스-6</option>
				                    <option value="7">토스-7</option>
				                </optgroup>
				            </select>
						</form>
					</div>
				</div>

				<c:forEach items="${courseList}" var="course">
					<div class="col-md-4">
						<div class="card-box-a card-shadow">
							<div class="img-box-a">
								<img src="../../../resources/img/property-1.jpg" alt=""
									class="img-a img-fluid">
							</div>
							<div class="card-overlay">
								<div class="card-overlay-a-content">
									<div class="card-header-a">
										<h2 class="card-title-a">
											<a href="${course.courseCode }" class="move"> ${course.name } <br />${course.courseName }
											</a>
										</h2>
									</div>
									<div class="card-body-a"> 
										<div class="price-box d-flex">
											<span class="price-a"> 개강 | ${course.courseStart}</span>
										</div>
										<a href="${course.courseCode}" class="move link-a">상세보기<span
											class="ion-ios-arrow-forward"></span>
										</a>
									</div>
									<div class="card-footer-a">
										<ul class="card-info d-flex justify-content-around">
											<li>
												<h4 class="card-info-title">유형</h4> <span>${course.courseType }
													<sup></sup>
											</span>
											</li>
											<li>
												<h4 class="card-info-title">레벨</h4> <span>${course.courseLevel }</span>
											</li>
											<li>
												<h4 class="card-info-title">요일</h4> <span>${course.courseDay }</span>
											</li>
											<li>
												<h4 class="card-info-title">시간</h4> <span>${course.courseTime }</span>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
				
				            
            
				<div class='row'>
					<div class="col-lg-6">
						<form id="searchForm" action="/course/list">
							<select name="type">
								<c:set var="type" value="${pageMaker.cri.type }" />
								<!-- 검색 조건이 없을 경우 selected 표시 -->
								<option value="" <c:out value="${type == null?'selected':'' }"/>>검색
									조건 지정</option>
								<!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
								<option value="A" <c:out value="${type == 'A'?'selected':'' }"/>>강좌명</option>
								<option value="B" <c:out value="${type == 'B'?'selected':'' }"/>>강사명</option>
								<option value="AB"
									<c:out value="${type == 'AB'?'selected':'' }"/>>강좌명 + 강사명</option>
							</select> 
							<input type="text" class="form-control form-control-lg form-control-a" name="keyword" value="${pageMaker.cri.keyword }"> 
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<button class="btn btn-default">Search</button>
						</form>
					</div>
					<button id="regBtn" type="button" class="btn btn-xs pull-right">글쓰기</button>
				</div>
				<!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->
		<!-- 페이지 번호 출력 -->
				<div class="pull-left">
					<nav class="pagination-a">
						<ul class="pagination justify-content-end">
							<c:if test="${pageMaker.prev }">
								<!-- previous 버튼 표시 -->
								<li class="paginate_button page-item previous"><a
									class="page-link" href="${pageMaker.startPage - 1 }">
										Previous</a></li>
							</c:if>

							<!-- 페이지 번호 표시 -->
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li
									class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active': '' }"><a
									class="page-link" href="${num }">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<!-- next 버튼 표시 -->
								<li class="paginate_button page-item next"><a
									class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- END 페이지 번호 출력 -->
	</section>
	<!--/ Property Grid End /-->

	<!--/ footer Star /-->
	<section class="section-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-4">
					<div class="widget-a">
						<div class="w-header-a">
							<h3 class="w-title-a text-brand">EstateAgency</h3>
						</div>
						<div class="w-body-a">
							<p class="w-text-a color-text-a">irure.</p>
						</div>
						<div class="w-footer-a">
							<ul class="list-unstyled">
								<li class="color-a"><span class="color-text-a">Phone
										.</span> contact@example.com</li>
								<li class="color-a"><span class="color-text-a">Email
										.</span> +54 356 945234</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-4 section-md-t3">
					<div class="widget-a">
						<div class="w-header-a">
							<h3 class="w-title-a text-brand">The Company</h3>
						</div>
						<div class="w-body-a">
							<div class="w-body-a">
								<ul class="list-unstyled">
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Site Map</a></li>
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Legal</a></li>
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Agent Admin</a></li>
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Careers</a></li>
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Affiliate</a></li>
									<li class="item-list-a"><i class="fa fa-angle-right"></i>
										<a href="#">Privacy Policy</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-4 section-md-t3">
					<div class="widget-a">
						<div class="w-header-a">
							<h3 class="w-title-a text-brand">International sites</h3>
						</div>
						<div class="w-body-a">
							<ul class="list-unstyled">
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">Venezuela</a></li>
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">China</a></li>
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">Hong Kong</a></li>
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">Argentina</a></li>
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">Singapore</a></li>
								<li class="item-list-a"><i class="fa fa-angle-right"></i> <a
									href="#">Philippines</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="nav-footer">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#">Home</a></li>
							<li class="list-inline-item"><a href="#">About</a></li>
							<li class="list-inline-item"><a href="#">Property</a></li>
							<li class="list-inline-item"><a href="#">Blog</a></li>
							<li class="list-inline-item"><a href="#">Contact</a></li>
						</ul>
					</nav>
					<div class="socials-a">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-facebook" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-twitter" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-instagram" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-pinterest-p" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-dribbble" aria-hidden="true"></i>
							</a></li>
						</ul>
					</div>
					<div class="copyright-footer">
						<p class="copyright color-text-a">
							&copy; Copyright <span class="color-a">EstateAgency</span> All
							Rights Reserved.
						</p>
					</div>
					<div class="credits">
						<!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ Footer End /-->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>


	<script>
		$(function() {

			//등록 버튼 처리
			$("#regBtn").on("click", function() {
				self.location = "/course/register";
			});

			//페이지 번호를 클릭하면 해당 페이지 목록 표시
			var actionForm = $("#actionForm");
			$(".paginate_button a").on(
					"click",
					function(e) {
						e.preventDefault(); //a 태그 기본 동작 막기

						//pageNum의 값을 클릭된 a의 href 값으로 변경
						actionForm.find("input[name='pageNum']").val(
								$(this).attr('href'));
						//폼 전송
						actionForm.submit();
					});

			//a 태그의 move 클래스 속성을 이용
			$(".move").on("click", function(e) {
				//a 태그의 기본 동작 막고
				e.preventDefault();

				actionForm.append("<input type='hidden' name='courseCode' value='"
									+ $(this).attr('href') + "'>'");
				actionForm.attr("action", "/course/info");
				actionForm.submit();
			});

			//검색 버튼 이벤트 처리
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색 조건을 선택해 주세요."); //검색 조건 선택 알림
					return false;
				}

				if (!searchForm.find("input[name='keyword']").val()) {
					alert("검색어를 입력해 주세요."); //검색어 입력 알림
					return false;
				}

				//검색 시 페이지 번호는 1이 되도록 처리
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit(); //폼 전송
			});

		});
	</script>


</body>
</html>
