package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "brand")
public class Brand extends BaseEntity{
	
	@Column(name = "ten_hang")
    private String tenHang;
    
    @Column(name = "ghi_chu")
    private String ghiChu;

	public String getTenHang() {
		return tenHang;
	}

	public void setTenHang(String tenHang) {
		this.tenHang = tenHang;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
    
    
}
