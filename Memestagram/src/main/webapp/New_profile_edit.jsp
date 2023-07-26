<%@page import="com.smhrd.model.ProfileDTO"%>
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
    <link rel="stylesheet" href="css/new_profile_edit.css" />
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

    <div class="container">

        <div class="box-sidebar">
            
        </div>

        <div class="box-contents">
            <div class="profile_edit">
                <div class="div_head">
                    <h2>프로필 편집</h2>
                </div>
                <div class="div_user">
                    <div class="user_icon">
                         <!-- 프로필 이미지 기본값 설정 -->
                    <c:choose>
                    	<c:when test="${member.mem_img eq member.mem_pw}">
                    	<img alt="" src="./image/user.png"></c:when>
                    	<c:otherwise><img alt="" src="./image/${member.mem_img}"></c:otherwise>
                    </c:choose>
                    </div>
                    <div class="user_name">
                        ${member.mem_id}
                    </div>
                    <div class="user_icon_change">
                        <label for="btn_change_icon">프로필 사진 바꾸기</label>
                        <form id="uploadForm">
                        <input type="file" id="btn_change_icon" name="mem_img">
                        <input type="hidden" name="member_id" value="${member.mem_id}">
                        <input type="submit">
                        </form>
                    </div>
                </div>
                <div class="div_edit">
                    <form action="" method="post">
                        <div class="div_edit_inner">
                            <div class="div_edit_1">
                                <span>비밀번호</span>
                            </div>
                            <div class="div_edit_2">
                                <input type="password" placeholder="수정할 비밀번호 입력" name="mem_pw" id="pw1">
                            </div>
                        </div>
                        <div class="div_edit_inner">
                            <div class="div_edit_1">
                                <span>비밀번호 확인</span>
                            </div>
                            <div class="div_edit_2">
                                <input type="password" placeholder="수정할 비밀번호 입력" name="mem_pw2" id="pw2">
                                <input type="hidden" name="mem_id" value="${member.mem_id}">
                            </div>
                        </div>
                        <div class="div_edit_submit">
                            <label for="input_submit">제출</label>
                            <input type="submit" id="input_submit" value="제출" onclick="submitForm();">
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- 게시글 작성 modal 창 -->
            <div id="create_modal" class="create_modal">
            </div>
            
        </div>
    </div>
    <script src="js/new_post.js"></script>
    
    
    
  <script type="text/javascript">
    
    // 비밀번호 수정 시 팝업창
    function submitForm() {
    	let pw1 = $('#pw1').val();
    	let pw2 = $('#pw2').val();
    	
    	if(pw1 == pw2) {
    		alert("비밀번호가 수정되었습니다.");
    	}else {
    		alert("비밀번호가 일치하지 않습니다.");
    		event.preventDefault();
    	}
    }
    
    
  // 프로필 이미지 변경 시, 이미지 데이터 넘기기
 $(function() {
		$('#input_submit').on('click', function(){
			uploadFile();
		}); 
 });
    
 function uploadFile(){
	 
	 var form = $('#uploadForm')[0];
	 var formData = new FormData(form);
	 
	 $.ajax({
		url : 'ProImgCon.do',
		type : 'POST',
		data : formData,
		contentType : false,
		processData : false
	 }).done(function(data){
		 callback(data);
	 });
 }
    
 </script>  
    
   
    
    
    
    
</body>

</html>