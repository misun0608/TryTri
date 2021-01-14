package com.myproject.trytri.voes;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_phone;
	private Date member_join_date;
	private String member_certificate; // whether certificate is or not
	private String member_isadmin;	// whether administration account is or not
}
