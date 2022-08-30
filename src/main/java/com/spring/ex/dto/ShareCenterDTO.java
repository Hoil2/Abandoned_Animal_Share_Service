package com.spring.ex.dto;

public class ShareCenterDTO {
	private int ani_id;
	private String desertion_no;
	private String filename;
	private Object happen_dt;
	private String happen_place;
	private String kind_cd;
	private String color_cd;
	private String age;
	private String weight;
	private String notice_no;
	private Object notice_sdt;
	private Object notice_edt;
	private String popfile;
	private String process_state;
	private String sex_cd;
	private String neuter_yn;
	private String special_mark;
	private int hit;
	private int aas_id;
	private Object redate;
	
	public int getAni_id() {
		return ani_id;
	}
	public void setAni_id(int ani_id) {
		this.ani_id = ani_id;
	}
	public String getDesertion_no() {
		return desertion_no;
	}
	public void setDesertion_no(String desertion_no) {
		this.desertion_no = desertion_no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Object getHappen_dt() {
		return happen_dt;
	}
	public void setHappen_dt(Object happen_dt) {
		this.happen_dt = happen_dt;
	}
	public String getHappen_place() {
		return happen_place;
	}
	public void setHappen_place(String happen_place) {
		this.happen_place = happen_place;
	}
	public String getKind_cd() {
		return kind_cd;
	}
	public void setKind_cd(String kind_cd) {
		this.kind_cd = kind_cd;
	}
	public String getColor_cd() {
		return color_cd;
	}
	public void setColor_cd(String color_cd) {
		this.color_cd = color_cd;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public Object getNotice_sdt() {
		return notice_sdt;
	}
	public void setNotice_sdt(Object notice_sdt) {
		this.notice_sdt = notice_sdt;
	}
	public Object getNotice_edt() {
		return notice_edt;
	}
	public void setNotice_edt(Object notice_edt) {
		this.notice_edt = notice_edt;
	}
	public String getPopfile() {
		return popfile;
	}
	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}
	public String getProcess_state() {
		return process_state;
	}
	public void setProcess_state(String process_state) {
		this.process_state = process_state;
	}
	public String getSex_cd() {
		return sex_cd;
	}
	public void setSex_cd(String sex_cd) {
		this.sex_cd = sex_cd;
	}
	public String getNeuter_yn() {
		return neuter_yn;
	}
	public void setNeuter_yn(String neuter_yn) {
		this.neuter_yn = neuter_yn;
	}
	public String getSpecial_mark() {
		return special_mark;
	}
	public void setSpecial_mark(String special_mark) {
		this.special_mark = special_mark;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Object getRedate() {
		return redate;
	}
	public void setRedate(Object redate) {
		this.redate = redate;
	}
	public int getAas_id() {
		return aas_id;
	}
	public void setAas_id(int aas_id) {
		this.aas_id = aas_id;
	}
	@Override
	public String toString() {
		return "ShareCenterDTO [ani_id=" + ani_id + ", desertion_no=" + desertion_no + ", filename=" + filename
				+ ", happen_dt=" + happen_dt + ", happen_place=" + happen_place + ", kind_cd=" + kind_cd + ", color_cd="
				+ color_cd + ", age=" + age + ", weight=" + weight + ", notice_no=" + notice_no + ", notice_sdt="
				+ notice_sdt + ", notice_edt=" + notice_edt + ", popfile=" + popfile + ", process_state="
				+ process_state + ", sex_cd=" + sex_cd + ", neuter_yn=" + neuter_yn + ", special_mark=" + special_mark
				+ ", hit=" + hit + ", aas_id=" + aas_id + ", redate=" + redate + "]";
	}
}