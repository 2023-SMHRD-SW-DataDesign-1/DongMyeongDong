<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sidebar Menu | Side Navigation Bar</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/new_shop.css" />
    <link rel="stylesheet" href="css/new_post.css">
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
</head>

<body>
<script type="text/javascript">
	function buyProduct(e){
		let price = $(e).children('.shop_product_price').text();
		let product_name = $(e).children('.shop_product_brand').text();
		console.log(${member.mem_reward});
		if(parseInt(price) > ${member.mem_reward}){
			alert("리워드가 부족합니다");
		}else{
			alert("구매 완료");
			location.href="buyProduct.do?product_name="+product_name+"&product_price="+price;
		}
	}

</script>
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
                    <a href="#" class="nav-link search">
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
                    <a href="New_shop.jsp" class="nav-link">
                        <i class="bx bx-cart-alt icon"></i>
                        <span class="link">리워드상점</span>
                    </a>
                </li>
                <li class="list">
                    <a href="new_post.js" class="nav-link create_post">
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
                    <a href="#" class="nav-link">
                        <i class="bx bx-cog icon"></i>
                        <span class="link">설정</span>
                    </a>
                </li>
                <li class="list">
                    <a href="javascript:void(0)" class="nav-link" onclick="LogoutCheck()">
                        <i class="bx bx-log-out icon"></i>
                        <span class="link">로그아웃</span>
                    </a>
                </li>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="box-sidebar">
            
        </div>

        <div class="box-contents">
            <div class="shop_user_info">
                <div class="shop_user_info_title">리워드 상점</div>
                <div class="shop_user_info_icon">
                    <img src="./image/user.png" alt="">
                </div>
                <div class="shop_user_info_name">${member.mem_id}</div>
                <div class="shop_user_info_point">${member.mem_reward}</div>
            </div>
            <div class="shop_product_div">
            <c:forEach var="product" items="${productList }">
                <div class="shop_product" onlick="buyProduct(this)">
                    <div class="shop_product_img">
                        <img src="./image/gs_1000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        GS25
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 1000
                    </div>
                    <div class="shop_product_price">
                        1,000 P
                    </div>
                </div>
                </c:forEach>
            </div>
            
            <!-- 게시글 세부 화면 modal 창 -->
    		<div id="balance_post_modal" class="post_modal">
    		</div>

    		<!-- 게시글 작성 modal 창 -->
    		<div id="create_modal" class="create_modal">
    		</div>
        </div>
    </div>
    

    
    <script src="js/new_post.js"></script>
<script type="text/javascript">
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
	</script>
</body>

</html>