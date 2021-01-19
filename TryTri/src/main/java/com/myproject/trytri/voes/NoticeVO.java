package com.myproject.trytri.voes;

import java.sql.Date;

/*
CREATE TABLE `trytri`.`tt_noice` (
  `notice_num` INT NOT NULL AUTO_INCREMENT,
  `notice_title` VARCHAR(45) NOT NULL,
  `notice_content` TEXT NOT NULL,
  `notice_reg_date` DATE NOT NULL,
  `notice_stored_photo1` VARCHAR(45) NULL,
  `notice_type` VARCHAR(20) NULL,
  PRIMARY KEY (`notice_num`))
COMMENT = 'Notice board';
 */

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private Date notice_reg_date;
	// About File-upload
	private String notice_stored_photo1;
	private String notice_type;
	
	// About reply
}
