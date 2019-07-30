package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TeacherVO {

	private String teacher_id;
	private String name;
	private String pw; 
	private Date birthday;
	private String email;
	private String email2;
	private String phone;
	private String gender;
	private String address;
	private Date regdate;
	private String career;
	private String education;
	private char auth_no; 
	
}
