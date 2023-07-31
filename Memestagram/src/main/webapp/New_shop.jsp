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
    <title>memestagram</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/new_shop.css" />
    <link rel="stylesheet" href="css/new_post.css">
    <link rel="stylesheet" href="css/new_search.css">
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>

<body>
<script type="text/javascript">
	function buyProduct(e){
		let price = $(e).children('.shop_product_price').text();
		let product_name = $(e).children('.shop_product_name').text();
		//console.log(${member.mem_reward});
		if(parseInt(price) > ${member.mem_reward}){
			alert("리워드 포인트가 부족합니다");
		}else{
			if(!confirm('구매하시면 포인트는 차감됩니다. \n 정말로 구매하시겠습니까??')){
	            return false;
	        }
			alert("구매 완료");
			location.href="BuyProductCon.do?product_name="+product_name+"&product_price="+price;
		}
	}

</script>

    <jsp:include page="./SideBar.jsp" />


    <div class="container">

        <div class="box-sidebar">
            
        </div>

        <div class="box-contents">
            <div class="shop_user_info">
                <div class="shop_user_info_title">리워드 상점</div>
                <div class="shop_user_info_icon">
                    <img src="./image/${member.mem_img}" alt="">
                </div>
                <div class="shop_user_info_name">${member.mem_id}</div>
                <div class="shop_user_info_point">${member.mem_reward}</div>
                <span>P</span>
            </div>
            <div class="shop_product_div">
            <c:forEach var="product" items="${productList }">
                <div class="shop_product" onclick="buyProduct(this)">
                    <div class="shop_product_img">
                        <img src="./img/${product.product_img}" alt="">
                    </div>
                    <div class="shop_product_brand">
                    </div>
                    <div class="shop_product_name">${product.product_name}</div>
                    <div class="shop_product_price">${product.product_price}</div>
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