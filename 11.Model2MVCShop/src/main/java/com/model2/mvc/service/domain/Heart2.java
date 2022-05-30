package com.model2.mvc.service.domain;

public class Heart2 {

	private int heartNo;
	private int cookNo;
	private String userId;
	private int heartCheck;

	public Heart2() {
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}

	public int getcookNo() {
		return cookNo;
	}

	public void setcookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHeartCheck() {
		return heartCheck;
	}

	public void setHeartCheck(int heartCheck) {
		this.heartCheck = heartCheck;
	}

	@Override
	public String toString() {
		return "Heart2 [heartNo=" + heartNo + ", cookNo=" + cookNo + ", userId=" + userId + ", heartCheck="
				+ heartCheck + "]";
	}



}