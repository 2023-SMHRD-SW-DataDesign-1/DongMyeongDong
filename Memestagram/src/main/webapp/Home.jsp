<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sidebar Menu | Side Navigation Bar</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
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
            <ul>
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
            </ul>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="box-sidebar">
        </div>

        <div class="box-contents">
            <div id="posts">
                <div class="post">
                    <div class="header">
                        <div class="profile_icon">
                            <img src="./image/user.png" alt="">
                        </div>
                        <div class="id">사용자 아이디</div>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded'></i>
                        </div>
                    </div>
                    <div class="content">
                        <img src="./image/astronaut-8061095_1280.png" alt="">
                    </div>
                    <div class="buttons">
                        <div class="button">
                            <i class="bx bx-heart icon"></i>
                        </div>
                        <div class="button">
                            <i class="bx bx-comment icon"></i>
                        </div>
                        <div class="button">
                            <i class="bx bx-navigation icon"></i>
                        </div>
                    </div>
                    <div class="like">
                        <span>좋아요</span>
                        <span class="like_count">10.8만</span>
                        <span>개</span>
                    </div>
                    <div class="comments">
                        <span><b>작성자</b></span>
                        <span> </span>
                        <span>댓글 내용입니다.</span> <br>
                        <span class="show_more">더 보기</span>
                    </div>
                    <div class="comments_show">
                        <span class="show_all">댓글 1004개 모두 보기</span>
                    </div>
                    <div class="comments_input">
                        <input type="text" placeholder="댓글 달기...">
                    </div>
                    <hr>
                </div>
                <div class="post">
                    <div class="header">
                        <div class="profile_icon">
                            <img src="./image/cat.png" alt="">
                        </div>
                        <div class="id">사용자 아이디</div>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded'></i>
                        </div>
                    </div>
                    <div class="content">
                        <video id="video" src="./video/7.mp4" controls autoplay muted playsinline></video>
                    </div>
                    <div class="buttons">
                        <div class="button">
                            <i class="bx bx-heart icon"></i>
                        </div>
                        <div class="button">
                            <i class="bx bx-comment icon"></i>
                        </div>
                        <div class="button">
                            <i class="bx bx-navigation icon"></i>
                        </div>
                    </div>
                    <div class="like">
                        <span>좋아요</span>
                        <span class="like_count">7.7만</span>
                        <span>개</span>
                    </div>
                    <div class="comments">
                        <span><b>작성자</b></span>
                        <span> </span>
                        <span>댓글 내용입니다.</span> <br>
                        <span class="show_more">더 보기</span>
                    </div>
                    <div class="comments_show">
                        <span class="show_all">댓글 1234개 모두 보기</span>
                    </div>
                    <div class="comments_input">
                        <input type="text" placeholder="댓글 달기...">
                    </div>
                    <hr>
                </div>
            </div>

            <p id="loading">
                <img src="image/loading.gif" alt="Loading…" />
            </p>
        </div>
    </div>
    
   <script src="js/home_scroll.js"></script>

</body>

</html>