package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class NoteTaker
{
	@Id
	private int id;
	private String title;
	private String content;
	private Date adddDate;
	
	public NoteTaker() 
	{
		super();
	}
	
	public NoteTaker(String title, String content, Date adddDate)
	{
		super();
		this.id = new Random().nextInt(1000000);
		this.title = title;
		this.content = content;
		this.adddDate = adddDate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAdddDate() {
		return adddDate;
	}
	public void setAdddDate(Date adddDate) {
		this.adddDate = adddDate;
	}
}
