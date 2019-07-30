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
import com.engbaek.domain.PaymentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/payment/*")
@AllArgsConstructor
public class PaymentController {

	// 결제 내역 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}

	// 결제 내역 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 결제 내역 등록
	@PostMapping("/register")
	public String register(PaymentVO payment, RedirectAttributes rttr) {
		return "redirect:/payment/list";

	}

	// 결제 내역 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("payment_bno") Long payment_bno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		return "redirect:/refund/list";
	}

	// 결제 내역 상세 조회 or 수정 화면
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("payment_bno") Long payment_bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// 결제 내역 수정
	@PostMapping("/modify")
	public String modify(PaymentVO payment, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/refund/info";
	}

}
