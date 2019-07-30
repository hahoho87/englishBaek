package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PrivateQnaVO {	//일대일문의
	
	private long pQnaBno; //일대일문의 번호
	private String studentId; //학생ID
	private String pQnaRitle; //일대일문의 제목
	private String pQnaContent; //일대일문의 내용
	private Date pQnaRegdate; // 일대일문의 작성일 
}
