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
import com.engbaek.domain.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	// 공지사항 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		
	}
	
	// 공지사항 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("noticeNo") Long noticeNo, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// 공지사항 수정
	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/notice/read";
	}
	
	// 공지사항 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("noticeNo") Long noticeNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/notice/list";
	}

	// 공지사항 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 공지사항 등록
	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		return "redirect:/notice/list";

	}
}
