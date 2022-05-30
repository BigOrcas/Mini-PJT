package com.model2.mvc.service.apply;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Apply;

public interface ApplyDao {

	public void addApply(Apply apply) throws Exception;

	public List<Apply> getApplyList(Search search,String applierId) throws Exception;

	public Apply getApply(int applyNo) throws Exception;

	
	
	public void updateApplyStatus(Apply apply) throws Exception;
	
	public int getTotalCount(Search search,String applierId) throws Exception ;
	
	public void buycook (int cookStatus, int applyNo ) throws Exception ;
	
	public void  cancel (int cookStatus, int applyNo ) throws Exception ;

}
