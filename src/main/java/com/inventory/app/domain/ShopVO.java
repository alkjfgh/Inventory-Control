package com.inventory.app.domain;

import java.util.Date;

public class ShopVO {
	private Long shopSeq;
	private String shopAddress;
	private String shopPhone;
	private String shopName;
	private Date shopRegdate;
	private long shopCount;

	public ShopVO() {
		super();
	}

	public ShopVO(Long shopSeq, String shopAddress, String shopPhone, String shopName) {
		super();
		this.shopSeq = shopSeq;
		this.shopAddress = shopAddress;
		this.shopPhone = shopPhone;
		this.shopName = shopName;
	}

	public Long getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(Long shopSeq) {
		this.shopSeq = shopSeq;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopPhone() {
		return shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Date getShopRegdate() {
		return shopRegdate;
	}

	public void setShopRegdate(Date shopRegdate) {
		this.shopRegdate = shopRegdate;
	}

	public long getShopCount() {
		return shopCount;
	}

	public void setShopCount(long shopCount) {
		this.shopCount = shopCount;
	}

	@Override
	public String toString() {
		return "ShopVO [shopSeq=" + shopSeq + ", shopAddress=" + shopAddress + ", shopPhone=" + shopPhone
				+ ", shopName=" + shopName + ", shopRegdate=" + shopRegdate + ", shopCount=" + shopCount + "]";
	}

}