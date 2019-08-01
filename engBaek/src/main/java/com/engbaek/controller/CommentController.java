
package com.engbaek.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.engbaek.domain.CommentVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReplyPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController

@Log4j

@RequestMapping("/replies/*")

@AllArgsConstructor
public class CommentController {

	// 댓글 목록 가져오기

	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,

			@PathVariable("bno") Long bno) {

		log.info("getList.......");
		Criteria cri = new Criteria(page, 10);
		log.info("cri:" + cri);

		return null;

	}

	// 댓글 조회 (info)

	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommentVO> get(

			@PathVariable("rno") Long rno) {

		log.info("get......." + rno);

		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);

	}

	// 댓글 수정

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{rno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> Modify(@RequestBody CommentVO comment, @PathVariable("commentNo") Long commentNo) {

		comment.setCommentNo(commentNo);

		log.info(" Modify commentNo :" + commentNo);
		log.info("comment:" + comment);

		int modCount = service.modify(comment);

		if (modCount == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 댓글 등록

	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody CommentVO comment) {
		log.info("등록됨 ");
		return null;

	}

	// 특정 댓글 삭제

	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(

			@PathVariable("rno") Long rno) {

		int delCount = service.remove(rno);// 댓글 삭제 log.info("remove:" +rno);

		if (delCount == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
}
