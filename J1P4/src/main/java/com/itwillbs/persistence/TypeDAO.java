package com.itwillbs.persistence;

import com.itwillbs.domain.TypeVO;

public interface TypeDAO {
	
	// 유형/클라이언트,프리랜서 /회원가입성공여부
	public void updateType(TypeVO tvo);
	
	
}
