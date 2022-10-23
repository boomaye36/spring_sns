<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div class="container">
			<form id="signUpForm" method="post" action="/user/sign_up">
			<h2 class="font-weight-bold">회원가입 </h2>
			<div class="form-group">
				<label for="userId">ID</label>
				<div class="d-flex">
					
					<input type="text" id="loginId" name="loginId" class="form-control" placeholder="ID를 입력해주세요 ">
					<button type="button" id="duplicateBtn" class="btn btn-info ml-3">중복 확인 </button>
				</div>
				<div id="idcheckLength" class="small text-danger d-none">4자 이상으로 입력하세요.</div>
				<div id="duplicateNo" class="small text-danger d-none">중복된 아이디입니다 .</div>
				<div id="confirmOk" class="small text-success d-none">사용 가능한 아이디입니다 .</div>
				<label for="userPw">password</label>
				<input type="password" id="userPw" name="userPw" class="form-control">
				
				<label for="userPwConfirm">confirm password</label>
				<input type="password" id="userPwConfirm" name="userPwConfirm" class="form-control">
				
				<label for="name">이름 </label>
				<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요.">
				
				<label for="email ">이메일 </label>
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요.">
				
				<button type="submit" id="signupBtn" class="btn btn-info mt-3">가입하기 </button>
			</div>
			</form>	
	</div>
</div>
<script>
$(document).ready(function(){
	$('#duplicateBtn').on('click', function(){
		let loginId = $('#loginId').val().trim();
	if (loginId.length < 4){
		$('#idcheckLength').removeClass('d-none');
		$('#duplicateNo').addClass('d-none');
		$('#confirmOk').addClass('d-none');
		return;
	}
	$.ajax({
		url:"/user/is_duplicated_id"
		,data:{"loginId":loginId}
		,success:function(data){
			if (data.result == true){
				// 중복일 때
				$('#idCheckLength').addClass('d-none'); //경고문구 노출
				$('#duplicateNo').removeClass('d-none'); 
				$('#confirmOk').addClass('d-none'); 
			}else{
				$('#idCheckLength').addClass('d-none'); //경고문구 노출
				$('#duplicateNo').addClass('d-none'); 
				$('#confirmOk').removeClass('d-none'); 				
		}
		}
	, error:function(e){
		alert("아이디 중복확인에 실패했습니다.");
	}
	});
});
	
	$('#signupBtn').on('submit', function(e){
		e.preventDefault();
		let loginId = $('#loginId').val().trim();
		let userPw = $('#userPw').val().trim();
		let userPwConfirm = $('#userPwConfirm').val().trim();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		if (loginId == ''){
			 alert("아이디를 입력하세요");
			 return false;
		 }
		 if (userPw == '' || userPwConfirm==''){
			 alert("비밀번호를 입력하세요");
			 return false;
		 }
		 if (userPw != userPwConfirm){
			 alert("비밀번호가 일치하지 않습니다");
			 return false;
		 }
		 if (name == ''){
			 alert("이름을 입력하세요");
			 return false;
		 }
		 if (email == ''){
			 alert("이메일을 입력하세요");
			 return false;

		 }
		 if ($('#confirmOk').hasClass('d-none') === true){
				alert("아이디 중복확인을 다시 해주세요.");
				return;
			}
		 //$(this)[0].submit();
		 let url = $(this).attr('action');
		 let params = $(this).serialize();
<<<<<<< HEAD
		// console.log(params);
		//alert(params);
=======
		 console.log(params);
>>>>>>> 5e09560db0c3751dba53645d254c2e3083e3c503
		 $.post(url, params)
			.done(function(data) {
				if (data.code == 100){
					alert("가입을 환영합니다! 로그인해주세요.");
					location.href="/user/sign_in_view";
				}else{
					alert("가입에 실패했습니다.");
				}
		 });

	});
});
</script>