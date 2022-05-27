package com.model2.mvc.service.domain;

public class Heart {

	private int heartNo;
	private int prodNo;
	private String userId;
	private int heartCheck;

	public Heart() {
	}

	public int getHeartCheck() {
		return heartCheck;
	}

	public void setHeartCheck(int heartCheck) {
		this.heartCheck = heartCheck;
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
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
		return "Heart [heartNo=" + heartNo + ", prodNo=" + prodNo + ", userId=" + userId + ", heartCheck=" + heartCheck
				+ "]";
	}

}