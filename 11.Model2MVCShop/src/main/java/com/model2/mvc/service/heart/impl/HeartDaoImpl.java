package com.model2.mvc.service.heart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.model2.mvc.service.domain.Heart;
import com.model2.mvc.service.heart.HeartDao;



@Repository("heartDaoImpl")
public class HeartDaoImpl implements HeartDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public HeartDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void updateHeart(int prodNo) throws Exception{
	 sqlSession.update("HeartMapper.updateHeart", prodNo);
	}
	
	@Override
	public void updateHeartCancel(int prodNo) throws Exception{
		sqlSession.update("HeartMapper.updateHeartCancel", prodNo);

	}

	
	@Override
	public void insertHeart(int prodNo,String userId) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("prodNo", prodNo);
		sqlSession.insert("HeartMapper.insertHeart", map);
	}
	
	@Override
	public void deleteHeart(int prodNo,String userId)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("prodNo", prodNo);
		sqlSession.delete("HeartMapper.deleteHeart", map);
	}
	
	@Override
	public int heartCheck(int prodNo,String userId) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("prodNo", prodNo);
		return sqlSession.selectOne("HeartMapper.heartCheck", map);
	}
	
	@Override
	public void updateHeartCheck(int prodNo,String userId) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("prodNo", prodNo);
		sqlSession.update("HeartMapper.updateHeartCheck", map);
		
	}
			
	@Override
	public void updateHeartCheckCancel(int prodNo,String userId) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("prodNo", prodNo);
		sqlSession.update("HeartMapper.updateHeartCheckCancel", map);
	}

	


}