<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<body>
	<button id="kakao-login-btn"> <img alt="" src="./img/kakao_login_medium_wide.png"></button>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
  	Kakao.init('ffaba3cad1608806d9940769fa4c7c8b'); // 사용하려는 앱의 JavaScript 키 입력
	
	$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    	Kakao.Auth.login({
        	success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          		Kakao.API.request({
            	url: '/v2/user/me',
            	data: {
                property_keys: ["kakao_account.email","kakao_account.profile.nickname"]
            	},
           		success: function(res) {
              	var id = res.id;
			  	scope : 'profile_nickname, account_email';
			  	alert('로그인성공');
            	
			
			  var param = {
				  user_name : res.kakao_account.profile.nickname,
				  email : res.kakao_account.email,
				  login_id : id, 
				  u_nick : res.kakao_account.profile.nickname
    			}
			  
			  
            	$.ajax({
            		url:'KakaoLoginCon.do',
            		type: 'post',
            		data: param,
            		success: function(da){
            			 location.href="kakaoLoginS.do";
            		}
            	})
            	            	
		              
        }
          })
          //console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) 
</script>
</body>
</html>