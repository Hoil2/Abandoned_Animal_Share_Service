package com.spring.ex.dto;

import java.sql.Date;

public class MemberPetDTO {
	private int mp_id;
	private int m_id;
	private String name;
	private String sex;
	private String age;
	private String kind;
	private String breed;
	private Date reg_date;
	
	public int getMp_id() {
		return mp_id;
	}
	public void setMp_id(int mp_id) {
		this.mp_id = mp_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MemberPetDTO [mp_id=" + mp_id + ", m_id=" + m_id + ", name=" + name + ", sex=" + sex + ", age=" + age
				+ ", kind=" + kind + ", breed=" + breed + ", reg_date=" + reg_date + "]";
	}
}
