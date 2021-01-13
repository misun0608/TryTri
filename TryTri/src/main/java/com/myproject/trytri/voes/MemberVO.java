package com.myproject.trytri.voes;

import java.sql.Date;

public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_phone;
	private Date member_join_date;
	private String member_certificate; // whether certificate is or not
	private String is_admin;	// whether administration account is or not
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
	public String getMember_certificate() {
		return member_certificate;
	}
	public void setMember_certificate(String member_certificate) {
		this.member_certificate = member_certificate;
	}
	public String getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}
}
