<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



 			<input name="board_img" type="file" value="${board_img}" style="float: right;"><br>
				 <textarea value="${board_content}"
					name="board_content" rows="10" style="resize: none;"></textarea>
					<input type="hidden" name="board_seq" value="${param.board_seq}">

			<input type="reset" value="초기화"> 
			<input type="submit" value="수정하기">
		</tr>
	</table>
</body>
</html>