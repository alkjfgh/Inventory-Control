package com.inventory.app.domain;

import java.util.Date;

public class UserVO {
	private String userId;
	private String userEmail;
	private String userPhone;
	private String userPassword;
	private Long shopSeq;
	private Date userRegdate;
	private String userName;
	private String userAddress;
	private Short userLevel;

	public UserVO() {
		super();
	}

	public UserVO(String userId, String userEmail, String userPhone, String userPassword, Long shopSeq, String userName,
			String userAddress, Short userLevel) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.shopSeq = shopSeq;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userLevel = userLevel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail == null ? null : userEmail.trim();
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone == null ? null : userPhone.trim();
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword == null ? null : userPassword.trim();
	}

	public Long getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(Long shopSeq) {
		this.shopSeq = shopSeq;
	}

	public Date getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress == null ? null : userAddress.trim();
	}

	public Short getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Short userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userPassword="
				+ userPassword + ", shopSeq=" + shopSeq + ", userRegdate=" + userRegdate + ", userName=" + userName
				+ ", userAddress=" + userAddress + ", userLevel=" + userLevel + "]";
	}

}