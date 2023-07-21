<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div>댓글작성</div>
<form id="commentform">
댓글 : <textarea name="board_cmt_content"  rows="3" style="resize: none;" ></textarea><br>
<input type="hidden" name="board_seq" value="${param.board_seq}">
<input type="hidden" name="mem_id" value="${info.mem_id}">
<input type="submit" value="작성하기" onclick="writecomment()">
</form>

<script>
function writecomment() {
	var formdata = $("#commentform").serialize();
	
	$.ajax({
		type : "POST",
		url : "BoardCmtWriteCon.do",
		data: formData,
        success: function(response) {
            // 댓글 작성 성공 시, 원하는 동작을 수행
             var commentContent = $("#board_cmt_content").val();
                    var newComment = "<div>" + commentContent + "</div>";
                    $("#commentList").append(newComment);

                    // 댓글 작성 후 입력창 초기화
                    $("#board_cmt_content").val("");
            // 페이지 리로딩 혹은 새로운 댓글을 추가하는 등의 작업을 할 수 있음
        },
        error: function(xhr, status, error) {
            // 댓글 작성 실패 시, 오류 처리
            alert("댓글 작성에 실패했습니다. 다시 시도해주세요.");
        }
    });
}
</script>
</body>
</html>