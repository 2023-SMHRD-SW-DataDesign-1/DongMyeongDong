<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>memestagram</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/join.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <!-- jquery -->
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
</head>

<body>

    <div class="join_form">
        <div class="join_section">
            <div class="logo_div">
                <h1>memestagram</h1>
                <p>재미있는 컨텐츠를 즐기고 리워드를 <br>획득하기 위해서 가입하세요.</p>
            </div>
            <div class="form_div">
                <form action="JoinCon.do" method="post" onsubmit="return joinCheck() " enctype="multipart/form-data">
                    <div>
                        <input type="text" placeholder="사용자 이름 또는 계정" name="id" id="id_input">
                    </div>
                    <div>
                        <input type="password" placeholder="비밀번호" name="pw" id="pw_input">
                    </div>
                    <div>
                        <input type="password" placeholder="비밀번호 확인" name="pw_ck" id="pw_ck_input">
                    </div>
                    <div>
                        <input type="text" placeholder="이메일 주소" name="email" id="email">
                    </div>
                    <div>
                        <input type="submit" value="회원가입" id="submit_join">
                    </div>
                </form>
            </div>
            <div id="error">
            	<div id="iderror"></div>
            	<div id="pwerror"></div>
            	<div id="pwckerror"></div>
            	<div id="emailerror"></div>
            </div>
            <div class="join_div">
                <p>계정이 있으신가요? <a href="./Login.jsp" class="p_login">로그인</a></p>
            </div>
        </div>
    </div>
    

    
    <script type="text/javascript">
		//$(document).ready(function(){
			let check1 ="";
			let check2 ="";
			let check3 ="";
			let check4 ="";
			
			
			function joinCheck(){
				if(check1 == 1 && check2 == 1 && check3 == 1 && check4 == 1){
					alert("회원가입 성공");
					return true;
				}else{
					alert("잘못입력된 정보가 있습니다.");
					return false;
				}
			}
			
			$('#id_input').on("focusout",function(){
				let id = $('#id_input').val();
				let idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
				
				// 아이디 빈값 체크
				if(id == "" || id.length == 0){
					$('#id_input').focus();
					$('#iderror').html("아이디를 입력해주세요.");
					$('#error').css('color','red');
					//$('#id:focus').css('outline','red');
					
					return false;
				}else{
					
				}
				
				if(id.length < 5){
					$('#iderror').html("아이디를 5글자 이상 입력해주세요");
					$('#error').css('color','red');
					return false;
				}
				
				if(!idCheck.test(id)){
					$('#iderror').html("영문자로 시작하는 영문자 또는 숫자 6~20자를 입력해주세요.");
					$('#error').css('color','red');
					return false;
				}
				
				$.ajax({
					url : "IdCheckCon.do",
					type : "POST",
					dataType : "json",
					data : {"id" : id},
					success : function(result){
						if(result == 'Y'){
							$('#iderror').html("사용가능한 아이디입니다.");
							check1 = 1;
						}else{
							$('#iderror').html("중복된 아이디입니다.");
						}
					},
					fail : function(){
						alert("통신에 실패하였습니다.");
					}
				})
			})
		
		$('#pw_input').on("focusout",function(){	
			let pwdcheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			let pw = $('#pw_input').val();
			//console.log(pw);
			if (!pwdcheck.test(pw) || pw.length < 8) {
				$('#pwerror').html("비밀번호는 최소 8자리에 숫자, 문자, 특수문자 각 1개 이상 포함해주세요.");
				$('#error').css('color','red');
				
				return false;
			}else{
				$('#pwerror').html("");
				check2 = 1;
			}
				
			
		})	
			
		$('#pw_ck_input').on("focusout",function(){
			
			let pw = $('#pw_input').val();
			let pw_ck = $('#pw_ck_input').val();
			
			if(pw != pw_ck){
				$('#pwckerror').html("비밀번호가 일치하지 않습니다.");
				$('#pwckerror').css('color','red');
				
				return false;
			}else{
				$('#pwckerror').html("");
				check3 = 1;
			}
			
			
		})	
				
	
		$('#email').on("focusout",function(){
			
			let email = $('#email').val();
			
			// 이메일 형식 확인 정규표현식
			let emailcheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(email == ""){
				$('#emailerror').html("이메일을 입력해주세요.");
				$('#emailerror').css('color','red');
				
				
				return false;
			}
			
			if (!emailcheck.test(email) || email.length < 6) {
				$('#emailerror').html("잘못된 이메일 형식입니다.");
				$('#emailerror').css('color','red');
				
				return false;
			}else{
				$('#emailerror').html("");
				check4 = 1;
			}
		
		})
	</script>
</body>

</html>