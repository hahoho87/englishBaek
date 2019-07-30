package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RefundInfoVO { //환불규정
	
	private long bno; //게시글 번호
	private String admminId; //관리자ID
	private String refundIcontent; //환불규정 내용 
	
}
