package com.devpro.javawebDATN.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "laptop")
public class Laptop extends BaseEntity{
	@OneToOne
    @JoinColumn(name = "sanpham_id", referencedColumnName = "id", nullable = false)
    private SanPham sanPham;

    @Column(name = "loai_laptop", nullable = false)
    private int loaiLaptop;

    @Column(name = "ManHinh", nullable = false)
    private String manHinh;

    @Column(name = "CongGiaoTiep", nullable = false, columnDefinition = "TEXT")
    private String congGiaoTiep;

    @Column(name = "BanPhim", nullable = false)
    private String banPhim;

    @Column(name = "Audio", nullable = false)
    private String audio;

    @Column(name = "Chuan_lan", nullable = false)
    private String chuanLAN;

    @Column(name = "Chuan_wifi", nullable = false)
    private String chuanWiFi;

    @Column(name = "Bluetooth", nullable = false)
    private String bluetooth;

    @Column(name = "Webcam", nullable = false)
    private String webcam;

    @Column(name = "hdh", nullable = false)
    private String hdh;

    @Column(name = "Pin", nullable = false)
    private String pin;

    @Column(name = "TrongLuong", nullable = false)
    private float trongLuong;

    @Column(name = "MauSac", nullable = false)
    private String mauSac;

    @Column(name = "KichThuoc", nullable = false)
    private String kichThuoc;

    @Column(name = "ghi_chu", columnDefinition = "LONGTEXT")
    private String ghiChu;
    
    @OneToMany(cascade =  CascadeType.ALL, mappedBy = "laptop", fetch = FetchType.EAGER)
    public Set<CauHinhLaptop> cauHinhLaptops = new HashSet<CauHinhLaptop>();
    public void addCauHinh(CauHinhLaptop cauHinh) {
    	cauHinh.setLaptop(this);
    	cauHinhLaptops.add(cauHinh);
    }
    
    public void deleteCauHinh(CauHinhLaptop cauHinh) {
    	cauHinh.setLaptop(null);
    	cauHinhLaptops.remove(cauHinh);
    }
    
	public Set<CauHinhLaptop> getCauHinhLaptops() {
		return cauHinhLaptops;
	}

	public void setCauHinhLaptops(Set<CauHinhLaptop> cauHinhLaptops) {
		this.cauHinhLaptops = cauHinhLaptops;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getLoaiLaptop() {
		return loaiLaptop;
	}

	public void setLoaiLaptop(int loaiLaptop) {
		this.loaiLaptop = loaiLaptop;
	}

	public String getManHinh() {
		return manHinh;
	}

	public void setManHinh(String manHinh) {
		this.manHinh = manHinh;
	}

	public String getCongGiaoTiep() {
		return congGiaoTiep;
	}

	public void setCongGiaoTiep(String congGiaoTiep) {
		this.congGiaoTiep = congGiaoTiep;
	}

	public String getBanPhim() {
		return banPhim;
	}

	public void setBanPhim(String banPhim) {
		this.banPhim = banPhim;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getChuanLAN() {
		return chuanLAN;
	}

	public void setChuanLAN(String chuanLAN) {
		this.chuanLAN = chuanLAN;
	}

	public String getChuanWiFi() {
		return chuanWiFi;
	}

	public void setChuanWiFi(String chuanWiFi) {
		this.chuanWiFi = chuanWiFi;
	}

	public String getBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getWebcam() {
		return webcam;
	}

	public void setWebcam(String webcam) {
		this.webcam = webcam;
	}

	public String getHdh() {
		return hdh;
	}

	public void setHdh(String hdh) {
		this.hdh = hdh;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public float getTrongLuong() {
		return trongLuong;
	}

	public void setTrongLuong(float trongLuong) {
		this.trongLuong = trongLuong;
	}

	public String getMauSac() {
		return mauSac;
	}

	public void setMauSac(String mauSac) {
		this.mauSac = mauSac;
	}

	public String getKichThuoc() {
		return kichThuoc;
	}

	public void setKichThuoc(String kichThuoc) {
		this.kichThuoc = kichThuoc;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	

	
    
}
