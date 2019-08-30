package com.esther.model;

public class PromotionVO {
	
	int idx;
	int priority;
	int status;
	String promo_title;
	String promo_price;
	String promo_content;
	String promo_imgNm;
	String promo_uuid;
	String promo_userFile;
	String start_date;
	String end_date;
	String create_at;
	String update_at;
	
	public String getPromo_userFile() {
		return promo_userFile;
	}
	public void setPromo_userFile(String promo_userFile) {
		this.promo_userFile = promo_userFile;
	}
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
	public String getPromo_title() {
		return promo_title;
	}
	public void setPromo_title(String promo_title) {
		this.promo_title = promo_title;
	}
	public String getPromo_price() {
		return promo_price;
	}
	public void setPromo_price(String promo_price) {
		this.promo_price = promo_price;
	}
	public String getPromo_content() {
		return promo_content;
	}
	public void setPromo_content(String promo_content) {
		this.promo_content = promo_content;
	}
	public String getPromo_imgNm() {
		return promo_imgNm;
	}
	public void setPromo_imgNm(String promo_imgNm) {
		this.promo_imgNm = promo_imgNm;
	}
	public String getPromo_uuid() {
		return promo_uuid;
	}
	public void setPromo_uuid(String promo_uuid) {
		this.promo_uuid = promo_uuid;
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
		return "PromotionVO [idx=" + idx + ", priority=" + priority + ", status=" + status + ", promo_title="
				+ promo_title + ", promo_price=" + promo_price + ", promo_content=" + promo_content + ", promo_imgNm="
				+ promo_imgNm + ", promo_uuid=" + promo_uuid + ", promo_userFile=" + promo_userFile + ", start_date="
				+ start_date + ", end_date=" + end_date + ", create_at=" + create_at + ", update_at=" + update_at + "]";
	}
}
