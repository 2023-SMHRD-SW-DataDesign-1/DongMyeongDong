<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>join</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
</head>

<body>
    <div class="join_form">
        <h1>회원가입 화면</h1>
        <p>친구들의 사진과 동영상을 보려면 가입하세요</p>

        <form action="#" method="post">
            <input type="text" placeholder="계정 정보" name="id">
            <br>
            <input type="text" placeholder="사용자 이름" name="name">
            <br>
            <input type="password" placeholder="비밀번호" name="pw">
            <br>
            <input type="password" placeholder="비밀번호 확인" name="pw_ck">
            <br>
            <input type="submit" value="가입">
        </form>

        <p>계정이 있으신가요? <a href="./Login.jsp" class="">로그인</a></p>
    </div>
</body>

</html>