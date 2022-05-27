package com.model2.mvc.service.wish.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.model2.mvc.service.domain.Wish;
import com.model2.mvc.service.wish.WishDao;
import com.model2.mvc.service.wish.WishService;



@Service("wishServiceImpl")
public class WishServiceImpl implements WishService{
	
	///Field
	@Autowired
	@Qualifier("wishDaoImpl")
	private WishDao wishDao;
	public void setWishlistDao(WishDao wishDao) {
		this.wishDao = wishDao;
	}
	
	///Constructor
	public WishServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addWish(Wish wish) throws Exception {
		wishDao.addWish(wish);		
	}

	@Override
	public List<Wish> getWish(String userId) throws Exception {
		
		return wishDao.getWish(userId);	
	}

	@Override
	public void deleteWish(int wishNo) throws Exception {
		wishDao.deleteWish(wishNo);
	}

	@Override
	public void updateWish(int wishNo, int buy) throws Exception {
		
		wishDao.updateWish(wishNo, buy);
	}

	

}