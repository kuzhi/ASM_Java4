package asm.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import asm.DAO.FavoriteDAO;
import asm.DAO.VideoDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.Favorite;
import asm.entity.User;
import asm.entity.Video;
import asm.jpa.jpaUtils;
/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/home/index","/home/product","/home/answer","/home/contact","/home/share","/home/detailVideo","/home/watchVideo","/home/like","/home/search"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private VideoDAO vDAO = new VideoDAO();
    private FavoriteDAO fDAO = new FavoriteDAO();
    private String videoIdDe = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		System.out.println(videoIdDe);
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
		
		
		
		if(uri.contains("like")) {
			
			doLike(request, response, videoIdDe);

			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		// TODO Auto-generated method stub
		System.out.println(request.getServletContext().getContextPath());
		String uri = request.getRequestURI();
		
		
		if(uri.contains("search")) {
			String videoTitle = request.getParameter("titleVideo");
			try {
					List<Video> list = vDAO.findByTitle(videoTitle);
				if(list.size()==0) {
					request.setAttribute("errorSearch", "Không có trong hệ thống ");

					doProduct(request, response); 
					
				}
				else {

					request.setAttribute("videos", list);

				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_HOME_PAGE);
		}
	}
	
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
			request.setAttribute("currentPage", page+1);
			request.setAttribute("maxPage", vDAO.findAllVi());
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	protected void doDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
				 videoIdDe = request.getParameter("idVi");
			request.setAttribute("video", vDAO.findByID(videoIdDe));
			
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	protected void doWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			videoIdDe = request.getParameter("idVi");
				Video vi = vDAO.findByID(videoIdDe);
				vDAO.tangLuotXem(vi);
				
			//luu lai cac video nguoi dung xem
				
			request.setAttribute("video", vi);
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	protected void doLike(HttpServletRequest request, HttpServletResponse response, String videoIDDE) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String videoId=null;
			
			User u = (User)request.getSession().getAttribute("user");
			System.out.println(u.getId());
				
				 videoId = request.getParameter("idLi");
				 if(videoId==null) {
					 List<Favorite> check = fDAO.findByKeywordUserAndVideo(u.getId(), videoIDDE);
					if(check.size()==0) {
						Video addlike = vDAO.findByID(videoIDDE);
						Favorite f = new Favorite();
						f.setUser(u);
						f.setVideo(addlike);
						fDAO.insert(f);
						System.out.println("done");
					}
					
						
						response.sendRedirect(request.getContextPath()+"/home/detailVideo?idVi="+videoIDDE);

				 }
				 else {
					 
					 List<Favorite>	 check2 = fDAO.findByKeywordUserAndVideo(u.getId(), videoId);

					 	if(check2.size()==0) {
					 		Video addlike = vDAO.findByID(videoId);
							Favorite f = new Favorite();
							f.setUser(u);
							f.setVideo(addlike);
							fDAO.insert(f);
							System.out.println("doneaa");

					 	}
						
						
						
						response.sendRedirect(request.getContextPath()+"/home/index");

						
				 }
				
			
				
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	
	public List<Video> getVideo(int page) {
		return vDAO.getVideoPaging(page);
	}
}
