package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.bo.UserBO;
import com.sns.user.common.EncryptUtils;
import com.sns.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId")String loginId){
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existLoginId(loginId);
		if (isDuplicated) {
			result.put("result", true);
			result.put("code", 100);
		}else {
			result.put("errorMessege", false);
			result.put("code", 100);
		}
		return result;
	}
	@PostMapping("/sign_up")
	public Map<String, Object> addUser(
			@RequestParam("loginId") String loginId,
			@RequestParam("userPw") String userPw,
			@RequestParam("name") String name,
			@RequestParam("email") String email){
		String encryptPassword = EncryptUtils.md5(userPw);
		userBO.addUser(loginId, encryptPassword, name, email);
		Map<String, Object>result = new HashMap<>();
		result.put("code", 100);
		result.put("result", "success");
		return result;
	}
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request			){
		
		String encryptPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		Map<String, Object> result = new HashMap<>();
		if (user != null) { //로그인
			result.put("code", 100);
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
		}else { 
			result.put("code", 400);// 실패
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		return result;
		
	}		
			
			
	
	
}
