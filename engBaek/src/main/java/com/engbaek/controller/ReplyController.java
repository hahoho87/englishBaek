/*
 * package com.engbaek.controller;
 * 
 * import org.springframework.http.HttpStatus; import
 * org.springframework.http.MediaType; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.DeleteMapping; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RestController; import
 * org.zerock.domain.ReplyPageDTO; import org.zerock.domain.ReplyVO;
 * 
 * import com.engbaek.domain.Criteria;
 * 
 * import lombok.AllArgsConstructor; import lombok.extern.log4j.Log4j;
 * 
 * @RestController
 * 
 * @Log4j
 * 
 * @RequestMapping("/replies/*")
 * 
 * @AllArgsConstructor public class ReplyController {
 * 
 * //댓글 목록 가져오기
 * 
 * @GetMapping(value = "/pages/{bno}/{page}",produces=
 * {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
 * public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,
 * 
 * @PathVariable("bno") Long bno){
 * 
 * log.info("getList......."); Criteria cri = new Criteria(page,10);
 * log.info("cri:"+cri);
 * 
 * return;
 * 
 * }
 * 
 * //댓글 조회 (info)
 * 
 * @GetMapping(value = "/{rno}",produces= {MediaType.APPLICATION_XML_VALUE,
 * MediaType.APPLICATION_JSON_UTF8_VALUE}) public ResponseEntity<ReplyVO> get(
 * 
 * @PathVariable("rno") Long rno){
 * 
 * log.info("get......." +rno);
 * 
 * return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
 * 
 * }
 * 
 * //댓글 수정
 * 
 * @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH}, value=
 * "/{rno}",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE
 * }) public ResponseEntity<String>Modify(@RequestBody ReplyVO
 * vo,@PathVariable("rno") Long rno ){
 * 
 * vo.setRno(rno);
 * 
 * log.info(" Modify rno:" +rno); log.info("vo:" +vo);
 * 
 * 
 * int modCount = service.modify(vo);
 * 
 * if(modCount==1) { return new ResponseEntity<>("success",HttpStatus.OK); }
 * else{
 * 
 * return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
 * 
 * }
 * 
 * //댓글 등록
 * 
 * @PostMapping(value = "/register", consumes = "application/json", produces=
 * {MediaType.TEXT_PLAIN_VALUE}) public ResponseEntity<String>
 * create(@RequestBody ReplyVO vo){ log.info("등록됨 ");
 * 
 * }
 * 
 * //특정 댓글 삭제
 * 
 * @DeleteMapping(value = "/{rno}",produces= {MediaType.TEXT_PLAIN_VALUE})
 * public ResponseEntity<String> remove(
 * 
 * @PathVariable("rno") Long rno){
 * 
 * int delCount = service.remove(rno);//댓글 삭제 log.info("remove:" +rno);
 * 
 * if(delCount==1) { return new ResponseEntity<>("success",HttpStatus.OK); }
 * else{
 * 
 * return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
 * 
 * } }
 */