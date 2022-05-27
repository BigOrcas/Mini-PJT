package com.model2.mvc.service.heart;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Heart;

public interface HeartService {

public void updateHeart (int prodNo) throws Exception;
	
	public void updateHeartCancel(int prodNo) throws Exception;
	
	
	public void insertHeart(int prodNo,String userId) throws Exception;
	
	public void deleteHeart(int prodNo,String userId) throws Exception;
	
	public int heartCheck(int prodNo,String userId) throws Exception;
	
	public void updateHeartCheck(int prodNo,String userId) throws Exception;
	
	public void updateHeartCheckCancel(int prodNo,String userId) throws Exception;

}
