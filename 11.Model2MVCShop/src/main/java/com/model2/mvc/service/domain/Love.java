package com.model2.mvc.service.domain;

public class Love {
	
	private int loveNo;
	private int prodNo;
	private String userId;	

	public Love() {
		// TODO Auto-generated constructor stub
	}

	public int getLoveNo() {
		return loveNo;
	}

	public void setLoveNo(int loveNo) {
		this.loveNo = loveNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Love [loveNo=" + loveNo + ", prodNo=" + prodNo + ", userId=" + userId + "]";
	}



}
