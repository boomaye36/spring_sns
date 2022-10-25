<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		<%-- 글쓰기 영역 --%>
		<div class="write-box border rounded m-3">
			<textarea id="writeTextArea" placeholder="내용을 입력해주세요" class="w-100 border-0"></textarea>
				
			<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
			<div class="d-flex justify-content-between">
				<div class="file-upload d-flex">
					<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
					<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="ml-2">
					</div>
				</div>
				<button id="writeBtn" class="btn btn-info">게시</button>
			</div>
		</div>
		<%--// 글쓰기 영역 끝 --%>
		
		<%-- 타임라인 영역 --%>
		<div class="timeline-box my-5">
			<%-- 카드1 --%>
			<div class="card border rounded mt-3">
				<%-- 글쓴이, 더보기(삭제) --%>
				<div class="p-2 d-flex justify-content-between">
					<span class="font-weight-bold">글쓴이명</span>
					<a href="#" class="more-btn">
						<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
					</a>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="card-img">
					<img src="" class="w-100" alt="본문 이미지">
				</div>
				
				<%-- 좋아요 --%>
				<div class="card-like m-3">
					<a href="#" class="like-btn">
						<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18px" height="18px" alt="empty heart">
						<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18px" height="18px" alt="filled heart">
						
						좋아요 10개
					</a>
				</div>
				
				<%-- 글 --%>
				<div class="card-post m-3">
					<span class="font-weight-bold">글쓴이명</span>
					<span>글 내용</span>
				</div>
				
				<%-- 댓글 --%>
				<div class="card-comment-desc border-bottom">
					<div class="ml-3 mb-1 font-weight-bold">댓글</div>
				</div>
				<div class="card-comment-list m-2">
					<%-- 댓글 목록 --%>
					<div class="card-comment m-1">
						<span class="font-weight-bold">댓글쓴이:</span>
						<span>댓글 내용</span>
						
						<%-- 댓글 삭제 버튼 --%>
						<a href="#" class="commentDelBtn">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
					</div>
					
					<%-- 댓글 쓰기 --%>
					<div class="comment-write d-flex border-top mt-2">
						<input type="text" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
						<button type="button" class="commentBtn btn btn-light">게시</button>
					</div>
				</div>
			</div> <%--// 카드1 닫기 --%>
		</div> <%--// 타임라인 영역 닫기  --%>
	</div>
</div>

<script>
$(document).ready(function() {
	// 파일 업로드 이미지(a) 클릭 => 파일 선택 창이 떠야함
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault();  // a태그의 기본 동작 멈춤(화면이 위로 올라가는 것 방지)
		$('#file').click(); // input file을 클릭한 것과 같은 효과
	});
	
	// 사용자가 파일업로드를 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출
	$('#file').on('change', function(e) {
		//alert("체인지");
		
		let fileName = e.target.files[0].name; // ex) cat-g4c8e76014_640.jpg
		alert(fileName);
		let ext = fileName.split('.').pop().toLowerCase();
		
		// 확장자 유효성 확인
		if (fileName.split('.').length < 2 || 
				( ext!= 'gif'
						&& ext != 'png'
							&& ext != 'jpg'
								&& ext != 'jpeg')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val(''); // 파일 태그에 실제 파일 제거
			$('#fileName').text(''); // 파일 이름 비우기
			return;
		}
		
		// 상자에 업로드 된 이름 노출
		$('#fileName').text(fileName)
	});
	$('#writeBtn').on('click', function(){
		let writeTextArea = $('#writeTextArea').val().trim();
		if (writeTextArea == ''){
			alert("내용을 입력하세요");
			return;
		}
		let formData = new FormData();
		formData.append("writeTextArea", writeTextArea);
		formData.append("file", $('#file')[0].file[0]);
		
		$.ajax({
			type:"POST"
			,url:"/post/create"
			,data:formData
			,enctype:"multipart/form-data"
			,processData:false
			,contentType:false
			
			,success:function(data){
				if (data.code == 100){ // 성공
					alert("메모가 저장되었습니다.");
					location.href="/post/post_create_view"
				}else{
					alert(data.errorMessage); // 실패
				}
			}
		,	error:function(e){
				alert("메모 저장에 실패했습니다.");
		}
		});
	});
	
	
});
</script>