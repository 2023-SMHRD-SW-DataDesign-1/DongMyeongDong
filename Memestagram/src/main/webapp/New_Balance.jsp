<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>memestagram</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/new_home.css" />
    <link rel="stylesheet" href="css/new_post.css">
    <link rel="stylesheet" href="css/new_search.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>

<body>

    <jsp:include page="./SideBar.jsp" />


     <div class="container">

        <div class="box-sidebar">
        </div>

        <div class="box-contents">
            <div id="posts">
                
            </div>
            
            <!-- 게시글 세부 화면 modal 창 -->
            <div id="balance_post_modal" class="post_modal">
            </div>

            <!-- 게시글 작성 modal 창 -->
            <div id="create_modal" class="create_modal">
            </div>

            <p id="loading">
                <img src="image/loading.gif" alt="Loading…" />
            </p>
        </div>
    </div>
	<input type="hidden" id="my_id" value="${member.mem_id }">
    <script src="js/new_show_detail.js"></script>
    <script src="js/new_balance_scroll.js"></script>
    <script src="js/new_search.js"></script>
    <script src="js/new_post.js" data-id="${member.mem_id}" data-img="${member.mem_img}"></script>
    <script type="text/javascript">
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