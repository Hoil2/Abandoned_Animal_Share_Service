package com.spring.ex.dto;

public class LostAnimalDTO {
	private int alb_id;
	private int m_id;
	private String img_path;
	private String pet_name;
	private String kind_cd;
	private Object lost_date;
	private String lost_place;
	private String sex_cd;
	private String age;
	private String color_cd;
	private String content;
	private int enable;
	private Object reg_date;
	public int getAlb_id() {
		return alb_id;
	}
	public void setAlb_id(int alb_id) {
		this.alb_id = alb_id;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getKind_cd() {
		return kind_cd;
	}
	public void setKind_cd(String kind_cd) {
		this.kind_cd = kind_cd;
	}
	public Object getLost_date() {
		return lost_date;
	}
	public void setLost_date(Object lost_date) {
		this.lost_date = lost_date;
	}
	public String getLost_place() {
		return lost_place;
	}
	public void setLost_place(String lost_place) {
		this.lost_place = lost_place;
	}
	public String getSex_cd() {
		return sex_cd;
	}
	public void setSex_cd(String sex_cd) {
		this.sex_cd = sex_cd;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getColor_cd() {
		return color_cd;
	}
	public void setColor_cd(String color_cd) {
		this.color_cd = color_cd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public Object getReg_date() {
		return reg_date;
	}
	public void setReg_date(Object reg_date) {
		this.reg_date = reg_date;
	}
	
}