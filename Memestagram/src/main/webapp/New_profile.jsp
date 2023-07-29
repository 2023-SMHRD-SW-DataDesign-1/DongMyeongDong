<%@page import="com.smhrd.model.ProfileProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProfileImgDTO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.ProfileDTO"%>
<%@page import="com.smhrd.model.ProfileDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">


<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sidebar Menu | Side Navigation Bar</title>
<!-- CSS -->
<link rel="stylesheet" href="css/new_home.css" />
<link rel="stylesheet" href="css/new_profile.css" />
<link rel="stylesheet" href="css/new_post.css" />
<link rel="stylesheet" href="css/new_search.css" />


<!-- Boxicons CSS -->
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="./SideBar.jsp" />

	<div class="container">

		<div class="box-sidebar"></div>

		<div class="box-contents">
			<div class="div_profile">
				<div class="div_user">
					<div class="user_icon">
						<!-- 프로필 이미지 기본값 설정 -->
						<c:choose>
							<c:when
								test="${(member.mem_img eq member.mem_pw) or (member.mem_pw eq null)}">
								<img alt="" src="./image/user.png">
							</c:when>
							<c:otherwise>
								<img alt="" src="./image/${member.mem_img}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="user_info">
						<div class="user_info_name">
							<div>${member.mem_id}</div>
							<div>
								<button id="btn_profile_edit">프로필 편집</button>
							</div>
						</div>
						<div class="user_info_others">
							<c:set var="show"
								value="${ProfileDAO.profileShow2(member.mem_id)}"></c:set>
							<div>게시물 ${show.boardcount}</div>
							<div>팔로워 ${show.follower}</div>
							<div>팔로우 ${show.following}</div>
							<div>리워드 ${show.mem_reward}</div>
						</div>
					</div>
				</div>
				<div class="div_menu">
					<button onclick="showPost()">게시물</button>
					<button onclick="showProduct()">상품 목록</button>
				</div>
				<div class="div_post" id="postPart">
					<!-- 사용자 게시물 보여주는 영역 -->
					<c:set var="board_list"
						value="${ProfileDAO.boardList(member.mem_id)}"></c:set>
					<c:forEach var="post_board" items="${board_list}">
						<img src="./image/${post_board.board_img}" alt=""
							class="post-image" data-post-id="${post_board.board_seq}">
					</c:forEach>
				</div>

				<div class="div_post" id="productPart">
					<!-- 사용자가 구매한 상품 이미지 보여주는 영역 -->
					<div class="shop_product_div">
						<c:set var="shopping_list"
							value="${ProfileDAO.shoppingList(member.mem_id)}"></c:set>
						<c:forEach var="post_shop" items="${shopping_list}">
							<div class="shop_product">
								<div class="shop_product_img">
									<img src="./image/${post_shop.product_img}" alt="">
								</div>
								<div class="shop_product_name">상품명 :
									${post_shop.product_name}</div>
								<div class="shop_product_buy_date">구매시간 :
									${post_shop.buy_date}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 게시글 세부 화면 modal 창 -->
	<div id="post_modal" class="post_modal"></div>



	<!-- 게시글 작성 modal 창 -->
	<div id="create_modal" class="create_modal"></div>





	<script src="js/new_post.js" data-id="${member.mem_id}" data-img="${member.mem_img}"></script>
	<script src="js/new_profile_detail.js"></script>
	<script src="js/new_search.js"></script>

	<script type="text/javascript">
    let btn_profile_edit = document.getElementById('btn_profile_edit');

    btn_profile_edit.addEventListener("click", ()=>{
        window.location.href = "./New_profile_edit.jsp";
    });
    
    
    // 게시물 메뉴를 클릭했을 때 -> 게시물 이미지O / 상품 목록X
    function showPost() {
 	   document.getElementById("postPart").style.display="block";
 	   document.getElementById("productPart").style.display="none";
    }
    
    // 상품 목록 메뉴를 클릭했을 때 -> 게시물 이미지X / 상품 목록O
    function showProduct() {
 	   document.getElementById("productPart").style.display="block";
 	   document.getElementById("postPart").style.display="none";
    }
    </script>
</body>

</html>