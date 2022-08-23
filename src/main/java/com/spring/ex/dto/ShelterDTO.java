package com.spring.ex.dto;

public class ShelterDTO {
	private int ans_id;
	private int ani_id;
	private String care_nm;
	private String care_tel;
	private String care_addr;
	private String org_nm;
	private String charge_nm;
	private String officetel;
	private String notice_comment;
	
	public int getAns_id() {
		return ans_id;
	}
	public void setAns_id(int ans_id) {
		this.ans_id = ans_id;
	}
	public int getAni_id() {
		return ani_id;
	}
	public void setAni_id(int ani_id) {
		this.ani_id = ani_id;
	}
	public String getCare_nm() {
		return care_nm;
	}
	public void setCare_nm(String care_nm) {
		this.care_nm = care_nm;
	}
	public String getCare_tel() {
		return care_tel;
	}
	public void setCare_tel(String care_tel) {
		this.care_tel = care_tel;
	}
	public String getCare_addr() {
		return care_addr;
	}
	public void setCare_addr(String care_addr) {
		this.care_addr = care_addr;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getCharge_nm() {
		return charge_nm;
	}
	public void setCharge_nm(String charge_nm) {
		this.charge_nm = charge_nm;
	}
	public String getOfficetel() {
		return officetel;
	}
	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}
	public String getNotice_comment() {
		return notice_comment;
	}
	public void setNotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}
	@Override
	public String toString() {
		return "ShelterDTO [ans_id=" + ans_id + ", ani_id=" + ani_id + ", care_nm=" + care_nm + ", care_tel=" + care_tel
				+ ", care_addr=" + care_addr + ", org_nm=" + org_nm + ", charge_nm=" + charge_nm + ", officetel="
				+ officetel + ", notice_comment=" + notice_comment + "]";
	}
}
