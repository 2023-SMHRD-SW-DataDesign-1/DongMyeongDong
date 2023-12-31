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
    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>

<body>
<script>
function test(){
	var img = $('#file').val();
	if(img ==""){
		alert("파일을 올려주세요.");
		return false;
	}else{
		return true;
	}
}

img = ["png", "PNG", "JPG", "jpg", "GIF", "gif", "TIFF", "tiff", "psd", "PSD", "AI", "ai", "SVG", "svg", "EPS", "eps", "JFIF", "jfif", "BPG", "bpg", "SVG", "svg", "CGM", "cgm", "BMP", "bmp", "EXIF", "exif"];

 function setThumbnail(event){
	var reader = new FileReader();
	
	//기존 이미지 숨김
	
	reader.onload = function(event){
		
		
			var filetype = event.target.result;
			var result = filetype.substr(5,10).substr(0,5);
			if(result =="video"){
				var img = document.createElement("video");
			}else if(result =="image"){
				var img = document.createElement("img");
			}
			
		
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		//document.querySelector("#cp_file").appendChild(img);
		$('.cp_file').append(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
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
<form action="BoardWriteCon.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
    <div class="container">

        <div class="box-sidebar">
        </div>
        <div class="box-contents">
            <div class="create_post">
                <div class="cp_header">
                    <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
                    <div class="cp_header_div2"><span>새 게시물 만들기</span></div>
                    <div class="cp_header_div3"><input type="submit" value="공유하기"></div>
                </div>
                <div class="cp_content">
                    <div class="cp_file">
                        <img src="./image/files.png" alt="">
                        <label for="file">
                            <div class="btn-upload">파일 올리기</div>
                          </label>
						<input type="file" id="file" name="board_img" onchange="setThumbnail(event);">
                        <input type="hidden" value="${member.mem_id}" name="id">

                    </div>
                    <div class="cp_text">
                        <div class="cp_text_user">
                            <div><img src="./image/user.png" alt=""></div>
                            <div>${member.mem_id}</div>
                        </div>
                        <div class="cp_text_area">
                            <textarea name="board_content" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>

</html>