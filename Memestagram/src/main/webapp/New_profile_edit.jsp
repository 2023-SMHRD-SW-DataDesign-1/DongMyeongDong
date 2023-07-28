<%@page import="com.smhrd.model.ProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/new_profile_edit.css" />
    <link rel="stylesheet" href="css/new_post.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <jsp:include page="./SideBar.jsp" />

    <div class="container">
        <div class="box-sidebar">

        </div>

        <div class="box-contents">
            <div class="profile_edit">
                <div class="div_head">
                    <h2>프로필 편집</h2>
                </div>
                <form id="uploadForm" onsubmit="return submitForm();">
                    <div class="div_user">
                        <div class="user_icon">
                            <!-- 프로필 이미지 기본값 설정 -->
                            <c:choose>
                                <c:when test="${(member.mem_img eq member.mem_pw) or (member.mem_pw eq null)}">
                                    <img alt="" src="./image/user.png" id="previewImage">
                                </c:when>
                                <c:otherwise>
                                    <img alt="" src="./image/${member.mem_img}" id="previewImage">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="user_name">
                            ${member.mem_id}
                        </div>
                        <div class="user_icon_change">
                            <label for="btn_change_icon">프로필 사진 바꾸기</label>
                            <!-- <form id="uploadForm"> -->
                            <input type="file" id="btn_change_icon" name="mem_img">
                            <input type="hidden" id="member_id" value="${member.mem_id}">
                            <!-- </form> -->
                        </div>
                    </div>
                    <div class="div_edit">
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
                    </div>
                </form>
            </div>

            <!-- 게시글 작성 modal 창 -->
            <div id="create_modal" class="create_modal">
            </div>
        </div>
    </div>
    <script src="js/new_post.js"></script>

    <script type="text/javascript">
    
    // input 태그의 값이 변경될 때 미리 보기 기능을 실행하는 함수
    function previewImage(event) {
      const input = event.target;
      const preview = document.getElementById("previewImage");

      if (input.files && input.files[0]) {
        const reader = new FileReader();

        reader.onload = function (e) {
          preview.setAttribute("src", e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
      }
    }

    // input 태그에 change 이벤트를 등록하여 이미지 선택 시 미리 보기 함수를 호출
    const imageInput = document.getElementById("btn_change_icon");
    imageInput.addEventListener("change", previewImage);

        // 비밀번호 수정 시 팝업창
        function submitForm() {
            let pw1 = $('#pw1').val();
            let pw2 = $('#pw2').val();

            if (pw1 == pw2) {
                alert("비밀번호가 수정되었습니다.");
                return true;
            } else {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
        }

        // 프로필 이미지 변경 시, 이미지 데이터 넘기기
        $(function () {
            $('#input_submit').on('click', function () {
                uploadFile();
            });
        });

        function uploadFile() {
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
                url: 'ProfileEditCon.do',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false
            }).done(function (data) {
                callback(data);
            });
        }

    </script>
</body>

</html>
