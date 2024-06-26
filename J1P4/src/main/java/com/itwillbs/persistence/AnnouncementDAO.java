package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.AnnouncementDTO;

public interface AnnouncementDAO {
	void insertAnnouncement(AnnouncementDTO announcement); // 공지사항 삽입
    List<AnnouncementDTO> getAllAnnouncements(); // 모든 공지사항 조회
    AnnouncementDTO getAnnouncementById(int announcementId); // 공지사항 ID로 조회
    List<AnnouncementDTO> getLatestNotices(int limit); // limit 수 만큼 최신순으로 공지사항 조회
}
