package com.inventory.app.domain;

import java.util.Arrays;
import java.util.Date;

public class ItemVO {
	private Long itemSeq;
	private Long categorySeq;
	private String itemName;
	private Long itemPrice;
	private Date itemRegdate;
	private Date itemFwdate;
	private String itemDesc;
	private String itemMaker;
	private byte[] itemImg;

	public ItemVO() {
		super();
	}

	public ItemVO(Long categorySeq, String itemName, Long itemPrice, String itemMaker) {
		super();
		this.categorySeq = categorySeq;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemMaker = itemMaker;
	}

	public Long getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(Long itemSeq) {
		this.itemSeq = itemSeq;
	}

	public Long getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(Long categorySeq) {
		this.categorySeq = categorySeq;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Date getItemRegdate() {
		return itemRegdate;
	}

	public void setItemRegdate(Date itemRegdate) {
		this.itemRegdate = itemRegdate;
	}

	public Date getItemFwdate() {
		return itemFwdate;
	}

	public void setItemFwdate(Date itemFwdate) {
		this.itemFwdate = itemFwdate;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemMaker() {
		return itemMaker;
	}

	public void setItemMaker(String itemMaker) {
		this.itemMaker = itemMaker;
	}

	public byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(byte[] itemImg) {
		this.itemImg = itemImg;
	}

	@Override
	public String toString() {
		return "ItemVO [itemSeq=" + itemSeq + ", categorySeq=" + categorySeq + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", itemRegdate=" + itemRegdate + ", itemFwdate=" + itemFwdate + ", itemDesc=" + itemDesc
				+ ", itemMaker=" + itemMaker + ", itemImg=" + Arrays.toString(itemImg) + "]";
	}

}