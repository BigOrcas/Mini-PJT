package com.model2.mvc.service.domain;

import java.sql.Date;

public class Cook {

	private int cookNo;
	private String cookName;
	private String cookFileName;
	private int cookRecruit;
	private String cookDifficuty;
	private String cookTheme;
	private int cookPrice;
	private String cookBrief;
	private Date startTime;
	private Date endTime;
	private Date regStartTime;
	private Date regEndTime;
	private String cookLocation;
	private String certificate;
	private String career;
	private String cookShorts;
	private String applyStatus;

	public int getCookNo() {
		return cookNo;
	}

	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public String getCookName() {
		return cookName;
	}

	public void setCookName(String cookName) {
		this.cookName = cookName;
	}

	public String getCookFileName() {
		return cookFileName;
	}

	public void setCookFileName(String cookFileName) {
		this.cookFileName = cookFileName;
	}

	public int getCookRecruit() {
		return cookRecruit;
	}

	public void setCookRecruit(int cookRecruit) {
		this.cookRecruit = cookRecruit;
	}

	public String getCookDifficuty() {
		return cookDifficuty;
	}

	public void setCookDifficuty(String cookDifficuty) {
		this.cookDifficuty = cookDifficuty;
	}

	public String getCookTheme() {
		return cookTheme;
	}

	public void setCookTheme(String cookTheme) {
		this.cookTheme = cookTheme;
	}

	public int getCookPrice() {
		return cookPrice;
	}

	public void setCookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}

	public String getCookBrief() {
		return cookBrief;
	}

	public void setCookBrief(String cookBrief) {
		this.cookBrief = cookBrief;
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

	public Date getRegStartTime() {
		return regStartTime;
	}

	public void setRegStartTime(Date regStartTime) {
		this.regStartTime = regStartTime;
	}

	public Date getRegEndTime() {
		return regEndTime;
	}

	public void setRegEndTime(Date regEndTime) {
		this.regEndTime = regEndTime;
	}

	public String getCookLocation() {
		return cookLocation;
	}

	public void setCookLocation(String cookLocation) {
		this.cookLocation = cookLocation;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCookShorts() {
		return cookShorts;
	}

	public void setCookShorts(String cookShorts) {
		this.cookShorts = cookShorts;
	}

	public String getCookRegDate() {
		return cookRegDate;
	}

	public void setCookRegDate(String cookRegDate) {
		this.cookRegDate = cookRegDate;
	}

	private String cookRegDate;

	public Cook() {
		// TODO Auto-generated constructor stub
	}

}
