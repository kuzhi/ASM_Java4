package asm.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import asm.DAO.UserDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.User;
import asm.jpa.CookieUtils;
import asm.jpa.SendMail;
import asm.jpa.SessionUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({"/home/login","/home/logout","/home/change-password","/home/sign-up"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO uDao = new UserDAO();   
    private SendMail sendMail = new SendMail();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uri = request.getRequestURI();
		String id = CookieUtils.get("id", request);
		String pass=CookieUtils.get("pass", request);
		if(uri.contains("login")) {
			request.setAttribute("id", id);
			request.setAttribute("pass", pass);

			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
		}
		if(uri.contains("logout")) {
			doLogout(request, response);
		}
		if(uri.contains("change-password")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);
		}
		
		if(uri.contains("sign-up")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SIGNUP_PAGE);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();

		if(uri.contains("login")) {
			
			doLogin(request, response);

		}
		
		if(uri.contains("change-password")) {
			doChangePass(request, response);

		}
		
		if(uri.contains("sign-up")) {
			try {
				doSignup(request, response);
			} catch (ServletException | IOException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SIGNUP_PAGE);
		}
	}
	
	protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		String remember = request.getParameter("checkbox");
		
		
		User user = new User();
		
		if(id.equalsIgnoreCase("")) {

			request.setAttribute("errorID", "Vui lòng nhập  mật khẩu");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);

			return;
		}
		else if(pass.equalsIgnoreCase("")){

			request.setAttribute("errorPass", "Vui lòng nhập mật khẩu");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);

			return;
		}
		else {
			user = uDao.findByID(id);
			if(user!=null) {
				if((user.getPassword().trim()).equalsIgnoreCase(pass)) {

					request.getSession().setAttribute("user", user);
					if(remember != null) {
						CookieUtils.add("id", id, 24, response);
						CookieUtils.add("pass", pass, 24, response);

					}
					
					response.sendRedirect(request.getContextPath()+"/home/index");
				
				}
				else {
					

					request.setAttribute("errorPass", "Sai mật khẩu");
					PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);

					return;
				}
			}
			else {

			request.setAttribute("errorID", "Sai tên đăng nhập");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);

			return;
			}
		}
		
	
	}
	
	protected void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("user", null);
		CookieUtils.add("user", null, 0, response);
		
		SessionUtils.invalidate(request);
		response.sendRedirect(request.getContextPath()+"/home/index");

	}
	
	protected void doChangePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u = (User) request.getSession().getAttribute("user");
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String repass = request.getParameter("repass");

		System.out.println("id "+oldpass);
		System.out.println("pass "+newpass);
		System.out.println("pass "+repass);

		
		
		if(oldpass.equalsIgnoreCase("")) {

			request.setAttribute("errorOldpass", "Vui lòng nhập mật khẩu cũ");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

			return;
		}
		else if(newpass.equalsIgnoreCase("")){

			request.setAttribute("errorNewpass", "Vui lòng nhập mật khẩu mới");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

			return;
		}
		else if(repass.equalsIgnoreCase("")){

			request.setAttribute("errorRepass", "Vui lòng nhập mật khẩu");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

			return;
		}
		else {
			if((u.getPassword().trim()).equalsIgnoreCase(oldpass)) {
				
				if(newpass.equals(repass)) {
					if(newpass.equals(oldpass)) {
						request.setAttribute("error", "Mật khẩu cũ và mới giống nhau");
						PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

					}
					else {
						u.setPassword(newpass);
						uDao.update(u);
						request.setAttribute("message", "Đổi mật khẩu thành công");
						PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

					}
					
				}
				else {
					

					request.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không giống nhau");
					PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

					return;
				}
			}
			else {

			request.setAttribute("errorOldpass", "Sai mật khẩu cũ");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

			return;
			}
			
		}
	}
	


	
	protected void doSignup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		// TODO Auto-generated method stub
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String pass = request.getParameter("password");
		String rePass = request.getParameter("repassword");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		Boolean idMatch = false;
		Boolean emailMatch = false;

		
		String getBirh = request.getParameter("birthDay");
		if(getBirh.equals("")) {
			request.setAttribute("error", "Vui lòng điền trường ngày sinh");

		}
		else {
			Date setDate = format.parse(getBirh);

		

		DateTimeConverter dtc = new DateConverter(setDate) ;
		dtc.setPattern("dd/mm/yyyy");
		ConvertUtils.register(dtc, Date.class);
		}
		//chay vong lap de kiem tra xem co trung khong
			
		List<User> list = uDao.findAll();
		
		for(User u : list) {
			if(id.equalsIgnoreCase(u.getId().trim()))
				{
				idMatch=true;
				
			}
			if(email.equalsIgnoreCase(u.getEmail())) {
				emailMatch = true;
			}
		}
		
		///
		User user = new User();	
		
		UserDAO uDao = new UserDAO();

		user.setAdmin(false);
		
		
			//kiem tra trung
			if(idMatch==false ) {
				if(emailMatch ==false) {
					if(rePass.equals(pass)) {
					try {
						BeanUtils.populate(user, request.getParameterMap());
						uDao.insert(user);
						sendMail.doSendmailCongra(request, response,user);
						request.setAttribute("message", "Đăng ký thành công");
						
						
					}
					 catch (Exception e) {
						 e.printStackTrace();
						request.setAttribute("error", "Lỗi");
					}
				}
					
					else {
						request.setAttribute("error", "Mật khẩu và xác nhận mật khẩu không trùng nhau");

					}	
				
				
			}
				
				else {
					request.setAttribute("error", "Email này đã được sử dụng");

				}			
			
			}
			else {
				request.setAttribute("error", "Tài khoản đã được sử dụng");

			}	
		
		
			
		
	}
	
}
