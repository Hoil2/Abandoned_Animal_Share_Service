package com.spring.ex.dto;

public class EmailAlarmConditionDTO {
	private int m_id;
	private String kind;
	private String breed;
	private String age;
	private String sex;
	private String neuter_yn;
	private String region;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNeuter_yn() {
		return neuter_yn;
	}
	public void setNeuter_yn(String neuter_yn) {
		this.neuter_yn = neuter_yn;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	@Override
	public String toString() {
		return "EmailAlarmConditionDTO [m_id=" + m_id + ", kind=" + kind + ", breed=" + breed + ", age=" + age
				+ ", sex=" + sex + ", neuter_yn=" + neuter_yn + ", region=" + region + "]";
	}
}
