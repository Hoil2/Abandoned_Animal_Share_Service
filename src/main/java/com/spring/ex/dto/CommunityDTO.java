package com.spring.ex.dto;

import java.sql.Date;

public class CommunityDTO {
	private int cb_id;
	private int m_id;
	private int mp_id;
	private String title;
	private String content;
	private int hit;
	private Date reg_date;
	private int classify;
	private int enable;
	
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
	public int getMp_id() {
		return mp_id;
	}
	public void setMp_id(int mp_id) {
		this.mp_id = mp_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getClassify() {
		return classify;
	}
	public void setClassify(int classify) {
		this.classify = classify;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "CommunityDTO [cb_id=" + cb_id + ", m_id=" + m_id + ", mp_id=" + mp_id + ", title=" + title
				+ ", content=" + content + ", hit=" + hit + ", reg_date=" + reg_date + ", classify=" + classify
				+ ", enable=" + enable + "]";
	}
}
