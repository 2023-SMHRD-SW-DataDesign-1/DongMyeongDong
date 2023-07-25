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
    <title>Sidebar Menu | Side Navigation Bar</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/shop.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                <div class="shop_user_info_name">${member.mem_id}</div>	
                <div class="shop_user_info_point">${member.mem_reward}</div>
            </div>
            <div class="shop_product_div">
            	<c:forEach var="product" items="${productList }">
            		<div class="shop_product" onclick="buyProduct(this)">
            		
	                    <div class="shop_product_img">
	                        <img src="./product/${product.product_img }" alt="">
	                    </div>
	                    <div class="shop_product_brand">${product.product_name}</div>
	                   <!--  <div class="shop_product_name">
	                        아이스 아메리카노
	                    </div> -->
	                    <div class="shop_product_price">${product.product_price}</div>
                    
                   
                </div>
            	
            	</c:forEach>
                
            </div>
        </div>
    </div>



</body>

</html>