package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.dto.AnnouncementDTO;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	@Autowired
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.AdminMapper";

    @Override
    public void insertAnnouncement(AnnouncementDTO announcement) {
        sqlSession.insert(namespace + ".insertAnnouncement", announcement);
    }

    @Override
    public List<AnnouncementDTO> getAllAnnouncements() {
        return sqlSession.selectList(namespace + ".getAllAnnouncements");
    }

    @Override
    public AnnouncementDTO getAnnouncementById(int announcementId) {
        return sqlSession.selectOne(namespace + ".getAnnouncementById", announcementId);
    }
    
    @Override
    public List<AnnouncementDTO> getLatestNotices(int limit) {
        return sqlSession.selectList(namespace + ".getLatestNotices", limit);
    }
}
