package com.model2.mvc.service.cook.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cook;
import com.model2.mvc.service.cook.CookDao;


//==> ȸ������ DAO CRUD ����
@Repository("cookDaoImpl")
public class CookDaoImpl implements CookDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CookDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addCook(Cook cook) throws Exception {
		sqlSession.insert("CookMapper.addCook", cook);
	}

	public Cook getCook(int cookNo) throws Exception {
		return sqlSession.selectOne("CookMapper.getCook", cookNo);
	}
	
	public void updateCook(Cook cook) throws Exception {
		sqlSession.update("CookMapper.updateCook", cook);
	}

	public List<Cook> getCookList(Search search) throws Exception {
		return sqlSession.selectList("CookMapper.getCookList", search);
	}

	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CookMapper.getTotalCount", search);
	}
	

	
	
	
	
	
}