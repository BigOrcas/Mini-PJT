package com.model2.mvc.service.domain;


public class Wish {
	
	private int wishNo;
	private int prodNo;
	private String userId;	
	private String prodName;
	private String fileName;
	private int price;	
	private int buy;
	


	public Wish(){
	}


	public int getWishNo() {
		return wishNo;
	}


	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
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


	public int getBuy() {
		return buy;
	}


	public void setBuy(int buy) {
		this.buy = buy;
	}
	
	
	public String getProdName() {
		return prodName;
	}


	public void setProdName(String prodName) {
		this.prodName = prodName;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String toString() {
		return "WishVO :"+"[wishNo]"+wishNo+"[prodNo]"+prodNo+"[userId]"+userId;
	}
}