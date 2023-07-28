<%@page import="com.smhrd.model.ProfileProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProfileImgDTO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.ProfileDTO"%>
<%@page import="com.smhrd.model.ProfileDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
    <link rel="stylesheet" href="css/new_home.css" />
    <link rel="stylesheet" href="css/new_profile.css" />
    <link rel="stylesheet" href="css/new_post.css" />
   
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
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
            <div class="div_profile">
                <div class="div_user">
                    <div class="user_icon">
                    <!-- 프로필 이미지 기본값 설정 -->
                    <c:choose>
                    	 <c:when test="${(member.mem_img eq member.mem_pw) or (member.mem_pw eq null)}"><img alt="" src="./image/user.png"></c:when>
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
                	<c:set var="board_list" value="${ProfileDAO.boardList(member.mem_id)}"></c:set>
                	<c:forEach var="post_board" items="${board_list}">
                    	<img src= "./image/${post_board.board_img}" alt="" class="post-image" data-post-id="${post_board.board_seq}">
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
    </div>
        
         <!-- 게시글 세부 화면 modal 창 -->
            <div id="post_modal" class="post_modal">
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
        
        //만들기버튼 눌렀을때
        document.addEventListener('DOMContentLoaded', function () {
    	    const sidebar = document.getElementById('sidebar');
    	    const create_modal = document.getElementById('create_modal');

    	    // 버튼 이벤트 위임
    	    sidebar.addEventListener('click', function (event) {
    	        if (event.target.classList.contains('create_post')) {
    				
    				/* var username = session.getAttribute("member");
    				console.log(username.mem_id); */
    				
    				if(${member.mem_id eq 'admin'} ){
    					 var isAdmin = true;
    				}else{
    					var isAdmin = false;
    				}
    	            // 관리자계정 판별

    	            if (isAdmin) {
    	                create_balance();
    	            } else {
    	                create_post();
    	            }
    	            create_modal.style.display = "flex";
    	            document.body.classList.add('modal-open');

    	            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
    	            window.onclick = function (event) {
    	                if (event.target === create_modal) {
    	                    closeModal();
    	                    document.body.classList.remove('modal-open');
    	                }
    	            };
    	        }
    	    });

    	    // 일반 게시글 작성 모달창
    	    function create_post() {
    	        create_modal.innerHTML = `
    	        	<form action="BoardWriteCon.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
    	            <div class="create_modal-content">
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
    	                            </div>
    	                            <div class="cp_text">
    	                                <div class="cp_text_user">
    	                                    <div><img src="./image/user.png" alt=""></div>
    	                                    <div>${member.mem_id}</div>
    	                                </div>
    	                                <div class="cp_text_area_normal">
    	                                    <textarea name="board_content" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
    	                                </div>
    	                            </div>
    	                        </div>
    	                    </div>
    	            </div>
    	            </form>`;
    	    }

    	    // 밸런스게임 작성 글 모달 창
    	    function create_balance() {
    	        create_modal.innerHTML = `
    	        	<form action="BalBoardWriteCon.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
    	            <div class="create_modal-content">
    	                <div class="create_post">
    	                    <div class="cp_header">
    	                        <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
    	                        <div class="cp_header_div2"><span>새 밸런스게임 만들기</span></div>
    	                        <div class="cp_header_div3"><input type="submit" value="공유하기"></div>
    	                    </div>
    	                    <div class="cp_content">
    	                        <div class="cp_file">
    	                            <img src="./image/files.png" alt="" id="mimg">
    	                            <label for="file">
    	                                <div class="btn-upload">파일 올리기</div>
    	                            </label>
    	                            <input type="file" id="file" name="bal_img" onchange="setThumbnail(event);">
    	                        </div>
    	                        <div class="cp_text">
    	                            <div class="cp_text_user">
    	                                <div><img src="./image/user.png" alt=""></div>
    	                                <div>${member.mem_id}</div>
    	                            </div>
    	                            <div class="cp_text_area">
    	                                <textarea name="bal_content" id="cp_text_area" cols="30" rows="10"
    	                                    placeholder="문구 입력..."></textarea>
    	                            </div>
    	                            <div class="cp_setting_area">
    	                                <div class="select_1_div">
    	                                    <label for="select_1">선택지 1</label>
    	                                    <input name="bal_left" type="text" id="select_1" required maxlength="8">
    	                                    <input type="color" name="select_1_color">
    	                                </div>
    	                                <div class="select_2_div">
    	                                    <label for="select_2">선택지 2</label>
    	                                    <input name="bal_right" type="text" id="select_2" required maxlength="8">
    	                                    <input type="color" name="select_2_color">
    	                                </div>
    	                                <div class="end_time_div">
    	                                    <label for="end_time">종료시간</label>
    	                                    <input name="bal_time" type="datetime" id="end_time">
    	                                </div>
    	                                <div class="reward_div">
    	                                    <label for="reward">리워드</label>
    	                                    <input name="bal_reward" type="number" id="reward">
    	                                </div>
    	                            </div>
    	                        </div>
    	                    </div>
    	                </div>
    	            </div>
    	        </form>`;
    	    }

    	    // 상세화면 닫기 함수
    	    function closeModal() {
    	        create_modal.innerHTML = ''; // 상세화면 비움
    	        create_modal.style.display = 'none';
    	    }
    	});
    	// 미리보기 
    	  function setThumbnail(event){
    			var reader = new FileReader();
    			
    			//기존 이미지 숨김
    			$(".btn-upload").hide();
    			$("#mimg").hide();
    			
    			reader.onload = function(event){
    				
    				
    					var filetype = event.target.result;
    					var result = filetype.substr(5,10).substr(0,5);
    					
    					var img;
    					if(result =="video"){
    						img = document.createElement("video");
    						img.setAttribute("autoplay","true")
    					}else if(result =="image"){
    						img = document.createElement("img");
    					}
    					
    				img.setAttribute("style", "max-width: 500px; max-height: 500px;");

    				img.setAttribute("src", event.target.result);
    				img.setAttribute("class", "col-lg-6");
    				//document.querySelector("#cp_file").appendChild(img);
    				$('.cp_file').append(img);
    			};
    			
    			reader.readAsDataURL(event.target.files[0]);
    		}        
        

        

    </script>
    <script src="js/new_post.js"></script>
    <script src="js/new_profile_detail.js"></script>
</body>

</html>