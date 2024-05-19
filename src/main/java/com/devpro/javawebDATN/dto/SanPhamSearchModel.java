package com.devpro.javawebDATN.dto;

public class SanPhamSearchModel extends BaseSearchModel {
	// tìm theo keyword
	private String keyword;

	// tìm theo loại sản phẩm
	private Integer loaiSP;
	
	// brand
	private Integer brandID;
	
	private String price;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getLoaiSP() {
		return loaiSP;
	}

	public void setLoaiSP(Integer loaiSP) {
		this.loaiSP = loaiSP;
	}

	public Integer getBrandID() {
		return brandID;
	}

	public void setBrandID(Integer brandID) {
		this.brandID = brandID;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
}
