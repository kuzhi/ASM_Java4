package asm.servlet;

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

import asm.DAO.UserDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.User;

/**
 * Servlet implementation class ProfileServlet
 */
@MultipartConfig
@WebServlet("/home/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO uDao = new UserDAO();
    private User u = new User();
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 u = (User)request.getSession().getAttribute("user");
		 
		 User a = uDao.findByID(u.getId());
		 if(a !=null) {
			 //doBirthDay(request, response, false, u.getBirthDay());
				request.setAttribute("user", a);
		 }
		
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_EDIT_PROFILE_PAGE);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			
			//doBirthDay(request, response, true, null);
			
			
			BeanUtils.populate(u, request.getParameterMap());
			

			if(uDao.findByID(u.getId()) != null) {
				uDao.update(u);
				 
				request.setAttribute("message", "Cập nhật thành công");
			}
			else {
				request.setAttribute("error", "Không có trong hệ thống");
			}
			

		} catch (Exception e) {
			request.setAttribute("error", "Lỗi");
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_EDIT_PROFILE_PAGE);

	}

	protected void doBirthDay(HttpServletRequest request, HttpServletResponse response, boolean paraOrnot, Date date) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatter1 = new SimpleDateFormat("DD/MM/YYYY");

			String getBirh= null;
			if(paraOrnot) {
				 getBirh = request.getParameter("birthDay");
				 
			}
			else {
				 getBirh = formatter.format(date);
				 System.out.println(getBirh);
			}
			if(getBirh.equals("")) {
				request.setAttribute("error", "Vui lòng điền các trường");

			}
			else {
				Date setDate = formatter.parse(getBirh);

			

			DateTimeConverter dtc = new DateConverter(setDate) ;
			dtc.setPattern("dd/MM/yyyy");
			ConvertUtils.register(dtc, Date.class);
			}
			
			
			

		} catch (Exception e) {
			request.setAttribute("error", "Lỗi");
			e.printStackTrace();
		}
		

	}
	
	
}
