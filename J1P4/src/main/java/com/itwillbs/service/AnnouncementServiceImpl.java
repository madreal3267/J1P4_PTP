package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dto.AnnouncementDTO;
import com.itwillbs.persistence.AnnouncementDAO;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {
	@Inject
    private AnnouncementDAO announcementDAO;

    @Override
    public void createAnnouncement(AnnouncementDTO announcement) {
        announcementDAO.insertAnnouncement(announcement);
    }

    @Override
    public List<AnnouncementDTO> getAllAnnouncements() {
        return announcementDAO.getAllAnnouncements();
    }

    @Override
    public AnnouncementDTO getAnnouncementById(int announcementId) {
        return announcementDAO.getAnnouncementById(announcementId);
    }
    
    @Override
    public List<AnnouncementDTO> getLatestNotices(int limit) {
        return announcementDAO.getLatestNotices(limit);
    }
}
