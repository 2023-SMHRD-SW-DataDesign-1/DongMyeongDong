<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="css/login.css" />
<!-- Boxicons CSS -->
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<script
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<body>

    <div class="login_form">
        <div class="image_section">
            <img src="image/instagram_login.png" alt="">
        </div>
        <div class="login_section">
            <div class="logo_div">
                <h1>memestagram</h1>
            </div>
            <div class="form_div">
                
                    <div>
                        <input type="text" placeholder="사용자 이름 또는 이메일" name="id" id="id_input">
                    </div>
                    <div>
                        <input type="password" placeholder="비밀번호" name="pw" id="pw_input">
                    </div>
                    <div>
                        <input type="submit" value="로그인" id="submit_login">
                    </div>
                    <div>
                        <button id="naver_id_login">네이버 로그인</button>
                    </div>
                    <div>
                        <button id="kakao-login-btn">카카오 로그인</button>
                    </div>
                
            </div>


            <div class="join_div">
                <p>계정이 없으신가요? <a href="./Join.jsp" class="p_join">가입하기</a></p>
            </div>
        </div>
    </div>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		$('#submit_login').on('click',function(){
			let id = $('#id_input').val();
			let pw = $('#pw_input').val();
			
			
			$.ajax({
				url : "LoginCon.do",
				type : "POST",
				data : {"id" : id,"pw":pw},
				datatype : 'json',
				success : function(data){
					if(data == 'Y'){
						
						location.href = "Home.jsp";
					}else if(data == 'N'){
						
						alert("존재하지 않는 회원입니다.")
						location.href = "Login.jsp";
					}
				},
				
				error : function(data){
					alert("통신 실패 로그인");
				}
				
			});
		})
	</script>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("xrSyb5GTqUoKNqtl6LnH",
				"http://localhost:8081/maven/NaverLogin.jsp");
		var state = naver_id_login.getUniqState();

		/* naver_id_login.setButton("green", 3, 65); */
		naver_id_login.setDomain("http://localhost:8081/maven/Login.jsp");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

	<script type="text/javascript">
		Kakao.init('ffaba3cad1608806d9940769fa4c7c8b'); // 사용하려는 앱의 JavaScript 키 입력

		$("#kakao-login-btn").on("click",function() {
			//1. 로그인 시도
			Kakao.Auth.login({
				success : function(authObj) {

							//2. 로그인 성공시, API 호출
					Kakao.API.request({
						url : '/v2/user/me',
						data : { property_keys : ["kakao_account.email","kakao_account.profile.nickname" ] },
						success : function(res) {
							var id = res.id;
							scope: 'profile_nickname, account_email';
							alert(JSON.stringify(res));

							var param = {
								user_name : res.kakao_account.profile.nickname,
								email : res.kakao_account.email,
								login_id : id,
								u_nick : res.kakao_account.profile.nickname
							}

							$.ajax({
								url : 'KakaoLoginCon.do',
								type : 'post',
								datatype : 'json',
								data : param,
								success : function(result) {
									if(result == 'Y'){
										
										location.href = "Home.jsp";
									}else{
										
										location.href = "insertId.jsp";
									}
									
								}
							})

					}
				})
				
				console.log(authObj);
				var token = authObj.access_token;
				
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});

		})
		
		
	</script>
	
</body>
</html>