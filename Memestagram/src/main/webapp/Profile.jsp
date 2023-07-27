<%@page import="com.smhrd.model.ProfileProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProfileImgDTO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.ProfileDTO"%>
<%@page import="com.smhrd.model.ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false"%>  
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
    <link rel="stylesheet" href="css/new_profile.css" />
    <link rel="stylesheet" href="css/new_post.css" />
   
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
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

    <div class="container"></div>

        <div class="box-sidebar">
            
        </div>

        <div class="box-contents">
            <div class="div_profile">
                <div class="div_user">
                    <div class="user_icon">
                    <!-- 프로필 이미지 기본값 설정 -->
                    <c:choose>
                    	<c:when test="${member.mem_img eq member.mem_pw}">
                    	<img alt="" src="./image/user.png"></c:when>
                    	<c:otherwise><img alt="" src="./image/${member.mem_img}"></c:otherwise>
                    </c:choose>
                    </div>
                    <div class="user_info">
                        <div class="user_info_name">
                            <div>${member.mem_id}</div>
                            <div><button id="btn_profile_edit">프로필 편집</button></div>
                    </div>
                        <div class="user_info_others">
                         <c:set var="show" value="${ProfileDAO.profileShow2(member.mem_id)}"></c:set>
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
                	<c:set var="board_img" value="${ProfileDAO.boardImg(member.mem_id)}"></c:set>
                	<c:forEach var="post_board" items="${board_img}">
                    <img src= "./image/${post_board.board_img}" alt="">
                    </c:forEach>
                </div>
                <div class="div_post" id="productPart">
                	<!-- 사용자가 구매한 상품 이미지 보여주는 영역 -->
                	<c:set var="shopping_list" value="${ProfileDAO.shoppingList(member.mem_id)}"></c:set>
                	<c:forEach var="post_shop" items="${shopping_list}">
                	<img src="./image/${post_shop.product_img}" alt="" >
                	</c:forEach>
                </div>
            </div>
        </div>
        
        <!-- 게시글 작성 modal 창 -->
            <div id="create_modal" class="create_modal">
            </div>

    <script>

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
    <script src="js/new_post.js"></script>

</body>

</html> 