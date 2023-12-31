<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html>

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sidebar Menu | Side Navigation Bar</title>
<!-- CSS -->
 <link rel="stylesheet" href="css/new_home.css" />
    <link rel="stylesheet" href="css/new_post.css" />
<!-- Boxicons CSS -->
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script src="js/new_home_scroll.js"></script>
</head>

<body>
	<div class="sidebar">
		<div class="logo">
			<span class="logo-name">Memestagram</span>
		</div>
		<div class="sidebar-content">
			<ul class="lists">
				<li class="list"><a href="Home.jsp" class="nav-link"> <i
						class='bx bx-home icon'></i> <span class="link">홈</span>
				</a></li>
				<li class="list"><a href="#" class="nav-link"> <i
						class="bx bx-search icon"></i> <span class="link">검색</span>
				</a></li>
				<li class="list"><a href="Balance.jsp" class="nav-link"> <i
						class="bx bx-joystick-alt icon"></i> <span class="link">밸런스게임</span>
				</a></li>
				<li class="list"><a href="ShopShowCon.do" class="nav-link">
						<i class="bx bx-cart-alt icon"></i> <span class="link">리워드상점</span>
				</a></li>
				<li class="list"><a href="Post.jsp" class="nav-link"> <i
						class="bx bx-plus-circle icon"></i> <span class="link">만들기</span>
				</a></li>
				<li class="list"><a href="Profile.jsp" class="nav-link"> <i
						class="bx bx-user-circle icon"></i> <span class="link">프로필</span>
				</a></li>
			</ul>

			<div class="bottom-cotent">
				<ul>
					<li class="list"><a href="#" class="nav-link"> <i
							class="bx bx-cog icon"></i> <span class="link">설정</span>
					</a></li>
					<li class="list"><a href="javascript:void(0)" onclick="LogoutCheck()" class="nav-link"> <i
							class="bx bx-log-out icon"></i> <span class="link">로그아웃</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="box-sidebar"></div>

		<div class="box-contents">
			<div id="posts"></div>

			<p id="loading">
				<!-- <img src="image/loading.gif" alt="Loading…" /> -->
			</p>
		</div>
	</div>
	
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- <script type="text/javascript">
		function LogoutCheck() {
			let type = "${member.login_type}";
			alert(type);

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
	</script> -->


</body>

</html>