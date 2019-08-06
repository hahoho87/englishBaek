package com.engbaek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PageDTO;
import com.engbaek.domain.ProfileVO;
import com.engbaek.service.ProfileService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class ProfileController {

	private ProfileService service;

	// 강사 소개 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("profileList", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total count : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	// 강사 소개 상세 조회 or 수정 화면
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("teacherPno") Long teacherPno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify : " + teacherPno);
		model.addAttribute("profile", service.get(teacherPno));
	}

	// 강사 소개 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 강사 소개 등록
	@PostMapping("/register")
	public String register(ProfileVO profile, RedirectAttributes rttr) {
		log.info("register : " + profile);
		service.register(profile);
		rttr.addFlashAttribute("result", profile.getTeacherPno());
		return "redirect:/profile/list";

	}

	// 강사 소개 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("teacherPno") Long teacherPno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove : " + teacherPno);
		if (service.remove(teacherPno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/profile/list";
	}

	// 강사 소개 수정
	@PostMapping("/modify")
	public String modify(ProfileVO profile, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + profile);
		if (service.modify(profile)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/profile/info";
	}

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		log.info("post idCheck");

		String teacherId = req.getParameter("teacherId");
		int idCheck = service.idCheck(teacherId);

		int result = 0;

		if (idCheck == 1) {
			result = 1;
		}
		
		log.info(result);
			
		return result;
		
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
