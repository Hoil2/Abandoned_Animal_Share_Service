package com.spring.ex.dto;

public class EmailAlarmDTO {
	private int ea_id;
	private int m_id;
	private String desertion_no;
	private int ea_classify;
	
	public int getEa_id() {
		return ea_id;
	}
	public void setEa_id(int ea_id) {
		this.ea_id = ea_id;
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
	public int getEa_classify() {
		return ea_classify;
	}
	public void setEa_classify(int ea_classify) {
		this.ea_classify = ea_classify;
	}
	@Override
	public String toString() {
		return "EmailAlarmDTO [ea_id=" + ea_id + ", m_id=" + m_id + ", desertion_no=" + desertion_no + ", ea_classify="
				+ ea_classify + "]";
	}
}

