package com.spring.ex.dto;

public class MemberPetEmailAlarmDTO {
	private int mpea_id;
	private int m_id;
	private int mp_id;
	
	public int getMpea_id() {
		return mpea_id;
	}
	public void setMpea_id(int mpea_id) {
		this.mpea_id = mpea_id;
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
	@Override
	public String toString() {
		return "MemberPetEmailAlarmDTO [mpea_id=" + mpea_id + ", m_id=" + m_id + ", mp_id=" + mp_id + "]";
	}
}

