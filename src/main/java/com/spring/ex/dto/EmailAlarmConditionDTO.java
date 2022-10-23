package com.spring.ex.dto;

public class EmailAlarmConditionDTO {
	private int m_id;
	private String kinds;
	private String dog_breeds;
	private String cat_breeds;
	private String etc_breeds;
	private String ages;
	private String sexs;
	private String neuterings;
	private String shelter_ids;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public String getDog_breeds() {
		return dog_breeds;
	}
	public void setDog_breeds(String dog_breeds) {
		this.dog_breeds = dog_breeds;
	}
	public String getCat_breeds() {
		return cat_breeds;
	}
	public void setCat_breeds(String cat_breeds) {
		this.cat_breeds = cat_breeds;
	}
	public String getEtc_breeds() {
		return etc_breeds;
	}
	public void setEtc_breeds(String etc_breeds) {
		this.etc_breeds = etc_breeds;
	}
	public String getAges() {
		return ages;
	}
	public void setAges(String ages) {
		this.ages = ages;
	}
	public String getSexs() {
		return sexs;
	}
	public void setSexs(String sexs) {
		this.sexs = sexs;
	}
	public String getNeuterings() {
		return neuterings;
	}
	public void setNeuterings(String neuterings) {
		this.neuterings = neuterings;
	}
	public String getShelter_ids() {
		return shelter_ids;
	}
	public void setShelter_ids(String shelter_ids) {
		this.shelter_ids = shelter_ids;
	}
	@Override
	public String toString() {
		return "EmailAlarmConditionDTO [m_id=" + m_id + ", kinds=" + kinds + ", dog_breeds=" + dog_breeds
				+ ", cat_breeds=" + cat_breeds + ", etc_breeds=" + etc_breeds + ", ages=" + ages + ", sexs=" + sexs
				+ ", neuterings=" + neuterings + ", shelter_ids=" + shelter_ids + "]";
	}
}
