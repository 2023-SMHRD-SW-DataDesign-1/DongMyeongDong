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
    <link rel="stylesheet" href="css/profile_edit.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <!-- jquery -->
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
            <div class="profile_edit">
                <div class="div_head">
                    <h2>프로필 편집</h2>
                </div>
                <div class="div_user">
                    <div class="user_icon">
                    <!-- 프로필 이미지 기본값 설정 -->
                    <c:choose>
                    <c:when test="${(member.mem_img eq member.mem_pw) or (member.mem_pw eq null)}">
                      <img alt="" src="./image/user.png"></c:when>
                      <c:otherwise><img src="./image/${member.mem_img}" alt="" id="profile_img"></c:otherwise>
                    </c:choose>
                    </div>
                    <div class="user_name">
                        user_name : ${member.mem_id}
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
                    <form action="ProfileEditCon.do" method="post">
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
                            <input type="submit" id="input_submit" value="제출">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    
    
    // 비밀번호 수정 시 팝업창
    $('#input_submit').on('click', function(){
    	  let pw1 = $('#pw1').val();
		  let pw2 = $('#pw2').val();
		  
		  if(pw1 == pw2) {
			  alert("비밀번호가 수정되었습니다.")
		  }else {
			  alert("비밀번호가 일치하지 않습니다.")
		  } 
    	
    });
    
    
 // 프로필 이미지 변경 시, 이미지와 비밀번호 데이터 넘기기
$(function() {
    $('#input_submit').on('click', function(){
        uploadFile();
    });
});

function uploadFile(){
	var mem_img = $('#btn_change_icon')[0].files[0]; // 파일 객체 가져오기
    var mem_id = $('#member_id').val();
    var mem_pw = $('#pw1').val();
    var mem_pw2 = $('#pw2').val();
    var formData = new FormData();
    
    formData.append('mem_img', mem_img);
    formData.append('mem_id', mem_id);
    formData.append('mem_pw', mem_pw);
    formData.append('mem_pw2', mem_pw2);
    
    $.ajax({
        url : 'ProfileEditCon.do',
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