package com.myproject.trytri.voes;

import java.sql.Date;

import lombok.Data;

//CREATE TABLE `trytri`.`tt_notice_reply` (
//		  `reply_num` INT NOT NULL AUTO_INCREMENT,
//		  `notice_num` INT NOT NULL,
//		  `reply_writer` VARCHAR(45) NULL,
//		  `reply_content` TEXT NULL,
//		  `reply_reg_date` DATE NULL,
//		  PRIMARY KEY (`reply_num`, `notice_num`),
//		  INDEX `notice_num_idx` (`notice_num` ASC) VISIBLE,
//		  CONSTRAINT `notice_num`
//		    FOREIGN KEY (`notice_num`)
//		    REFERENCES `trytri`.`tt_notice` (`notice_num`)
//		    ON DELETE CASCADE
//		    ON UPDATE NO ACTION)
//		COMMENT = '댓글 of Notice';


@Data
public class NReplyVO {
	private int reply_num;
	private int notice_num;
	private String member_id;
	private String reply_content;
	private Date reply_reg_date;
}
