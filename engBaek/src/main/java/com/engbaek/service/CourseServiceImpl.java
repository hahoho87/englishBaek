package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.CourseJoinVO;
import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileAttachVO;
import com.engbaek.mapper.CourseMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CourseServiceImpl implements CourseService {
	
	@Setter(onMethod_ = @Autowired)
	private CourseMapper mapper;

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<CourseJoinVO> getList(Criteria cri) {
		log.info("get list with criteria");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(CourseVO course) {
		log.info("register : " + course);
		mapper.insertSelectKey(course);
	}

	@Override
	public CourseJoinVO get(Long courseCode) {
		log.info("get : " + courseCode);
		return mapper.read(courseCode);
	}

	@Override
	public boolean modify(CourseVO course) {
		log.info("modify : " + course);
		boolean modifyResult = mapper.update(course) == 1;
		return modifyResult;
	}

	@Override
	public boolean remove(Long courseCode) {
		log.info("remove : " + courseCode);
		boolean removeResult = mapper.delete(courseCode) == 1;
		return removeResult;
	}

	@Override
	public List<ProfileAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheck(String teacherId) {
		log.info("id check : " + teacherId);
		return mapper.idCheck(teacherId);
	}

}
