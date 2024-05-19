package com.devpro.javawebDATN.dto;

public class TaiKhoanSearchModel extends BaseSearchModel{
	
	// tìm theo keyword
	private String keyword;
	
	private Integer roleId;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	
	
	
}
