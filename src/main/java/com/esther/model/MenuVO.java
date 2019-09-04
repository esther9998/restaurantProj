package com.esther.model;

public class MenuVO {
	
	
	int idx;
	int priority;
	int status;
	int category;
	
	String menu_title;
	String menu_price;
	String menu_content;
	String menu_serverImgFile;
	String menu_userImgNm;
	String start_date;
	String end_date;
	String create_at;
	String update_at;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getMenu_title() {
		return menu_title;
	}
	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_content() {
		return menu_content;
	}
	public void setMenu_content(String menu_content) {
		this.menu_content = menu_content;
	}
	public String getmenu_serverImgFile() {
		return menu_serverImgFile;
	}
	public void setmenu_serverImgFile(String menu_serverImgFile) {
		this.menu_serverImgFile = menu_serverImgFile;
	}
	public String getmenu_userImgNm() {
		return menu_userImgNm;
	}
	public void setmenu_userImgNm(String menu_userImgNm) {
		this.menu_userImgNm = menu_userImgNm;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
	@Override
	public String toString() {
		return "MenuVO [idx=" + idx + ", priority=" + priority + ", status=" + status + ", category=" + category
				+ ", menu_title=" + menu_title + ", menu_price=" + menu_price + ", menu_content=" + menu_content
				+ ", menu_serverImgFile=" + menu_serverImgFile + ", menu_userImgNm=" + menu_userImgNm
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", create_at=" + create_at + ", update_at="
				+ update_at + "]";
	}
	

	
}
