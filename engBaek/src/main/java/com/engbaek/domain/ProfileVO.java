package com.engbaek.domain;

import lombok.Data;

@Data
public class ProfileVO { //강사소개
	
	private long teacherPno; //강사소개 코드
	private String teacherId; //강사ID
	private String teacherSubject; //담당과목
	private String teacherProfile; //강사 소개내용
	private String teacherProfilePicture; //강사소개 사진
	private String teacherProfileUuid; //강사소개 사진 uuid
	
	private TeacherVO teacherVO;
}
