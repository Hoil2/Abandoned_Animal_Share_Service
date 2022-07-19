package com.spring.ex.dto;

import java.sql.Date;

public class CommentDTO {
	private int cbr_id;
	private int cb_id;
	private int m_id;
	private String cbr_content;
	private Date reg_date;
	
	public int getCbr_id() {
		return cbr_id;
	}
	public void setCbr_id(int cbr_id) {
		this.cbr_id = cbr_id;
	}
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getCbr_content() {
		return cbr_content;
	}
	public void setCbr_content(String cbr_content) {
		this.cbr_content = cbr_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "CommentDTO [cbr_id=" + cbr_id + ", cb_id=" + cb_id + ", m_id=" + m_id + ", cbr_content=" + cbr_content
				+ ", reg_date=" + reg_date + "]";
	}
}
