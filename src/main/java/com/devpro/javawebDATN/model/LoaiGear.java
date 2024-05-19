package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "loaigear")
public class LoaiGear extends BaseEntity{
	@Column(name = "loai_gear", nullable = false)
    private String loaiGear;

    @Column(name = "ghi_chu")
    private String ghiChu;

	public String getLoaiGear() {
		return loaiGear;
	}

	public void setLoaiGear(String loaiGear) {
		this.loaiGear = loaiGear;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
}
