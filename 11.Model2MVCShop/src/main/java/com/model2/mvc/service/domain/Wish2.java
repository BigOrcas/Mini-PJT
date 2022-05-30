package com.model2.mvc.service.domain;


public class Wish2 {
	
	private int wishNo;
	private int cookNo;
	private String userId;	
	private String cookName;
	private String cookFilename;
	private int cookPrice;	
	private int cookStatus;
	


	public Wish2(){
	}



	public int getWishNo() {
		return wishNo;
	}



	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
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



	public String getcookName() {
		return cookName;
	}



	public void setcookName(String cookName) {
		this.cookName = cookName;
	}



	public String getcookFilename() {
		return cookFilename;
	}



	public void setcookFilename(String cookFilename) {
		this.cookFilename = cookFilename;
	}



	public int getcookPrice() {
		return cookPrice;
	}



	public void setcookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}



	public int getcookStatus() {
		return cookStatus;
	}



	public void setcookStatus(int cookStatus) {
		this.cookStatus = cookStatus;
	}



	@Override
	public String toString() {
		return "Wish2 [wishNo=" + wishNo + ", cookNo=" + cookNo + ", userId=" + userId + ", cookName=" + cookName
				+ ", cookFilename=" + cookFilename + ", cookPrice=" + cookPrice + ", cookStatus=" + cookStatus
				+ "]";
	}


	
}