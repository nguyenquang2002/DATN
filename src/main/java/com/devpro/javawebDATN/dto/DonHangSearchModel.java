package com.devpro.javawebDATN.dto;

public class DonHangSearchModel extends BaseSearchModel{
	
	private int taiKhoanID;
	
	// tìm theo keyword
	private String keyword;

	// tìm theo status
	private Integer trangThai;

	public int getTaiKhoanID() {
		return taiKhoanID;
	}

	public void setTaiKhoanID(int taiKhoanID) {
		this.taiKhoanID = taiKhoanID;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}
	
	

}
