<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<script type="text/javascript">
		/* function kakaoLogout(kakaoKey){
			Kakao.init(kakaoKey);
			KaKao.isInitialized();
			
			if(!Kakao.Auth.getAccessToken()){
				return;
			}
			
			Kakao.Auth.logout(function(){
				console.log(Kakao.Auth.getAccessToken());
			})
		} */
		
		
			/* Kakao.init(kakaoKey);
			KaKao.isInitialized();
			
            if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.');
                return;
            } */
            Kakao.Auth.logout(function() {
                alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
            });
        
	
		kakaoLogout();
		location.href="Login.jsp";
	
	</script>
</body>
</html>