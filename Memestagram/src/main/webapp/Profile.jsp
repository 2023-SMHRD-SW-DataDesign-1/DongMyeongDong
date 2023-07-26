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
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sidebar Menu | Side Navigation Bar</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/profile.css" />
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
            <div class="div_profile">
                <div class="div_user">
                    <div class="user_icon">
                        <img src=".img/${member.mem_img}" onerror="./image/user.png" alt="">
                    </div>
                    <div class="user_info">
                        <div class="user_info_name">
                            <div>아이디 : ${member.mem_id} </div>
                            <div><button id="btn_profile_edit">프로필 편집</button></div>
                        </div>
                        <div class="user_info_others">
                    <c:set var="show" value="${ProfileDAO.profileShow2(member.mem_id)}"></c:set>
                            <div>게시물 : ${show.boardcount} </div>
                            <div>팔로워 : ${show.follower} </div>
                            <div>팔로우 : ${show.following} </div>
                            <div>리워드 : ${show.mem_reward} </div>
                            <div>이미지 : ${show.mem_img} </div>
                        </div>
                    </div>
                </div>
                <div class="div_menu">
                    <button onclick="showPost()">게시물</button>
                    <button onclick="showProduct()">상품 목록</button>
                </div>
                <div class="div_post" id="postPart">
                	<c:set var="board_img" value="${ProfileDAO.boardImg(member.mem_id)}"></c:set>
                	<c:forEach var="post_board" items="${board_img}">
                    <!-- 사용자 게시물 보여주는 영역 -->
                    <img src= "./image/${post_board.board_img}" alt="">
                    </c:forEach>
                </div>
                
               <div class="div_post" id="productPart">
                	<c:set var="shopping_list" value="${ProfileDAO.shopping(ProfileProductDTO)}"></c:set>
                	<c:forEach var="post_shop" items="${shopping_list.product_img}">
                	<!-- 사용자가 구매한 상품 이미지 보여주는 영역 -->
                	<img src="${post_shop.shopping_list}" alt="" >
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- <section class="overlay"></section> -->

    <script>

       let btn_profile_edit = document.getElementById('btn_profile_edit');

       btn_profile_edit.addEventListener("click", ()=>{
           window.location.href = "./Profile_edit.jsp";   
       });
      
       
       function showPost() {
    	   document.getElementById("postPart").style.display="block";
    	   document.getElementById("productPart").style.display="none";
       }
       
       function showProduct() {
    	   document.getElementById("productPart").style.display="block";
    	   document.getElementById("postPart").style.display="none";
       }
       
    </script>

</body>

</html>