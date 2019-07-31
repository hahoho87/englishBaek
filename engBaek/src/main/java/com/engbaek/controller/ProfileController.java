package com.engbaek.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;
import com.engbaek.domain.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class ProfileController {

	
	// 강사 소개 목록 
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}
	
	// 강사 소개 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 강사 소개 등록
	@PostMapping("/register")
	public String register(ProfileVO profile, RedirectAttributes rttr) {
		return "redirect:/profile/list";

	}
	
	// 강사 소개 삭제 
	@PostMapping("/remove")
	public String remove(@RequestParam("profile_bno") Long profile_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/profile/list";
	}
	
	// 강사 소개 상세 조회 or 수정 화면
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("profile_bno") Long profile_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
	}

	// 강사 소개 수정
	@PostMapping("/modify")
	public String modify(ProfileVO profile, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/profile/info";
	}
	
	/*
	 * // 강사 소개 첨부 이미지 목록
	 * 
	 * @GetMapping(value = "/getAttachList", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE)
	 * 
	 * @ResponseBody public ResponseEntity<List<ImageAttachVO>> getAttachList(Long
	 * profile_bno) { log.info("getAttachList : " + profile_bno);
	 * 
	 * return new ResponseEntity<>(service.getAttachList(profile_bno),
	 * HttpStatus.OK); }
	 * 
	 * // 강사 소개 첨부 이미지 삭제 private void deleteFiles(List<ImageAttachVO> attachList) {
	 * if (attachList == null || attachList.size() == 0) { return; }
	 * 
	 * log.info("delete attach files............."); log.info(attachList);
	 * 
	 * attachList.forEach(attach -> { try { Path file = Paths.get(
	 * "C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" +
	 * attach.getFileName()); Files.deleteIfExists(file);
	 * 
	 * if(Files.probeContentType(file).startsWith("image")) { Path thumbNail =
	 * Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\
	 * s_" + attach.getUuid() + "_" + attach.getFileName());
	 * 
	 * Files.delete(thumbNail); } } catch (Exception e) { e.printStackTrace();
	 * }//END catch
	 * 
	 * });//END forEach
	 * 
	 * }
	 */
	
}
