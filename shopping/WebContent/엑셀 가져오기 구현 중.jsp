<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="shopping.backend.DAO.ItemDAO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>엑셀 POI 테스트</title>
<script>
	function a() {
		var d = document.getElementById("file").value.length;
		var b = document.getElementById("file").value.length - 3;
		var c = document.getElementById("file").value.substr(b,d);
		alert(c);
	}
</script>
</head>
<body>
	<input type="file" id="file" value="">
	<button onclick="a();">dfdfㄴㅇㄴㅇㄴsdfd</button>
</body>
</html>


