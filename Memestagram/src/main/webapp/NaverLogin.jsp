<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
 		 var naver_id_login = new naver_id_login("xrSyb5GTqUoKNqtl6LnH", "http://localhost:8081/maven/NaverLogin.jsp");
		 // 접근 토큰 값 출력
		 // alert(naver_id_login.oauthParams.access_token);
		 // 네이버 사용자 프로필 조회
		 naver_id_login.get_naver_userprofile("naverSignInCallback()");
		 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		 function naverSignInCallback() {
		 		let email = naver_id_login.getProfileData('email');
		 		let name = naver_id_login.getProfileData('name');


				$.ajax({
					url : "NaverLoginCon.do",
					type : "POST",
					data : {"email":email, "name":name},
					success : function(result){
						if(result == 'Y'){
							window.opener.location.href = "Home.jsp";
							window.close();
						}else{
							window.opener.location.href = "insertId.jsp";
							window.close();
						}
						
				        
					},
					fail : function(){
						alert("네이버 로그인 실패");
					}
				})
	  
	    }
	  
  
  </script>
</body>
</html>