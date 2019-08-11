package com.engbaek.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PrivateQnaMapperTest {

	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	@Test
	public void testRegister() {
		
		ReviewVO reply= new ReviewVO();
		reply.setReviewNo(4L);
		reply.setReviewTitle("Notice Test");
		reply.setStudentId("stu1");
		reply.setReviewContent("notice test contents");
		reply.setTeacherId("tc1");
		reply.setCourseCode(1);
		mapper.insertSelectKey(reply);
	
	log.info(reply);

	}
}
