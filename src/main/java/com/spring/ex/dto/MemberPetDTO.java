package com.spring.ex.dto;

public class MemberPetDTO {
	private int mp_id;
	private int m_id;
	private String desertion_no;
	private String pet_name;
	
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
	public String getDesertion_no() {
		return desertion_no;
	}
	public void setDesertion_no(String desertion_no) {
		this.desertion_no = desertion_no;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	@Override
	public String toString() {
		return "MemberPetDTO [mp_id=" + mp_id + ", m_id=" + m_id + ", desertion_no=" + desertion_no + ", pet_name="
				+ pet_name + "]";
	}
}
