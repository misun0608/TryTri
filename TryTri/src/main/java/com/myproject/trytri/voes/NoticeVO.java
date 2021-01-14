package com.myproject.trytri.voes;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int bno;
	private String title;
	private String content;
	private Date reg_date;
	private String type;
	
	// About File-upload
	
	
	// About reply
	private String reply;
	
}
