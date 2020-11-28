package com.inventory.app.domain;

public class ItemTestVO {
	int seq;
	String name;
	int price;
	int total;
	int remain;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

	public ItemTestVO(int seq, String name, int price, int total, int remain) {
		super();
		this.seq = seq;
		this.name = name;
		this.price = price;
		this.total = total;
		this.remain = remain;
	}

}
