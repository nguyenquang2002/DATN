package com.devpro.javawebDATN.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "taikhoan")
public class TaiKhoan extends BaseEntity implements UserDetails{
	@Column(name = "TaiKhoan", nullable = false)
    private String username;

    @Column(name = "MatKhau", nullable = false)
    private String password;

    @Column(name = "HoTen", nullable = false)
    private String hoTen;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "Email")
    private String email;
    
    @Column(name = "trang_thai")
    private int trangThai;

    @ManyToOne
    @JoinColumn(name = "chucvu_id", referencedColumnName = "id")
    private ChucVu chucVu;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "taiKhoan")
    private Set<DonHang> donHangs = new HashSet<DonHang>();
    public void addDonHang(DonHang dh) {
    	dh.setTaiKhoan(this);
    	donHangs.add(dh);
    }
    public void deleteDonHang(DonHang dh) {
    	dh.setTaiKhoan(null);
    	donHangs.remove(dh);
    }
    
	public Set<DonHang> getDonHangs() {
		return donHangs;
	}
	public void setDonHangs(Set<DonHang> donHangs) {
		this.donHangs = donHangs;
	}
	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ChucVu getChucVu() {
		return chucVu;
	}

	public void setChucVu(ChucVu chucVu) {
		this.chucVu = chucVu;
	}


	

	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Set<ChucVu> chucVus = new HashSet<ChucVu>();
		chucVus.add(chucVu);
		return chucVus;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
