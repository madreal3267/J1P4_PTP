package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dto.AnnouncementDTO;

public interface AnnouncementService {
	void createAnnouncement(AnnouncementDTO announcement);
    List<AnnouncementDTO> getAllAnnouncements();
    AnnouncementDTO getAnnouncementById(int announcementId);
    List<AnnouncementDTO> getLatestNotices(int limit);
}
