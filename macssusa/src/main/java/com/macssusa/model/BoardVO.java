package com.macssusa.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bnum;
	private int btype;
	private String title; 
	private String content;
	private String memberid;
	private Timestamp regdate;
	private int available;
	private int hitcount;
	private int replycnt;
	private String ip;
	private String filename1;
	private String filename2;
	private String filename3;
	private String filename4;
	private String filename5;

}
