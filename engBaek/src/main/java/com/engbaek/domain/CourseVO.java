package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CourseVO {	//강좌
	
	private long courseCode; // 강좌 코드
	private String teacherId; // 강사 ID
	private long classroomNo; //강의실 번호
	private String courseName; //강좌이름
	private String courseType; //과목구분
	private String courseLevel; //과목단계
	private String coursePictureName;	//사진
	private String coursePictureUuid;	//사진 uuid
	private String curriculumName; //커리큘럼
	private String curriculumUuid; //커리큘럼 uuid
	private String courseInfo; //강좌 소개 내용
	private String courseDay; //강의 요일
	private String courseTime; //강의 시간
	private Date courseStart; //개강일
	private Date courseEnd; //종강일
	
}
