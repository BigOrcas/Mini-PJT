package com.model2.mvc.service.heart;

import java.util.List;

import com.model2.mvc.service.domain.Heart;



public interface HeartDao {
	

	public void updateHeart (int prodNo) throws Exception;
	
	public void updateHeartCancel(int prodNo) throws Exception;
	
	
	public void insertHeart(int prodNo,String userId) throws Exception;
	
	public void deleteHeart(int prodNo,String userId) throws Exception;
	
	public int heartCheck(int prodNo,String userId) throws Exception;
	
	public void updateHeartCheck(int prodNo,String userId) throws Exception;
	
	public void updateHeartCheckCancel(int prodNo,String userId) throws Exception;
	
	
	
	
	
}