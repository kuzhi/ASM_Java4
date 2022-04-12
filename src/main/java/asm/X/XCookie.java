package asm.X;

import javax.servlet.http.Cookie;

import asm.filter.RRSharer;

public class XCookie {
	
	//tao va gui cookie ve client 
	public static void add(String name, String value, int hour) {
		Cookie cookie = new Cookie(name, value);
		
		cookie.setMaxAge(hour *60 *60);
		cookie.setPath("/");
		RRSharer.respone().addCookie(cookie);
	}
	
	//doc cookie
	public static String get(String name, String defaultValue) {
		Cookie[] cookies = RRSharer.request().getCookies();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return defaultValue;
	}
}
