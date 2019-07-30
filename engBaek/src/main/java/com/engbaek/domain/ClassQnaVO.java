package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassQnaVO {	//q&a게시판
	
	private long classQnaBno;	//q&a 게시글 번호
	private long courseCode;	//강좌 코드
	private String studentId;	//학생id
	private String teacherIid;	//강사id
	private String cQnaTitle; //q&a제목
	private String cQnaContent; //q&a내용
	private Date cQnaRegdate;	//q&a 작성일
		
}
