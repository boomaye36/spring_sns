package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	@PostMapping("/create")
	
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session){
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		Map<String, Object>result = new HashMap<>();
		if (userId == null) {
			result.put("code", 200);
			return result;
		}
		int row = postBO.addPost(userId, userLoginId, content, file);
		
		if (row > 0) {
			result.put("code", 100); // 성공
			result.put("result", "success");
		}else {
			result.put("code", 400);
			result.put("errorMessage", "메모 저장에 실패했습니다. 관리자에게 문의하세요.");
		}
		
		
		return result;
	}
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			HttpSession session){
		int userId = (int)session.getAttribute("userId");

		// DB 삭제
		int deleteRow = postBO.deletePost(postId, userId);
		// 응답
		Map<String, Object> result = new HashMap<>();
		if (deleteRow > 0) {
			result.put("code", 100);
			result.put("result", "success");
		}else {
			result.put("code", 400);
			result.put("errorMessage", "글 삭제에 실패했습니다.");
		}
		return result;
	}
}
