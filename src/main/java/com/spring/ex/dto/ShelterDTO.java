package com.spring.ex.dto;

public class ShelterDTO {
	private int aas_id;
	private String care_nm;
	private String care_tel;
	private Object care_addr;
	private String org_nm;
	private String charge_nm;
	private String officetel;
	public int getAas_id() {
		return aas_id;
	}
	public void setAas_id(int aas_id) {
		this.aas_id = aas_id;
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
	public Object getCare_addr() {
		return care_addr;
	}
	public void setCare_addr(Object care_addr) {
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
}