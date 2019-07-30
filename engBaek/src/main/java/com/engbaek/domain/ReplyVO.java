package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private long cQnaCno; // Q&A 댓글번호
	private long courseCode; // 강좌 코드
	private String teacherId; // 강사 ID
	private String studentId; // 학생 ID
	private String cQnaCcontent; // Q&A 댓글 내용
	private Date cQnaCregdate; // Q&A 댓글 작성일
	private long cQnaBno; // Q&A 게시글 번호
}
