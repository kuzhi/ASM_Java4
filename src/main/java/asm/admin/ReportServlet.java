package asm.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import asm.DAO.reportDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.Report;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/admin/Report/index")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		reportDAO reDao = new reportDAO();
		
		
		
		
		request.setAttribute("reports1", reDao.thongKeLuotThich());
		
		
		request.setAttribute("view_menuAdmin", "/views/layout/menuAdmin.jsp");
		request.setAttribute("view_mainbodyAdmin", "/views/layout/mainbodyAdmin.jsp");
		request.setAttribute("view_footerAdmin", "/views/layout/footer.jsp");

		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
