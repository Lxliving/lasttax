package com.tax.vo;

import java.util.*;

public class share {
	private int shareID;
	private String shareName;
	private int seenNum;
	private int keptNum;
	private Date date;			//in mysql parameter 'date' has its own format
	private String text;			//detail about the shared information
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getKeptNum() {
		return keptNum;
	}

	public void setKeptNum(int kept) {
		this.keptNum = kept;
	}

	public int getSeenNum() {
		return seenNum;
	}

	public void setSeenNum(int seen) {
		this.seenNum = seen;
	}

	public String getShareName() {
		return shareName;
	}

	public void setShareName(String shareName) {
		this.shareName = shareName;
	}

	public int getShareID() {
		return shareID;
	}

	public void setShareID(int shareID) {
		this.shareID = shareID;
	}
}
