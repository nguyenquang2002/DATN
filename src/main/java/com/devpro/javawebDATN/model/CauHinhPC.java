package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cauhinhpc")
public class CauHinhPC extends BaseEntity{
	@ManyToOne
    @JoinColumn(name = "phancung_id", nullable = false)
    private PhanCung phanCung;

    @ManyToOne
    @JoinColumn(name = "pc_id", nullable = false)
    private PC pc;

    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "cau_hinh")
    private int cauHinh;

	public PhanCung getPhanCung() {
		return phanCung;
	}

	public void setPhanCung(PhanCung phanCung) {
		this.phanCung = phanCung;
	}

	public PC getPc() {
		return pc;
	}

	public void setPc(PC pc) {
		this.pc = pc;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getCauHinh() {
		return cauHinh;
	}

	public void setCauHinh(int cauHinh) {
		this.cauHinh = cauHinh;
	}
}
