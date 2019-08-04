package com.engbaek.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.CourseJoinVO;
import com.engbaek.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CourseMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CourseMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(course -> log.info(course));
//	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		//5개씩 2페이지
		cri.setPageNum(1);
		cri.setAmount(5);
		
		List<CourseJoinVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(faq -> log.info(faq));
	}
}
