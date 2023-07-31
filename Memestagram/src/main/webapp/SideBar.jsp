<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memestagram</title>
</head>
<body>
	<div class="sidebar" id="sidebar"> 
        <div class="logo">
            <span class="logo-name">Memestagram</span>
        </div>
        <div class="sidebar-content">
            <ul class="lists">
                <li class="list">
                    <a href="New_home.jsp" class="nav-link">
                        <i class='bx bx-home icon'></i>
                        <span class="link">홈</span>
                    </a>
                </li>
                <li class="list">
                    <a class="nav-link search">
                        <i class="bx bx-search icon"></i>
                        <span class="link">검색</span>
                    </a>
                </li>
                <li class="list">
                    <a href="New_Balance.jsp" class="nav-link">
                        <i class='bx bx-joystick-alt icon'></i>
                        <span class="link">밸런스게임</span>
                    </a>
                </li>
                <li class="list">
                    <a href="ShopShowCon.do" class="nav-link">
                        <i class="bx bx-cart-alt icon"></i>
                        <span class="link">리워드상점</span>
                    </a>
                </li>
                <li class="list">
                    <a class="nav-link create_post">
                        <i class="bx bx-plus-circle icon"></i>
                        <span class="link">만들기</span>
                    </a>
                </li>
                <li class="list">
                    <a href="New_profile.jsp" class="nav-link">
                        <i class="bx bx-user-circle icon"></i>
                        <span class="link">프로필</span>
                    </a>
                </li>
            </ul>

            <div class="bottom-cotent">
               
                <li class="list">
                    <a href="javascript:void(0)" class="nav-link" onclick="LogoutCheck()">
                        <i class="bx bx-log-out icon"></i>
                        <span class="link">로그아웃</span>
                    </a>
                </li>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
	
	// 로그아웃 메소드
	function LogoutCheck() {
		let type = "${member.login_type}";
		

		if (type == "kakao") {
			Kakao.init('ffaba3cad1608806d9940769fa4c7c8b');
			
			if (!Kakao.Auth.getAccessToken()) {
				alert('Not logged in.');
				return;
			}
			Kakao.Auth.logout(function() {
				alert('logout ok\naccess token -> '
						+ Kakao.Auth.getAccessToken());
			});
			
			location.href = "LogoutCon.do";
		} else if (type == "naver") {
			location.href = "LogoutCon.do";

		} else {
			location.href = "LogoutCon.do";
		}

	}
	</script>
</body>
</html>