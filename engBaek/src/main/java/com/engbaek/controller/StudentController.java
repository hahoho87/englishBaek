package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.StudentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/student/*")
@Log4j
@AllArgsConstructor
public class StudentController {
	
	// 학생 회원 가입 화면
	@GetMapping("/signup")
	public void getSignup() {
		
	}
	
	// 학생 회원 가입
	@PostMapping("/signup")
	public String postSignup(StudentVO student, RedirectAttributes rttr) {
		return "redirect:/";
	}
	
	// 학생 정보 조회 or 수정 화면
	@GetMapping({"/info", "/modify"})
	public void get(@RequestParam("student_id") Long student_id, Model model) {

	}
	
	// 학생 정보 수정
	@PostMapping("/modify")
	public String modify(StudentVO student, RedirectAttributes rttr) {
		return "redirect:/student/info";
	}
	
	// 학생 회원 탈퇴
	@PostMapping("/delete")
	public String remove(StudentVO student, RedirectAttributes rttr) {
		return "redirect:/";
	}
	
	// 수강중인 강의 목록
	@GetMapping("/class_list")
	public void classList(@RequestParam("student_id") Long student_id, @ModelAttribute("cri") Criteria cri, Model model) {
		
	}
}
