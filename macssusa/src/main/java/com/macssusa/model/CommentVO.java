package com.macssusa.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class CommentVO {
	
	private int cnum;
	private String content;
	private Timestamp regdate;
	private String memberid;
	private int bnum;
	private int available;
	private String ip;
	
	private List<String> title;
	private List<Integer> btype;
	private List<Integer> boardAvailable;
}
