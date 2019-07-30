package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private long notice_bno; 
	private String admin_id;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	
}
