package asm.servlet;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import asm.DAO.VideoDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.User;
import asm.entity.Video;
import asm.jpa.jpaUtils;
/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/home/index","/home/product","/home/answer","/home/contact","/home/share","/home/like","/home/detailVideo","/home/watchVideo"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private VideoDAO vDAO = new VideoDAO();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uri = request.getRequestURI();
		User u = (User)request.getSession().getAttribute("user");
		if(uri.contains("answer")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_ANSWER_PAGE);
			return;
		}
		if(uri.contains("index")) {
			doProduct(request, response);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_HOME_PAGE);
			return;
		}
		if(uri.contains("contact")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CONTACT_PAGE);
			return;
		}
		if(uri.contains("product")) {
			doProduct(request, response);
			response.sendRedirect(request.getContextPath()+"/home/index");
			
			
		}
		if(uri.contains("detailVideo")) {
			doDetail(request, response);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_VIDEO_DETAIL_PAGE);
			return;
		}
		if(uri.contains("watchVideo")) {
			doWatch(request, response);

			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_WATCH_VIDEO_PAGE);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int page = 0;
			try {
				page = Integer.parseInt(request.getParameter("page")) - 1;
			} catch (Exception ex) {
				page = 0;
			}
			request.setAttribute("videos", getVideo(1));
			request.setAttribute("videos", getVideo(page));
			request.setAttribute("maxPage", vDAO.findAllVi());
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	protected void doDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
				String videoId = request.getParameter("idVi");
			request.setAttribute("video", vDAO.findByID(videoId));
			
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	protected void doWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
				String videoId = request.getParameter("idVi");
				Video vi = vDAO.findByID(videoId);
				vDAO.tangLuotXem(vi);
				
			request.setAttribute("video", vi);
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	
	
	public List<Video> getVideo(int page) {
		return vDAO.getVideoPaging(page);
	}
}
