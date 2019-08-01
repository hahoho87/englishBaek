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
import com.engbaek.domain.PrivateQnaReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/privateQnaReply/*")
@AllArgsConstructor
public class PrivateQnaReplyController {
	
	// 일대일 문의 답변 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		
	}

	// 일대일 문의 답변 상세 조회 or 수정
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("privateQnaReplyNo") Long privateQnaReplyNo, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// 일대일 문의 답변 수정
	@PostMapping("/modify")
	public String modify(PrivateQnaReplyVO privateQnaReply, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/privateQnaReply/read";
	}
	
	// 일대일 문의 답변 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("privateQnaReplyNo") Long privateQnaReplyNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/privateQnaReply/list";
	}

	// 일대일 문의 답변 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 일대일 문의 답변 등록
	@PostMapping("/register")
	public String register(PrivateQnaReplyVO privateQnaReply, RedirectAttributes rttr) {
		return "redirect:/privateQnaReply/list";

	}
}
