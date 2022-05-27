package com.model2.mvc.service.domain;

import java.sql.Date;

public class Class {

	private User classer;
	private int ClassNo;
	private Cook classCook;
	private Date startTime;
	private Date endTime;
	private String classStatus;
	private Date checkDate;
	private String cookStatus;
	
	private int buy;
	
	public Class() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	public User getClasser() {
		return classer;
	}

	public void setClasser(User classer) {
		this.classer = classer;
	}

	public int getClassNo() {
		return ClassNo;
	}

	public void setClassNo(int classNo) {
		ClassNo = classNo;
	}

	public Cook getClassCook() {
		return classCook;
	}

	public void setClassCook(Cook classCook) {
		this.classCook = classCook;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getCookStatus() {
		return cookStatus;
	}

	public void setCookStatus(String cookStatus) {
		this.cookStatus = cookStatus;
	}

	public int getBuy() {
		return buy;
	}

	public void setBuy(int buy) {
		this.buy = buy;
	}



}
