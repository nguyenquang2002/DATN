package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cauhinhlaptop")
public class CauHinhLaptop extends BaseEntity{
	@ManyToOne
    @JoinColumn(name = "phancung_id", nullable = false)
    private PhanCung phanCung;

    @ManyToOne
    @JoinColumn(name = "laptop_id", nullable = false)
    private Laptop laptop;

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

	public Laptop getLaptop() {
		return laptop;
	}

	public void setLaptop(Laptop laptop) {
		this.laptop = laptop;
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
