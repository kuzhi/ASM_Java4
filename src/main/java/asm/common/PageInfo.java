package asm.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import asm.common.PageInfo;
import asm.common.PageType;

public class PageInfo {
public static Map<PageType, PageInfo> pageRoute = new HashedMap();
	static {
		pageRoute.put(PageType.ADMIN_PAGE, new PageInfo("Quản Trị viên","/views/main/admin/NguoiDung.jsp",null));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE, new PageInfo("Báo cáo","/views/main/admin/BaoCao.jsp",null));
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE, new PageInfo("Quản lý Video","/views/main/admin/TongPhim.jsp",null));
		pageRoute.put(PageType.SITE_HOME_PAGE, new PageInfo("Home Page","/views/main/product.jsp",null));
		pageRoute.put(PageType.SITE_LOGIN_PAGE, new PageInfo("Login Page","/views/main/DangNhap.jsp",null));
		pageRoute.put(PageType.SITE_REGISTRATION_PAGE, new PageInfo("Registration","/views/main/DangKy.jsp",null));
		pageRoute.put(PageType.SITE_CHANGE_PASSWORD_PAGE, new PageInfo("Change Password","/views/main/DoiMatKhau.jsp",null));
		pageRoute.put(PageType.SITE_FORGOT_PASSWORD_PAGE, new PageInfo("Forgot Password","/views/main/QuenMatKhau.jsp",null));
		pageRoute.put(PageType.SITE_EDIT_PROFILE_PAGE, new PageInfo("Edit Profile","/views/main/hoSoCaNhan.jsp",null));
		pageRoute.put(PageType.SITE_FAVORITE_PAGE, new PageInfo("Favorite","/views/main/YeuThich.jsp",null));		
		pageRoute.put(PageType.SITE_VIDEO_DETAIL_PAGE, new PageInfo("Video Detail","/views/main/ChiTietPhim.jsp",null));
		pageRoute.put(PageType.SITE_WATCH_VIDEO_PAGE, new PageInfo("Watch Video","/views/main/XemPhim.jsp",null));
		pageRoute.put(PageType.SITE_ANSWER_PAGE, new PageInfo("Q&A","/views/main/hoiDap.jsp",null));
		pageRoute.put(PageType.SITE_CONTACT_PAGE, new PageInfo("Contact","/views/main/lienHe.jsp",null));

	}
	
public static void prepareAndForward(HttpServletRequest request,HttpServletResponse response,PageType pagetype) throws ServletException, IOException {
	PageInfo page=pageRoute.get(pagetype);
	request.setAttribute("view_menuAdmin", "/views/layout/menuAdmin.jsp");
	request.setAttribute("view_mainbodyAdmin", "/views/layout/mainbodyAdmin.jsp");
	request.setAttribute("view_footerAdmin", "/views/layout/footer.jsp");
	request.setAttribute("page", page);
	request.getRequestDispatcher("/views/main/admin/admin.jsp").forward(request,response);
}
public static void prepareAndForwardSite(HttpServletRequest request,HttpServletResponse response,PageType pagetype) throws ServletException, IOException {
	PageInfo page=pageRoute.get(pagetype);
	
	request.setAttribute("view_menu", "/views/layout/menu.jsp");
	request.setAttribute("view_mainbody", "/views/layout/mainbody.jsp");
	request.setAttribute("view_footer", "/views/layout/footer.jsp");
	request.setAttribute("page", page);
	request.getRequestDispatcher("/views/index.jsp").forward(request,response);
}

public static void prepareAndForwardSites(HttpServletRequest request,HttpServletResponse response,PageType pagetype) throws ServletException, IOException {
	PageInfo page=pageRoute.get(pagetype);
	

	request.setAttribute("page", page);
}
private String title;
private String contentUrl;
private String scriptUrl;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContentUrl() {
	return contentUrl;
}
public void setContentUrl(String contentUrl) {
	this.contentUrl = contentUrl;
}
public String getScriptUrl() {
	return scriptUrl;
}
public void setScriptUrl(String scriptUrl) {
	this.scriptUrl = scriptUrl;
}
public PageInfo(String title,String contentUrl, String scriptUrl) {
	super();
	this.title = title;
	this.contentUrl = contentUrl;
	this.scriptUrl = scriptUrl;
}




}
