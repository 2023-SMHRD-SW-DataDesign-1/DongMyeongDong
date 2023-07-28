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
    <jsp:include page="./SideBar.jsp" />

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
                <div class="shop_product">
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
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/gs_3000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        GS25
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 3000
                    </div>
                    <div class="shop_product_price">
                        3,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/gs_5000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        GS25
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 5000
                    </div>
                    <div class="shop_product_price">
                        5,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/cu_1000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        CU
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 1000
                    </div>
                    <div class="shop_product_price">
                        1,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/cu_3000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        CU
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 3000
                    </div>
                    <div class="shop_product_price">
                        3,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/cu_5000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        CU
                    </div>
                    <div class="shop_product_name">
                        모바일 상품권 5000
                    </div>
                    <div class="shop_product_price">
                        5,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_4500.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아이스아메리카노T
                    </div>
                    <div class="shop_product_price">
                        4,500 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_5000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        카페라떼T
                    </div>
                    <div class="shop_product_price">
                        5,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/starbucks_10200.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        스타벅스
                    </div>
                    <div class="shop_product_name">
                        아메리카노T + 가나슈 케이크
                    </div>
                    <div class="shop_product_price">
                        10,200 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/moms_6900.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        맘스터치
                    </div>
                    <div class="shop_product_name">
                        싸이버거 세트
                    </div>
                    <div class="shop_product_price">
                        6,900 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/moms_10000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        맘스터치
                    </div>
                    <div class="shop_product_name">
                        싸이플렉스버거 세트
                    </div>
                    <div class="shop_product_price">
                        10,000 P
                    </div>
                </div>
                <div class="shop_product">
                    <div class="shop_product_img">
                        <img src="./image/lottecinema_11000.jpg" alt="">
                    </div>
                    <div class="shop_product_brand">
                        롯데시네마
                    </div>
                    <div class="shop_product_name">
                        2D 영화관람권
                    </div>
                    <div class="shop_product_price">
                        11,000 P
                    </div>
                </div>
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