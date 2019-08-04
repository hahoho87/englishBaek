package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileJoinVO;
import com.engbaek.domain.ProfileVO;
import com.engbaek.mapper.ProfileMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProfileServiceImpl implements ProfileService{
	
	@Setter(onMethod_ = @Autowired)
	private ProfileMapper mapper;

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProfileJoinVO> getList(Criteria cri) {
		log.info("getList with Criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(ProfileVO profile) {
		log.info("register : " + profile);
		mapper.insertSelectKey(profile);
	}

	@Override
	public ProfileVO get(Long teacherPno) {
		log.info("read : " + teacherPno);
		return mapper.selectOneProfile(teacherPno);
	}

	@Override
	public boolean modify(ProfileVO profile) {
		log.info("modify : " + profile);
		boolean modifyResult = mapper.update(profile) == 1;
		return modifyResult;
	}

	@Override
	public boolean remove(Long teacherPno) {
		log.info("remove : " + teacherPno);
		boolean removeResult = mapper.delete(teacherPno) == 1;
		return removeResult;
	}

}
