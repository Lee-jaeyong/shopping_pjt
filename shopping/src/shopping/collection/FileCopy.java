package shopping.collection;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileCopy {
	public static void fileCopy(String origin, String copy) {
		File origin_file = new File(origin);
		File copy_file = new File(copy);
		int c;
		try {
			FileInputStream fi = new FileInputStream(origin_file);
			FileOutputStream fout = new FileOutputStream(copy_file);
			while ((c = fi.read()) != -1) {
				fout.write((char) c);
			}
			fi.close();
			fout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
