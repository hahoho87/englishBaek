<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!--/ News Single Star /-->
  <section class="news-single nav-arrow-b">
    <div class="container">
      <div class="row"> 
        <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1">
          <div class="title-box-d">
            <br><br><br><h3 class="title-d"></h3>
          </div>
          <div class="form-comments">
            <div class="title-box-d">
              <h3 class="title-d"> 강좌 등록</h3>
            </div>
            <form class="form-a" method="post" action="/course/register">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseName">강좌명</label>
                    <input type="text" name="courseName" class="form-control form-control-lg form-control-a" id="inputCourseName" placeholder="강좌명 *"
                      required>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">강의실</label>
                    <input type="text" name="classroomNo" class="form-control form-control-lg form-control-a" id="inputClassroom"
                      placeholder="강의실 *" >
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseType">유형</label>
                <select class="form-control form-control-lg form-control-a" id="first" name="courseType" id="selOne" onchange="doChange(this, 'selTwo')">
        			<option value="default">Type</option>
        			<option value="토익">토익</option>
        			<option value="토스">토스</option>
    			</select>
                  </div>
                </div> 
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">레벨</label>
                  	<select name="courseLevel" class="form-control form-control-lg form-control-a" id="selTwo">
        			<option value="default">Level</option>
    			</select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                     <label for="teacherId">강사 id</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="teacherId" placeholder="id" name="teacherId">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <br><button type="button" id="teacherIdInput" class="idCheck btn btn-a">id check</button>
                    <p class="result">
					<span class="msg"></span>
				  </p>
                  </div>
                  
                </div>
                
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">강좌 정보</label>
                    <textarea id="infoInput" class="form-control" placeholder="강좌 정보 *" name="courseInfo" cols="45"
                      rows="8" required></textarea>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="priceInput">가격</label>
                    <input type="number" class="form-control form-control-lg form-control-a" id="priceInput" placeholder="price" name="price" min="100000" step="10000" >
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="courseTimeInput">시간</label>
                    <select class="form-control form-control-lg form-control-a" id="courseTimeInput" name="courseTime">
	        			<option value="default">Time</option>
	        			<option value="10:00 - 12:00">10:00 - 12:00</option>
	        			<option value="12:00 - 14:00">12:00 - 14:00</option>
	        			<option value="14:00 - 16:00">14:00 - 16:00</option>
	        			<option value="16:00 - 18:00">16:00 - 18:00</option>
	        			<option value="18:00 - 20:00">18:00 - 20:00</option>
	        			<option value="20:00 - 22:00">20:00 - 22:00</option>
    				</select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="startdayInput">개강일</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="startdayInput" name="courseStart" >
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="enddayInput">종강일</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="enddayInput" name="courseEnd" >
                  </div>
                </div>
                <div class="col-md-6 mb-3 icheck-primary">
				   <div class="form-group">
                   	 <label for="startdayInput">요일</label><br>
                     <input type="checkbox" class="form-check-input" id="mon" name="courseDay" value="월">
                     <label for="mon" class="">월요일  </label> <br>     
                     <input type="checkbox" class="form-check-input" id="tue" name="courseDay" value="화">
                     <label for="tue" class="">화요일  </label> <br>
                     <input type="checkbox" class="form-check-input" id="wed" name="courseDay" value="수">
                     <label for="wed" class="">수요일  </label> <br>
                     <input type="checkbox" class="form-check-input" id="thu" name="courseDay" value="목">
                     <label for="thu" class="">목요일  </label> <br>
                     <input type="checkbox" class="form-check-input" id="fri" name="courseDay" value="금">
                     <label for="fri" class="">금요일  </label> <br>
                     <input type="checkbox" class="form-check-input" id="sat" name="courseDay" value="토">
                     <label for="tue" class="">토요일  </label> <br>
                     <input type="checkbox" class="form-check-input" id="sun" name="courseDay" value="일">
                     <label for="sun" class="">일요일   </label> <br>
                          
                   </div>
                </div>
                <div class="col-md-12">
                  <button type="submit" class="btn btn-a">Submit</button>
                  <button type="reset" class="btn btn-a">Reset</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ News Single End /-->
  
<script> 
//상위 셀렉트로 하위 셀렉트 제어하기
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    if(val == '토익'){
        addOption('550', targetE);
        addOption('700', targetE);
        addOption('850', targetE);
    }
    else if(val == '토스'){
        addOption('5', targetE);
        addOption('6', targetE);
        addOption('7', targetE);
    }
}

function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
} // End select


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
}); // End id check
</script>

	
<%@ include file="../includes/footer.jsp"%>