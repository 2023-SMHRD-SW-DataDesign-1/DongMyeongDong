<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
</head>

<body>
    <div class="login_form">
        <h1>로그인 화면</h1>
        <form action="#" method="post">
            <input type="text" placeholder="사용자 이름 또는 이메일" name="id">
            <br>
            <input type="password" placeholder="비밀번호" name="pw">
            <br>
            <input type="submit" value="로그인">
        </form>

        <button id="btn_naver_login">네이버 로그인</button>
        <button id="btn_kakao_login">카카오 로그인</button>

        <p>계정이 없으신가요? <a href="./Join.jsp" class="">가입하기</a></p>
    </div>

</body>

</html>