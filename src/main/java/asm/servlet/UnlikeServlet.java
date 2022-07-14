package asm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import asm.DAO.FavoriteDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.Favorite;
import asm.entity.User;
import asm.entity.Video;

/**
 * Servlet implementation class LikeUnlikeServlet
 */
@WebServlet({"/home/unlike","/home/QLlike"})
public class UnlikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private FavoriteDAO fDao = new FavoriteDAO(); 
      private User u = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 u = (User) request.getSession().getAttribute("user");

		String uri = request.getRequestURI();
		
		if(uri.contains("unlike")) {
			System.out.println("aaa");
			String videoId = request.getParameter("idLi");
			System.out.println(videoId);
			List<Favorite> removeF = fDao.findByKeywordUserAndVideo(u.getId(), videoId);
			
			for(Favorite f : removeF) {
				fDao.delete(String.valueOf(f.getId()));

			}
			response.sendRedirect(request.getContextPath()+"/home/QLlike");

		}
		if(uri.contains("QLlike")) {
			doQLLike(request, response);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITE_PAGE);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doQLLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 u = (User) request.getSession().getAttribute("user");
		try {
			int page = 0;
			try {
				page = Integer.parseInt(request.getParameter("page")) - 1;
			} catch (Exception ex) {
				page = 0;
			}
			List<Favorite> listFavor1= getVideoFav(1,u.getId());
			List<Favorite> listFavorPage= getVideoFav(page,u.getId());

			List<Video> videoListF= new ArrayList<>();
			List<Video> videoListP= new ArrayList<>();
			
			for(Favorite f: listFavor1) {
			
				videoListF.add(f.getVideo());
			}
			for(Favorite f: listFavorPage) {
				
				videoListP.add(f.getVideo());
			}
			
			request.setAttribute("videos", videoListF);
			request.setAttribute("videos", videoListP);
			request.setAttribute("currentPage", page+1);
			request.setAttribute("maxPage", fDao.findAllViFav(u.getId()));
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
	}
	
	
	public List<Favorite> getVideoFav(int page, String userId) {
		return fDao.getPagingVidFav(page, userId);
	}
}
