package asm.helper;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class save {

	public File  save(HttpServletRequest req, String namePhoto) throws IOException, ServletException {
		File dir = new File(req.getServletContext().getRealPath("/views/img"));
				System.out.println(dir);
				if(!dir.exists()) {
					//tao neu chua ton tai
					dir.mkdir();
				}
				//luu cac file upload vao thu muc files
				Part photo = req.getPart(namePhoto);// file hinh

				File photoFile = new File(dir, photo.getSubmittedFileName());
				try {
					photo.write(photoFile.getAbsolutePath());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return photoFile;
		
	}

}
