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
import com.engbaek.domain.FaqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class FAQController {
	
	// FAQ 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}

	// FAQ 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// FAQ 수정
	@PostMapping("/modify")
	public String modify(FaqVO faq, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/faq/read";
	}

	// FAQ 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/faq/list";
	}

	// FAQ 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// FAQ 등록
	@PostMapping("/register")
	public String register(FaqVO faq, RedirectAttributes rttr) {
		return "redirect:/faq/list";

	}
}
