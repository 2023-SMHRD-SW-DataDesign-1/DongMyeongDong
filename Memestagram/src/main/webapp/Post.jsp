<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
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
    <link rel="stylesheet" href="css/post.css" />
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
            <div class="create_post">
                <div class="cp_header">
                    <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
                    <div class="cp_header_div2"><span>새 게시물 만들기</span></div>
                    <div class="cp_header_div3"><span>공유하기</span></div>
                </div>
                <div class="cp_content">
                    <div class="cp_file">
                        <img src="./image/files.png" alt="">
                        <label for="file">
                            <div class="btn-upload">파일 올리기</div>
                          </label>
                        <input type="file" id="file"></input>
                    </div>
                    <div class="cp_text">
                        <div class="cp_text_user">
                            <div><img src="./image/user.png" alt=""></div>
                            <div>user_name</div>
                        </div>
                        <div class="cp_text_area">
                            <textarea name="cp_ta" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>
</body>

</html>