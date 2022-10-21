package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.bo.UserBO;

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
	@ResponseBody
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
			
			
			
	
	
}
