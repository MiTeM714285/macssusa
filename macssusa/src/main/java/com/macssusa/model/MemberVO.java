package com.macssusa.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String password;
	private String nickname;
	private String email;
	private Timestamp regdate;
	private int available;
	private int ismanager;
}
