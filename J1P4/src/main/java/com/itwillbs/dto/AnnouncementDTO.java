package com.itwillbs.dto;

import java.util.Date;

import lombok.Data;


@Data
public class AnnouncementDTO {
	private int announcement_id; // 공지사항 ID
    private String title; // 공지사항 제목
    private String content; // 공지사항 내용
    private String manager_id; // 작성자 관리자 ID
    private Date created_at; // 생성 날짜
}
