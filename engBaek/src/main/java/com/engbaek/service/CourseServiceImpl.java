package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.engbaek.domain.CourseAttachVO;
import com.engbaek.domain.CourseJoinVO;
import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.CourseAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private CourseAttachMapper attachMapper;

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

	@Transactional
	@Override
	public void register(CourseVO course) {
		log.info("register : " + course);
		mapper.insertSelectKey(course);
		
		if(course.getCourseAttachList() == null || course.getCourseAttachList().size() <=0 ) {
			return;
		}
		course.getCourseAttachList().forEach(attach -> {
			attach.setCourseCode(course.getCourseCode());
			attachMapper.insert(attach);
		});
	}

	@Override
	public CourseJoinVO get(Long courseCode) {
		log.info("get : " + courseCode);
		return mapper.read(courseCode);
	}

	@Transactional
	@Override
	public boolean modify(CourseVO course) {
		log.info("modify : " + course);
		
		attachMapper.deleteAll(course.getCourseCode());
		boolean modifyResult = mapper.update(course) == 1;
		
		if(modifyResult 
				&& course.getCourseAttachList() != null
				&& course.getCourseAttachList().size() > 0) {
			course.getCourseAttachList().forEach(attach -> {
				attach.setCourseCode(course.getCourseCode());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long courseCode) {
		log.info("remove : " + courseCode);
		attachMapper.delete(courseCode);
		return mapper.delete(courseCode) == 1;
	}

	@Override
	public List<CourseAttachVO> getAttachList(Long courseCode) {
		log.info("get Attach list by courseCode" + courseCode);
		return attachMapper.findByCourseCode(courseCode);
	}

	@Override
	public int idCheck(String teacherId) {
		log.info("id check : " + teacherId);
		return mapper.idCheck(teacherId);
	}

}
