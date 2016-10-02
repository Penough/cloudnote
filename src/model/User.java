package model;

import java.io.InputStream;

import com.mysql.jdbc.Blob;

public class User {
	private String id;
	private InputStream scul;
	private String text;
	private String phonenum;
	private String name;
	private String role;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public InputStream getScul() {
		return scul;
	}
	public void setScul(InputStream inputStream) {
		this.scul = inputStream;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	

}
