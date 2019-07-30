package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PrivateQnaReplyVO { //일대일 답글
	
	private long pQnaCno; //일대일 문의 답글 번호
	private long pQnaBno; //일대일 문의 번호
	private String studentId; //학생ID
	private String adminId; //관리자 ID
	private String pQnaCtitle; //일대일 문의 답글 제목
	private String pQnaCcontent; //일대일 문의 답글 내용
	private Date pQnaCregdate; //일대일 문의 답글 작성일 
	
}
