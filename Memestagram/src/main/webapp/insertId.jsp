<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="join_form">
        <h1>회원가입 화면</h1>
        <p>친구들의 사진과 동영상을 보려면 가입하세요</p>

        <form action="snsJoinCon" method="post" enctype="multipart/form-data">
            <input type="text" placeholder="아이디" name="id" id="id">
            <br>
           
            프로필이미지 <input type="file" name="pro_img">
            <div id="error">
            	<div id="iderror"></div>
            </div>
            <button type="submit" onclick="joinCheck()">가입</button>
        </form>

        <p>계정이 있으신가요? <a href="./Login.jsp" class="">로그인</a></p>
    </div>
    
    <script type="text/javascript">
			
			let check1 ="";
			
			
			
			function joinCheck(){
				if(check1 == 1){
					alert("회원가입 성공");
					return true;
				}else{
					alert("잘못 입력된 정보가 있습니다.");
					return false;
				}
			}
			
			$('#id').on("focusout",function(){
				let id = $('#id').val();
				let idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
				
				// 아이디 빈값 체크
				if(id == "" || id.length == 0){
					$('#id').focus();
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
		
		
			
		
			
			
			
	
		
	</script>
</body>
</html>