package com.itwillbs.util;

import java.util.List;

import org.springframework.stereotype.Service;

// 페이징과 관련된 로직을 처리
@Service
public class PaginationService {
	// 주어진 전체 레코드 수, 현재 페이지, 페이지 크기를 바탕으로 Pagination 객체 생성
	public Pagination getPagination(int totalRecords, int currentPage, int pageSize) {
        return new Pagination(totalRecords, currentPage, pageSize);
    }
	
	// 전체 데이터 리스트에서 페이징된 데이터 서브리스트를 반환
    public <T> List<T> getPagedData(List<T> dataList, Pagination pagination) {
        int start = pagination.getStartRecord();
        int end = pagination.getEndRecord();
        return dataList.subList(start, end);
    }
}
