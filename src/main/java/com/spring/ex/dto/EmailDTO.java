package com.spring.ex.dto;

public class EmailDTO {
	private String from;
	private String to;
	private String subject;
	private String contents;
	
	public EmailDTO(String from, String to, String subject, String contents) {
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.contents = contents;
	}
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "EmailDTO [from=" + from + ", to=" + to + ", subject=" + subject + ", contents=" + contents + "]";
	}
}
