<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="shopping.backend.DAO.ItemDAO"%>
<%@ page language="java"
	contentType="APPLICATION/OCTET-STREAM;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String nowDate = date.format(cal.getTime());
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename=shopping_" + nowDate + ".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>

<%@page
	import="org.apache.poi.hssf.usermodel.HSSFSheet,
     org.apache.poi.hssf.usermodel.HSSFWorkbook, 
     org.apache.poi.hssf.usermodel.*,
     java.io.FileOutputStream,java.util.*,
    java.io.*,
    org.apache.poi.hssf.usermodel.*
     "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>엑셀 POI 테스트</title>
</head>
<body>
	<%
		HSSFWorkbook workbook = new HSSFWorkbook();
		//Sheet명 설정
		HSSFSheet sheet = workbook.createSheet("상품목록");
		HSSFRow row;
		HSSFCell cell;

		ItemDAO itemDAO = ItemDAO.getInstance();
		ArrayList<ItemDTO> list = itemDAO.getlist(-1, "", "i_idx", 0);

		row = sheet.createRow(0);
		row.createCell(0).setCellValue("상품 번호");
		row.createCell(1).setCellValue("상품");
		row.createCell(2).setCellValue("대분류");
		row.createCell(3).setCellValue("소분류");
		row.createCell(4).setCellValue("가격");
		row.createCell(5).setCellValue("대표이미지");
		row.createCell(6).setCellValue("조회수");
		row.createCell(7).setCellValue("상품 등록일");

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);

			row.createCell(0).setCellValue(list.get(i).getI_idx());
			row.createCell(1).setCellValue(list.get(i).getI_name());
			row.createCell(2).setCellValue(list.get(i).getC_cagetoryName());
			row.createCell(3).setCellValue(list.get(i).getCs_categoryName());
			row.createCell(4).setCellValue(list.get(i).getI_price());
			row.createCell(5).setCellValue(list.get(i).getImg_path());
			row.createCell(6).setCellValue(list.get(i).getI_hit());
			row.createCell(7).setCellValue(list.get(i).getI_date());
		}

		out.clear();
		out = pageContext.pushBody();
		OutputStream xlsOut = response.getOutputStream();
		workbook.write(xlsOut);
		xlsOut.close();
	%>

</body>
</html>


