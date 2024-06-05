package com.jieun.dto;

public class MemberVO {
	private String username;
	private String userid;
	private String pwd;
	private String email;
	private String phone;
	private int admin;

	public MemberVO(String username, String userid, String pwd, String email, String phone, int admin) {
		super();
		this.username = username;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.admin = admin;
	}

	public MemberVO() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "memberVO [username=" + username + ", userid=" + userid + ", pwd=" + pwd + ", email=" + email
				+ ", phone=" + phone + ", admin=" + admin + "]";
	}

}
