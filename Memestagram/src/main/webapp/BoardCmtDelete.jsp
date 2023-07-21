<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="submit" value="삭제하기" onclick="deleteComment()">

<script>
function deleteComment(commentId) {
    $.ajax({
        type : "POST",
        url : "BoardCmtDeleteCon.do",
        data: { commentId: commentId },
        success: function(response) {
            // 댓글 삭제 성공 시, 해당 댓글 제거
            $("#" + commentId).remove();
        },
        error: function(xhr, status, error) {
            // 댓글 삭제 실패 시, 오류 처리
            alert("댓글 삭제에 실패했습니다. 다시 시도해주세요.");
        }
    });
}
</script>
</body>
</html>