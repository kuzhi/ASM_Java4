package asm.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import asm.DAO.VideoDAO;
import asm.DAO.reportDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.Report;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet({"/admin/Report/index","/admin/Report/favByVideos","/admin/Report/usersend"})
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private reportDAO reDao = new reportDAO();
	
    private VideoDAO vd = new VideoDAO();   
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		reportFavorites(request, response);
		request.setAttribute("tab_active", "thongkeluotthich");

		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reportFavorites(request, response);

		String uri = request.getRequestURI();
		if(uri.contains("favByVideos")) {
			reportFavoritesByVideos(request, response);
			}
		
		if(uri.contains("usersend")) {
			reportShareByUser(request, response);
			}
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);

	}
	
	protected void reportFavorites(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		
		request.setAttribute("videos", vd.findAll());
		
		request.setAttribute("reports1", reDao.thongKeLuotThich());

		
	}
	
	protected void reportFavoritesByVideos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String title = request.getParameter("title");
		List<Object[]> list = reDao.findVideoByNameUser(title);
		
		
		
		request.setAttribute("tab_active", "locnguoiyeuthich");
		request.setAttribute("title", title);
		request.setAttribute("favUser", list);
		
		
		
	}
	
	protected void reportShareByUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String userSends = request.getParameter("userSends");
		List<Object[]> list = reDao.findVideoByNameShare(userSends);
		
		
		
		request.setAttribute("tab_active", "locnguoigui");
		request.setAttribute("userSends", userSends);
		request.setAttribute("userSend", list);
		
		
		
	}
}
