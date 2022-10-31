package com.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;


@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	public int deletePost(int postId, int userId) {
		
		Post post = get
		//Transactional => 하나의 수행 단위로 만들어 중간에 롤백되는거 방지
		
		// 기존글 가져오기
		
		// 이미지가 있으면 이미지 삭제
		
		// 글 삭제
		
		// 좋아요들 삭제
		
		// 댓글들 삭제
	}
}
	