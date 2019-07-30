package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {

	private long faq_bno;
	private String admin_id;
	private String faq_title;
	private String faq_content;
	private Date notice_regdate;
	
}
