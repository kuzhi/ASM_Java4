package asm.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import asm.entity.User;
import asm.entity.Video;
import asm.DAO.UserDAO;

import asm.common.PageInfo;
import asm.common.PageType;

/**
 * Servlet implementation class AdminServlet
 */
@MultipartConfig
@WebServlet({"/admin/UsersManagement/index","/admin/UsersManagement/create","/admin/UsersManagement/edit/*","/admin/UsersManagement/update","/admin/UsersManagement/delete",
			"/admin/UsersManagement/reset"	})
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public 		UserDAO uDao = new UserDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		
		User users = new User();
			
		if(uri.contains("index")) {
			
		}
		 if(uri.contains("edit")) {
				try {
					
					//su dung substring de lay ten id
					String id = uri.substring(uri.lastIndexOf("/") + 1);
					users = uDao.findByID(id);
					System.out.println(users.isAdmin());
					request.setAttribute("active", "openkey");
					request.setAttribute("iduser", "openkey");
					
					request.setAttribute("deactive", "closekey");

					
				} catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("error", "Lỗi");

				}
		 }
		 request.setAttribute("count", uDao.count());
		request.setAttribute("users", users);
		doUser(request, response);
		
		
		PageInfo.prepareAndForward(request, response, PageType.ADMIN_PAGE);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String url = request.getRequestURI();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Boolean idMatch = false;
			Boolean emailMatch = false;
			List<User> list = uDao.findAll();

			String getBirh = request.getParameter("birthDay");
			if(getBirh.equals("")) {
				request.setAttribute("error", "Vui lòng điền các trường");

			}
			else {
				Date setDate = format.parse(getBirh);

			

			DateTimeConverter dtc = new DateConverter(setDate) ;
			dtc.setPattern("dd/mm/yyyy");
			ConvertUtils.register(dtc, Date.class);
			}
			
			
			//chay vong lap de kiem tra xem co trung khong
			
			
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


			
			
			if(url.contains("create")) {
				if(idMatch==false ) {
					if(emailMatch ==false) {
						
						try {
							BeanUtils.populate(user, request.getParameterMap());
							uDao.insert(user);
							request.setAttribute("message", "Đăng ký thành công");
							
							
						}
						 catch (Exception e) {
							 e.printStackTrace();
							request.setAttribute("error", "Lỗi");
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
				
			
			
			 if(url.contains("update")) {
				try {
					
					BeanUtils.populate(user, request.getParameterMap());

					if(uDao.findByID(user.getId()) != null) {
						if(emailMatch ==false) {
						uDao.update(user);
						request.setAttribute("user", user);
						request.setAttribute("message", "Cập nhật thành công");
						}
						else {
							request.setAttribute("error", "Email này đã được sử dụng");

						}	
					}
					else {
						request.setAttribute("error", "Không có trong hệ thống");
					}
					

				} catch (Exception e) {
					request.setAttribute("error", "Lỗi");
				}
				
				
			}
			
			 if(url.contains("delete")) {
				try {
					
					BeanUtils.populate(user, request.getParameterMap());
					if(uDao.findByID(user.getId()) != null) {
						uDao.delete(user.getId());
						request.setAttribute("message", "Xóa thành công");
					}
					else {
						request.setAttribute("error", "Không có trong hệ thống");
					}
					user= new User();

				} catch (Exception e) {
					request.setAttribute("error", "Lỗi");
				}
					
			}
			 
			 if(url.contains("reset")) {
											
						String getDate = request.getParameter("birthDay");
						try {	
						if(!getDate.equalsIgnoreCase("")) {
							user= new User();
							user.setBirthDay(null);
						}
						else {
							request.setAttribute("error", "Vui lòng điền trường ngày sinh");
							user= new User();

						}
						user= new User();

					} catch (Exception e) {
						request.setAttribute("error", "Lỗi");
					}
						
				}
			///
			 request.setAttribute("count", uDao.count());
				doUser(request, response);
			
			
			
			PageInfo.prepareAndForward(request, response, PageType.ADMIN_PAGE);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Lỗi");

		}

	}
	
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int page = 0;
			try {
				page = Integer.parseInt(request.getParameter("page")) - 1;
			} catch (Exception ex) {
				page = 0;
			}
			request.setAttribute("items", getPaging(1));
			request.setAttribute("items", getPaging(page));
			request.setAttribute("currentPage", page + 1);
			request.setAttribute("maxPage", uDao.findAllUser());
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	public List<User> getPaging(int page) {
		return uDao.getPaging(page);
	}
}
