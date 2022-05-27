package com.model2.mvc.service.heart.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Heart;
import com.model2.mvc.service.heart.HeartDao;
import com.model2.mvc.service.heart.HeartService;
import com.model2.mvc.service.product.ProductService;



//==> 회원관리 서비스 구현
@Service("heartServiceImpl")
public class HeartServiceImpl implements HeartService{
	
	///Field
	@Autowired
	@Qualifier("heartDaoImpl")
	private HeartDao heartDao;
	public void setHeartDao(HeartDao heartDao) {
		this.heartDao = heartDao;
	}
	
	///Constructor
	public HeartServiceImpl() {
		System.out.println(this.getClass());
	}
	


	@Override
	public void updateHeart(int prodNo) throws Exception{
		heartDao.updateHeart(prodNo);
	}
	
	@Override
	public void updateHeartCancel(int prodNo) throws Exception{
		heartDao.updateHeartCancel(prodNo);
	}

	
	@Override
	public void insertHeart(int prodNo,String userId) throws Exception{
		heartDao.insertHeart(prodNo, userId);
	}
	
	@Override
	public void deleteHeart(int prodNo,String userId)throws Exception{
		heartDao.deleteHeart(prodNo, userId);
	}
	
	@Override
	public int heartCheck(int prodNo,String userId) throws Exception{
		return heartDao.heartCheck(prodNo, userId);
	}
	
	@Override
	public void updateHeartCheck(int prodNo,String userId)throws Exception{
		heartDao.updateHeartCheck(prodNo, userId);
	}
	
	@Override
	public void updateHeartCheckCancel(int prodNo,String userId)throws Exception{
		System.out.println(prodNo);
		System.out.println(userId);
		heartDao.updateHeartCheckCancel(prodNo, userId);
	}
	

	

	

}