package asm.jpa;
	
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	//tao va guji cookie

	public static Cookie add(String name, String value, int hours, HttpServletResponse respone) {
		
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours*60*60);
		cookie.setPath("/");
		respone.addCookie(cookie);
		
		return cookie;
	}
	
	
	//doc gia tri cookie
	public static String get(String name, HttpServletRequest req) {
		Cookie [] cookies = req.getCookies();
		
		if(cookies != null) {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equalsIgnoreCase(name))
					return cookie.getValue();
			}
		}
		return "";
	}
}
