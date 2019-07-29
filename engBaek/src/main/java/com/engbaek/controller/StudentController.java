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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/student/*")
@Log4j
@AllArgsConstructor
public class StudentController {
	
	@GetMapping("/signup")
	public void getSignup() {
		
	}
	
	@PostMapping("/signup")
	public String postSignup(RedirectAttributes rttr) {
		return "redirect:/";
	}
	
	@GetMapping({"/info", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {

	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		return "redirect:/student/info";
	}
	
	@PostMapping("/delete")
	public String remove(BoardVO board, RedirectAttributes rttr) {
		return "redirect:/";
	}
	
	@GetMapping("/class_list")
	public void classList(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
	}
}
