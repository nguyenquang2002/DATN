package com.devpro.javawebDATN.model;

import java.util.HashSet;
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
@Table(name = "pc")
public class PC extends BaseEntity{
	@Column(name = "ghi_chu")
    private String ghiChu;

    // Khóa ngoại liên kết với bảng SanPham
    @OneToOne
    @JoinColumn(name = "sanpham_id", referencedColumnName = "id")
    private SanPham sanPham;
    
    @OneToMany(cascade =  CascadeType.ALL, mappedBy = "pc", fetch = FetchType.EAGER)
    public Set<CauHinhPC> cauHinhPCs = new HashSet<CauHinhPC>();
    public void addCauHinh(CauHinhPC cauHinh) {
    	cauHinh.setPc(this);
    	cauHinhPCs.add(cauHinh);
    }
    
    public void deleteCauHinh(CauHinhPC cauHinh) {
    	cauHinh.setPc(null);
    	cauHinhPCs.remove(cauHinh);
    }
    
	public Set<CauHinhPC> getCauHinhPCs() {
		return cauHinhPCs;
	}

	public void setCauHinhPCs(Set<CauHinhPC> cauHinhPCs) {
		this.cauHinhPCs = cauHinhPCs;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
}
