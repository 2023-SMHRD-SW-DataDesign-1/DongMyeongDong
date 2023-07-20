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
<div id = "board">
				<form action="BoardWriteCon.do" method="post" enctype="multipart/form-data">
				<table id="list">
					
						작성자 = ${info.mem_id}
					<tr>
						<td colspan="2">내용</td>
					</tr>
				
					<tr>
						<td colspan="2">
							<input name="board_img" type="file" style="float: right;" ><br>
							<textarea name="board_content"  rows="10" style="resize: none;" ></textarea>			
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
						</td>
					</tr>
				</table>
				</form>
			</div>
</body>
</html>