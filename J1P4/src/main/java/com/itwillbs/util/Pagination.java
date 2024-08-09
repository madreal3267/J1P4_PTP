package com.itwillbs.util;

import lombok.Data;

// 페이징 관련 정보 보유

@Data
public class Pagination {
	private int totalRecords; // 총 레코드 수
    private int currentPage; // 현재 페이지
    private int pageSize; // 현 페이지에 표시될 레코드 수
    private int totalPages; // 총 페이지 수
    private int startRecord; // 현재 페이지의 시작 레코드 인덱스
    private int endRecord; // 현재 페이지의 마지막 레코드 인덱스
    private int startPage; // 페이지 블록의 시작 번호
    private int endPage; // 페이지 블록의 마지막 번호
    private static final int PAGE_BLOCK_SIZE = 3; // 페이지 블록의 크기

    public Pagination(int totalRecords, int currentPage, int pageSize) {
        this.totalRecords = totalRecords;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalPages = (int) Math.ceil((double) totalRecords / pageSize); // 총페이지의 수 계산
        this.startRecord = (currentPage - 1) * pageSize; // 시작 레코드 인덱스 계산
        this.endRecord = Math.min(startRecord + pageSize, totalRecords); // 끝 레코드 인덱스 계산

        // 현재 블록 계산
        int currentBlock = (int) Math.ceil((double) currentPage / PAGE_BLOCK_SIZE);
        this.startPage = (currentBlock - 1) * PAGE_BLOCK_SIZE + 1; // 시작 페이지 번호 계산
        this.endPage = Math.min(startPage + PAGE_BLOCK_SIZE - 1, totalPages); // 끝 페이지 번호 계산
    }
    
    public boolean hasPreviousPageBlock() {
        return startPage > 1; // 이전 페이지 블록이 있는지 확인
    }

    public boolean hasNextPageBlock() {
        return endPage < totalPages; // 다음 페이지 블록이 있는지 확인
    }
}
