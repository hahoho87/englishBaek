package com.engbaek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	//PwCheckService pwService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public void memberPage() {
		log.info("member page");
	}
	
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public void studentPage(){
		
	}
	
	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
	public void teacherPage(){
		
	}
	
	@RequestMapping(value = "/teacher_n", method = RequestMethod.GET)
	public void teacherNPage(){
		
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void adminPage(){
		log.info("admin page");
	}
	
//	//학생 비밀번호 확인
//	@ResponseBody
//	@RequestMapping(value = "/pwCheckStudent", method = RequestMethod.POST)
//	public String postPwCheckStudent(HttpServletRequest req, RedirectAttributes redirect) throws Exception {	 
//		String studentId = req.getParameter("studentId");
//		String pw = req.getParameter("pw");
//		String result = "redirect:/member/member";
//		
//		log.info("아이디 체크 : " + studentId);
//		
//		if(pwService.pwCheckStudent(studentId, pw) == true) {
//			redirect.addAttribute("studentId", studentId);
//			result = "redirect:/member/pwCheckStudent";
//	}
//		
//		return result;
//	}
	
}
