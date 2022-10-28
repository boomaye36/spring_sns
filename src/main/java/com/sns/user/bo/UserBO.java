package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;


@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	public boolean existLoginId(String loginId) {
		return userDAO.existingLoginId(loginId);
	}
	public void addUser(String loginId, String userPw,String name,String email) {
		 userDAO.insertUser(loginId, userPw, name, email);
				
	}
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
}
