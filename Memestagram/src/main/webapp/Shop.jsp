<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sidebar Menu | Side Navigation Bar</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/shop.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
</head>

<body>
    <div class="sidebar">
        <div class="logo">
            <span class="logo-name">Memestagram</span>
        </div>
        <div class="sidebar-content">
            <ul class="lists">
                <li class="list">
                    <a href="Home.jsp" class="nav-link">
                        <i class='bx bx-home icon'></i>
                        <span class="link">홈</span>
                    </a>
                </li>
                <li class="list">
                    <a href="#" class="nav-link">
                        <i class="bx bx-search icon"></i>
                        <span class="link">검색</span>
                    </a>
                </li>
                <li class="list">
                    <a href="Balance.jsp" class="nav-link">
                        <i class="bx bx-joystick-alt icon"></i>
                        <span class="link">밸런스게임</span>
                    </a>
                </li>
                <li class="list">
                    <a href="Shop.jsp" class="nav-link">
                        <i class="bx bx-cart-alt icon"></i>
                        <span class="link">리워드상점</span>
                    </a>
                </li>
                <li class="list">
                    <a href="Post.jsp" class="nav-link">
                        <i class="bx bx-plus-circle icon"></i>
                        <span class="link">만들기</span>
                    </a>
                </li>
                <li class="list">
                    <a href="Profile.jsp" class="nav-link">
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
                    <a href="#" class="nav-link">
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
                <div class="shop_user_info_name">user_name</div>
                <div class="shop_user_info_point">10,000,000 P</div>
            </div>
            <div class="shop_product_div">
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_americano.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아이스 아메리카노
                    </div>
                    <div class="shop_product_price">
                        5,500 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_americano.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아이스 아메리카노
                    </div>
                    <div class="shop_product_price">
                        5,500 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_americano.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아이스 아메리카노
                    </div>
                    <div class="shop_product_price">
                        5,500 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_americano.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아이스 아메리카노
                    </div>
                    <div class="shop_product_price">
                        5,500 P
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>