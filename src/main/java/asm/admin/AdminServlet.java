package asm.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		User user = null;

		UserDAO uDao = new UserDAO();
		 user = new User();
		 if(uri.contains("edit")) {
				try {
					//su dung substring de lay ten id
					String id = uri.substring(uri.lastIndexOf("/") + 1);
					user = uDao.findByID(id);
				} catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("error", "Lỗi");

				}
		 }
		request.setAttribute("user", user);
		request.setAttribute("items", uDao.findAll());
		
		
		
		PageInfo.prepareAndForward(request, response, PageType.ADMIN_PAGE);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String url = request.getRequestURI();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
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
			User user = new User();	
			
			UserDAO uDao = new UserDAO();


			
			
			if(url.contains("create")) {
				try {
					BeanUtils.populate(user, request.getParameterMap());
					uDao.insert(user);
					request.setAttribute("message", "Thêm thành công");
				}
				 catch (Exception e) {
					request.setAttribute("error", "Lỗi");
				}
			}
			 if(url.contains("update")) {
				try {
					
					BeanUtils.populate(user, request.getParameterMap());
					

					if(uDao.findByID(user.getId()) != null) {
						uDao.update(user);
						request.setAttribute("message", "Cập nhật thành công");
					}
					else {
						request.setAttribute("error", "Không có trong hệ thống");
					}
					user= new User();

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

						}
							
					} catch (Exception e) {
						request.setAttribute("error", "Lỗi");
					}
						
				}
			///
			request.setAttribute("user", user);
			request.setAttribute("items", uDao.findAll());
			
			
			
			PageInfo.prepareAndForward(request, response, PageType.ADMIN_PAGE);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Lỗi");

		}

	}

}
