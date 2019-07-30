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

import com.engbaek.domain.ClassAttachVO;
import com.engbaek.domain.ClassVO;
import com.engbaek.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/class/*")
@AllArgsConstructor
public class ClassController {

	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}

	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("class_bno") Long class_bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// TODO BoardVO 변경
	@PostMapping("/modify")
	public String modify(ClassVO class_, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/class/read";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("class_bno") Long class_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/class/list";
	}

	@GetMapping("/register")
	public void register() {

	}

	// TODO BoardVO 변경
	@PostMapping("/register")
	public String register(ClassVO class_, RedirectAttributes rttr) {
		return "redirect:/class/list";

	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ClassAttachVO>> getAttachList(Long class_bno) {
		log.info("getAttachList : " + class_bno);

		return new ResponseEntity<>(service.getAttachList(class_bno), HttpStatus.OK);
	}

	// 파일 삭제 처리
	private void deleteFiles(List<ClassAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files.............");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}//END catch

		});//END forEach

	}
}
