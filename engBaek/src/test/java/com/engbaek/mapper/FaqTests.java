package com.engbaek.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FaqTests {
	
	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(faq -> log.info(faq));;
	}
	
	@Test
	public void testInsertSelectKey() {
		FaqVO faq = new FaqVO();
		faq.setFaqTitle("FAQ TEST");
		faq.setAdminId("tester");
		faq.setFaqContent("test contents");
		
		mapper.insertSelectKey(faq);
		
		log.info(faq);
	}

}
