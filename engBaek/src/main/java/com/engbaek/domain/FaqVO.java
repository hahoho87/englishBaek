package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {	//FAQ 

	private long faqBno; //faq번호
	private String adminId;//관리자ID
	private String faqTitle; //FAQ 제목
	private String faqContent; //FAQ 답변내용
	private Date faqRegdate; //작성일
	
}
