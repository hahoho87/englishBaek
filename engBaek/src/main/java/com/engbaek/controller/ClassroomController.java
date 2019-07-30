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
	
	//강의실 목록
	@GetMapping( "/list" )
	public void get(@RequestParam("classroom_num") Long classroom_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("classroom number : " + classroom_num);
	}

}
