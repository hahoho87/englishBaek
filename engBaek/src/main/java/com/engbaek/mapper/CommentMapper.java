package com.engbaek.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.engbaek.domain.CommentVO;
import com.engbaek.domain.Criteria;

public interface CommentMapper {
	
	public int getCountByBno(Long bno);
	public int insert(CommentVO comment);
	public CommentVO read(Long bno);
	public int delete(Long rno);
	public int update(CommentVO comment);
	public List<CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
}
