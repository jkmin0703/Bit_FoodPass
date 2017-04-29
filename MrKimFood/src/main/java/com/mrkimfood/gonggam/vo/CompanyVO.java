package com.mrkimfood.gonggam.vo;

import java.sql.Date;

public class CompanyVO {
	private Integer memberId;
	private String id;
	private String pw;
	private Date regDate;
	private char isAway;
	private Date modifyDate;
	private String licenseNum;
	private String presidant;
	private String businessName;
	
	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public char getIsAway() {
		return isAway;
	}
	public void setIsAway(char isAway) {
		this.isAway = isAway;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getLicenseNum() {
		return licenseNum;
	}
	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}
	public String getPresidant() {
		return presidant;
	}
	public void setPresidant(String presidant) {
		this.presidant = presidant;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	

	
	


}
