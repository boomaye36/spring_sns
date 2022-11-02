package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;
import com.sns.post.bo.PostBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private PostBO postBO;
	@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300); // 비로그인
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}
		
		commentBO.createComment(userId, postId, content);
		result.put("code", 100); // 성공
		result.put("result", "success");
		
		return result;
	}
	@DeleteMapping("/delete")
	public Map<String, Object>deleteComment(
			@RequestParam("postId") int postId,
			HttpSession session){
		int userId = (int)session.getAttribute("userId");
		commentBO.deleteCommentByPostId(postId);
		Map<String, Object>result = new HashMap<>();
		
		result.put("code", 100);
		result.put("result", "success");
		return result;
	}
}