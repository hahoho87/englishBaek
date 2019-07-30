package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/classroom/*")
@AllArgsConstructor
public class ClassroomController {
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("classroom_bno") Long classroom_bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	//TODO BoardVO 변경
	@PostMapping("/modify")
	public String modify(ClassroomVO classroom, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + classroom);
		return "redirect:/notice/read";
	}
}
