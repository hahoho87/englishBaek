package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.ClassQnaCommentPageDTO;
import com.engbaek.domain.ClassQnaCommentVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.ClassQnaCommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ClassQnaCommentServiceImpl implements ClassQnaCommentService{
	
	@Setter(onMethod_ = @Autowired)
	private ClassQnaCommentMapper mapper;
	
	@Override
	public ClassQnaCommentPageDTO getListPage(Criteria cri, Long classQnaNo) {
		
		return new ClassQnaCommentPageDTO(mapper.getCountByNo(classQnaNo), 
				mapper.getListWithPaging(cri, classQnaNo));
	}

	@Override
	public int modify(ClassQnaCommentVO classQnaComment) {
		
		log.info("modify......" + classQnaComment);
		return mapper.update(classQnaComment);
	}

	@Override
	public ClassQnaCommentVO get(Long commentNo) {

		log.info("get..." + commentNo);
		
		return mapper.read(commentNo);
	}

	@Override
	public int remove(Long commentNo) {

		log.info("remove...." + commentNo);
		return mapper.delete(commentNo);
	}

	@Override
	public int register(ClassQnaCommentVO classQnaComment) {
		
		log.info("register...");		
		return mapper.insert(classQnaComment);
	}

	@Override
	public List<ClassQnaCommentVO> getList(Criteria cri, Long classQnaNo) {
		log.info("get Comment List of a QnaBoard " + classQnaNo);		
		return mapper.getListWithPaging(cri, classQnaNo);
		
	}

	
}




