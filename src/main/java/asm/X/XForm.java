package asm.X;

import static asm.filter.RRSharer.request;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import asm.filter.RRSharer;


public class XForm {
	//kiem tra su ton tai cua tham so trong rrsharer

	public static boolean exist(String name) {
		return request().getParameter(name) !=null;
	}
	
	//doc chuoi tu tham so form

	public static String getString(String name, String defval) {
		String value = request().getParameter(name);
		return value == null ? defval : value;
	}
	
	//doc so nguyen tu tham so form

	public static int getInt(String name, String defval) {
		String value = getString(name, String.valueOf(defval));
		return Integer.parseInt(value);
	}
	
	//doc so thuc tu tham so form

	public static int getDouble(String name, String defval) {
		String value = getString(name, String.valueOf(defval));
		return Integer.parseInt(value);
	}
	
	//doc gia tri boolean tu tham so form

	public static int getBoolean(String name, String defval) {
		String value = getString(name, String.valueOf(defval));
		return Integer.parseInt(value);
	}
	
	//doc thoi gian tu tham so form
	
	public static Date getDate(String name, Date defval) {
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-mm-dd");
		String date = getString(name, sdf.format(defval));
		
		try {
			return sdf.parse(date);
		} catch (Exception e) {
			// TODO: handle exception
			return defval;
		}		
		
	}
	//luu file upload vao thu muc voi ten duy nhat
	public static File save(String name, String folder) {
		
		File dir = new File(request().getServletContext().getRealPath(folder));
		if(!dir.exists()) {
			dir.mkdir();
		}
		try {
			Part part = request().getPart(name);
			if(part !=null && part.getSize()>0) {
				String fn = System.currentTimeMillis() + part.getSubmittedFileName();
				
				String fileName = Integer.toHexString(fn.hashCode()) + fn.substring(fn.lastIndexOf("."));
				
				File file = new File(dir, fileName);
				part.write(file.getAbsolutePath());
				return file;
			}
			return null;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	//doc cac gia tri thuoc tinh cua form vao cac thuoc tinh cung ten cua bean
	
	
	public static <T> T getBean(Class<T> clazz) {
		DateTimeConverter dtc = new DateConverter(new Date());
		dtc.setPattern("MM/dd/yyyy");
		ConvertUtils.register(dtc, Date.class);
		try {
			T bean = clazz.newInstance();
			BeanUtils.populate(bean, RRSharer.request().getParameterMap());
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
