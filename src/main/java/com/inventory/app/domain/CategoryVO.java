package com.inventory.app.domain;

public class CategoryVO {
	private long categorySeq;
	private String categoryName;

	public CategoryVO() {
		super();
	}

	public CategoryVO(long categorySeq, String categoryName) {
		super();
		this.categorySeq = categorySeq;
		this.categoryName = categoryName;
	}

	public long getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(long categorySeq) {
		this.categorySeq = categorySeq;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
		result = prime * result + (int) (categorySeq ^ (categorySeq >>> 32));
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
		CategoryVO other = (CategoryVO) obj;
		if (categoryName == null) {
			if (other.categoryName != null)
				return false;
		} else if (!categoryName.equals(other.categoryName))
			return false;
		if (categorySeq != other.categorySeq)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CategoryVO [categorySeq=" + categorySeq + ", categoryName=" + categoryName + "]";
	}

}
