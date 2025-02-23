package com.engbaek.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PageDTO;
import com.engbaek.domain.ProfileAttachVO;
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
		model.addAttribute("profileList",service.selectId());
	}

	// 강사 소개 등록 화면
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("profileList",service.selectId());
	}

	// 강사 소개 등록
	@PostMapping("/register")
	public String register(ProfileVO profile, MultipartFile uploadFile, Model model, RedirectAttributes rttr) {

		log.info("register : " + profile);

		log.info("===========================");
		if (profile.getAttachList() != null) {
			profile.getAttachList().forEach(attach -> log.info(profile));
		}
		log.info("===========================");

		service.register(profile);
		rttr.addFlashAttribute("result", profile.getTeacherPno());
		return "redirect:/profile/list";

	}

	// 강사 소개 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("teacherPno") Long teacherPno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove : " + teacherPno);

		List<ProfileAttachVO> attachList = service.getAttachList(teacherPno);

		if (service.remove(teacherPno)) {
			deleteFiles(attachList);
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

	// 첨부 파일 출력
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProfileAttachVO>> getAttachList(Long teacherPno) {
		log.info("getAttachList : " + teacherPno);

		return new ResponseEntity<>(service.getAttachList(teacherPno), HttpStatus.OK);
	}

	// 파일 삭제 처리
	private void deleteFiles(List<ProfileAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files.............");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("/Users/bky/upload/" + attach.getUploadPath() + "\\" + attach.getTeacherProfileUuid()
						+ "_" + attach.getTeacherProfilePicture());
				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("/Users/bky/upload/" + attach.getUploadPath() + "\\s_"
							+ attach.getTeacherProfileUuid() + "_" + attach.getTeacherProfilePicture());

					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} // END catch

		});// END forEach

	}
}
