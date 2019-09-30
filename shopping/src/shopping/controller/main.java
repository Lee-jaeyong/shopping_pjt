package shopping.controller;

public class main {
	public static void main(String[] args) {
		String str = "C:\\Users\\LJY\\Pictures\\Saved Pictures\\1.png";

		int a = str.lastIndexOf("\\");

		System.out.println(str.substring(a + 1));

	}
}
