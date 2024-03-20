package com.ace.schedule;

import java.sql.Date;

public class ScheduleDTO {
	
	private int idx;
	private int com_idx;
	private String sort;
	private String title;
	private String content;
	private Date sdate;
	private String stime;
	private String etime;
	
	public ScheduleDTO() {
		// TODO Auto-generated constructor stub
	}

	public ScheduleDTO(int idx, int com_idx, String sort, String title, String content, Date sdate, String stime,
			String etime) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.sort = sort;
		this.title = title;
		this.content = content;
		this.sdate = sdate;
		this.stime = stime;
		this.etime = etime;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}
	
	
}
