package com.spring.ex.dto;

public class FileUploadDTO {
	private int fu_id;
	private int cb_id;
	private String url;
	
	public int getFu_id() {
		return fu_id;
	}
	public void setFu_id(int fu_id) {
		this.fu_id = fu_id;
	}
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "FileUploadDTO [fu_id=" + fu_id + ", cb_id=" + cb_id + ", url=" + url + "]";
	}
}
