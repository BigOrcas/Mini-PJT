package com.model2.mvc.service.cook;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cook;


public interface CookDao {

	// INSERT
	public void addCook(Cook cook) throws Exception;

	public List<Cook> getCookList(Search search) throws Exception;

	public Cook getCook(int cookNo) throws Exception;

	public void updateCook(Cook cook) throws Exception;

	public int getTotalCount(Search search) throws Exception ;
	


}