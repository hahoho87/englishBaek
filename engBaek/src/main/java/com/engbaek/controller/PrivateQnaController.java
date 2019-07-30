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
import com.engbaek.domain.PrivateQnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/privateQna/*")
@AllArgsConstructor
public class PrivateQnaController {
	
	// 일대일 문의 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}

	// 일대일 문의 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("bno") Long privateQna_bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// 일대일 문의 수정
	@PostMapping("/modify")
	public String modify(PrivateQnaVO privateQna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/privateQna/read";
	}

	// 일대일 문의 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("privateQna_bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/privateQna/list";
	}

	// 일대일 문의 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 일대일 문의 등록
	@PostMapping("/register")
	public String register(PrivateQnaVO privateQna, RedirectAttributes rttr) {
		return "redirect:/privateQna/list";

	}
}
