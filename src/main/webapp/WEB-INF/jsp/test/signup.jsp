<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
<title>회원가입 화면 </title>
</head>
<body>
	<div class="container">
		<header class="bg-secondary">
			<h2>회원가입  </h2>
		</header>
		<section>
			<div class="form-group">
				<label for="userId">ID</label>
				<div class="d-flex">
					
					<input type="text" id="userId" name="userId" class="form-control" placeholder="ID를 입력해주세요 ">
					<button type="button" id="duplicateBtn" class="btn btn-info ml-3">중복 확인 </button>
				</div>
				<span class="small text-danger d-none">이미 사용중인 아이디입니다. </span>
				<label for="userPw">password</label>
				<input type="password" id="userPw" name="userPw" class="form-control">
				
				<label for="userPwConfirm">confirm password</label>
				<input type="password" id="userPwConfirm" name="userPwConfirm" class="form-control">
				
				<label for="name">이름 </label>
				<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요.">
				
				<label for="email ">이메일 </label>
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요.">
				
				<button type="button" id="signupBtn" class="btn btn-info mt-3">가입하기 </button>
			</div>
				
		</section>
	</div>
</body>
</html>