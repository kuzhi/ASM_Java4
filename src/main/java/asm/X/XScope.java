package asm.X;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import asm.filter.RRSharer;

//lop quan li cac attribute trong scope
public class XScope {
	
	public static HttpServletRequest request() {
		return RRSharer.request();
	}
	
	public static HttpSession session() {
		return request().getSession();
	}
	
	public static ServletContext application() {
		return request().getServletContext();
	}
	
	//tao cac attribute trong request Scope
	
	public static void setRequest(String name, Object value) {
		request().setAttribute(name, value);
	}
	
	// doc cac attribute trong request scope
	
	@SuppressWarnings("unchecked")
	public static <T> T getRequest(String name) {
		return (T) request().getAttribute(name);
	}
	
	//xoa attribute trong request scope
	
	public static void removeAttribute(String name) {
		request().removeAttribute(name);
	}
	
	//tao attribute trong session scope
	
	public static void setSession(String name, Object value) {
		session().setAttribute(name, value);
	}
	
	//doc attribute trong session scope
	@SuppressWarnings("unchecked")
	public static <T> T getSession(String name) {
		return (T) session().getAttribute(name);
	}
	
	
	//xoa attribute trong session scope
	
	public static void removeSession(String name) {
		session().removeAttribute(name);
	}
	
	
	//tao attribute trong application scope
	public static void setApplication(String name, Object value) {
		application().setAttribute(name, value);
	}
	
	//doc attribute trong application scope
	@SuppressWarnings("unchecked")
	public static <T> T getApplication(String name) {
		return (T) application().getAttribute(name);
	}
	
	//xoa attribute trong application scope
	public static void removeApplication(String name) {
		application().removeAttribute(name);
	}
}
