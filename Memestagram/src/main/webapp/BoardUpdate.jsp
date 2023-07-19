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
	<table>

		작성자 = ${info.mem_id}
		<tr>
			<td colspan="2">내용</td>
		</tr>

		<tr>
<%-- 			<td colspan="2"><input name="filename" type="file" value="${}"
				style="float: right;"><br>
				 <textarea value="${}"
					name="board_content" rows="10" style="resize: none;"></textarea></td> --%>
		</tr>

		<tr>
			<td colspan="2"><input type="reset" value="초기화"> <input
				type="submit" value="작성하기"></td>
		</tr>
	</table>
</body>
</html>