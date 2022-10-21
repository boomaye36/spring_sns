package com.sns.user.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	public boolean existingLoginId(String loginId);

	public int insertUser(String loginId, String userPw, String name, String email);
}
