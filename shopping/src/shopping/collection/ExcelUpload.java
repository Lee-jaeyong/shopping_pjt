package shopping.collection;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import shopping.backend.DTO.ItemDTO;

public class ExcelUpload {
	public static String ExcelParseJson(String path) {
		try {
			FileInputStream fis = new FileInputStream("C:\\Users\\km\\Desktop\\1.xlsx");
			XSSFRow row;

			StringBuilder json = new StringBuilder();
			json.append("{\"result\":[");

			XSSFWorkbook workbook = new XSSFWorkbook(fis);

			int sheetCn = workbook.getNumberOfSheets();

			for (int cn = 0; cn < sheetCn; cn++) {

				XSSFSheet sheet = workbook.getSheetAt(cn);

				int rows = sheet.getPhysicalNumberOfRows();

				for (int r = 1; r < rows; r++) {
					row = sheet.getRow(r);
					if (row != null) {
						String i_name = row.getCell(0).getStringCellValue();
						int c_category = (int) row.getCell(1).getNumericCellValue();
						int cs_category = (int) row.getCell(2).getNumericCellValue();
						int i_price = (int) row.getCell(3).getNumericCellValue();
						String i_main = row.getCell(4).getStringCellValue();
						String i_detail = row.getCell(5).getStringCellValue();
						String i_info = row.getCell(6).getStringCellValue();

						json.append("{\"i_name\":\"" + i_name + "\",\"c_category\":\"" + c_category
								+ "\",\"cs_category\":\"" + cs_category + "\",\"i_price\":\"" + i_price
								+ "\",\"i_main\":\"" + i_main + "\",\"i_detail\":\"" + i_detail + "\",\"i_info\":\""
								+ i_info + "\"}");
						if (r != rows - 1)
							json.append(",");
					}
				}
			}
			json.append("]}");
			return json.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static ArrayList<ItemDTO> excelUpload(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		XSSFRow row;

		ArrayList<ItemDTO> addList = new ArrayList<ItemDTO>();
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(fis);

			int sheetCn = workbook.getNumberOfSheets();

			for (int cn = 0; cn < sheetCn; cn++) {

				XSSFSheet sheet = workbook.getSheetAt(cn);

				int rows = sheet.getPhysicalNumberOfRows();

				for (int r = 1; r < rows; r++) {
					row = sheet.getRow(r);
					if (row != null) {
						String i_name = StringFilter.cleanXSS(row.getCell(0).getStringCellValue());
						int c_category = (int) row.getCell(1).getNumericCellValue();
						int cs_category = (int) row.getCell(2).getNumericCellValue();
						int i_price = (int) row.getCell(3).getNumericCellValue();
						String i_main = StringFilter.cleanXSS(row.getCell(4).getStringCellValue());
						String i_detail = StringFilter.cleanXSS(row.getCell(5).getStringCellValue());
						String i_info = StringFilter.cleanXSS(row.getCell(6).getStringCellValue());
						ItemDTO item = new ItemDTO(i_name, c_category, cs_category, i_price, i_main, i_detail, i_info);
						addList.add(item);
					}
				}
			}
			return addList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
