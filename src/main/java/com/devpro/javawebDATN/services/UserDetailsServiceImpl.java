package com.devpro.javawebDATN.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.TaiKhoan;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private TaiKhoanService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// connect tới db và lấy user theo username
		return userService.loadUserByUsername(username);
	}

	

}
