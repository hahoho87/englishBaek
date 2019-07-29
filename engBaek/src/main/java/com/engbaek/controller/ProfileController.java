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
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class ProfileController {

	
	//목록 가져오기 
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}
	
	//등록 화면만 가져오기 
	@GetMapping("/register")
	public void register() {

	}

	//등록을 찐으로 등록 
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		return "redirect:/profile/list";

	}
	
	//삭제 
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/profile/list";
	}
	
	
	
	//상세 조회 
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
	}

	// TODO BoardVO 수정
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/profile/info";
	}
	
	
}
