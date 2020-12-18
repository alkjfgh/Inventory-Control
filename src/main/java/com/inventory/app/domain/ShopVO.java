package com.inventory.app.domain;

import java.util.Date;

public class ShopVO {
	private Long shopSeq;
	private String shopAddress;
	private String shopPhone;
	private String shopName;
	private Date shopRegdate;
	private long shopCount;
	private int start;

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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((shopAddress == null) ? 0 : shopAddress.hashCode());
		result = prime * result + (int) (shopCount ^ (shopCount >>> 32));
		result = prime * result + ((shopName == null) ? 0 : shopName.hashCode());
		result = prime * result + ((shopPhone == null) ? 0 : shopPhone.hashCode());
		result = prime * result + ((shopRegdate == null) ? 0 : shopRegdate.hashCode());
		result = prime * result + ((shopSeq == null) ? 0 : shopSeq.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShopVO other = (ShopVO) obj;
		if (shopAddress == null) {
			if (other.shopAddress != null)
				return false;
		} else if (!shopAddress.equals(other.shopAddress))
			return false;
		if (shopCount != other.shopCount)
			return false;
		if (shopName == null) {
			if (other.shopName != null)
				return false;
		} else if (!shopName.equals(other.shopName))
			return false;
		if (shopPhone == null) {
			if (other.shopPhone != null)
				return false;
		} else if (!shopPhone.equals(other.shopPhone))
			return false;
		if (shopRegdate == null) {
			if (other.shopRegdate != null)
				return false;
		} else if (!shopRegdate.equals(other.shopRegdate))
			return false;
		if (shopSeq == null) {
			if (other.shopSeq != null)
				return false;
		} else if (!shopSeq.equals(other.shopSeq))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ShopVO [shopSeq=" + shopSeq + ", shopAddress=" + shopAddress + ", shopPhone=" + shopPhone
				+ ", shopName=" + shopName + ", shopRegdate=" + shopRegdate + ", shopCount=" + shopCount + "]";
	}

}