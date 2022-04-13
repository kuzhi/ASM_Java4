package asm.admin;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;



import asm.DAO.VideoDAO;
import asm.common.PageInfo;
import asm.common.PageType;
import asm.entity.User;
import asm.entity.Video;
import asm.helper.getutubeID;
import asm.helper.save;

/**
 * Servlet implementation class VideosManagementServlet
 */
@MultipartConfig
@WebServlet({"/admin/VideoManagement/index","/admin/VideoManagement/create","/admin/VideoManagement/edit/*","/admin/VideoManagement/update","/admin/VideoManagement/delete",
	"/admin/VideoManagement/reset"})
public class VideosManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
  
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();

		Video video = new Video();
		VideoDAO vDao = new VideoDAO();
		if(uri.contains("edit")) {
			try {
				//su dung substring de lay ten id
				String id = uri.substring(uri.lastIndexOf("/") + 1);
				video = vDao.findByID(id);
			} catch (Exception e) {
				// TODO: handle exception
				request.setAttribute("error", "Lỗi");

			}
		}
		request.setAttribute("video", video);
		request.setAttribute("videos", vDao.findAll());
		
		
		request.setAttribute("view_menuAdmin", "/views/layout/menuAdmin.jsp");
		request.setAttribute("view_mainbodyAdmin", "/views/layout/mainbodyAdmin.jsp");
		request.setAttribute("view_footerAdmin", "/views/layout/footer.jsp");

		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String url = request.getRequestURI();
			Video video = new Video();
			VideoDAO vDao = new VideoDAO();
			save sav = new save();
			if(url.contains("create")) {
				try {
					getutubeID uID = new getutubeID();
					
					BeanUtils.populate(video, request.getParameterMap());
					String utubeID = uID.getYouTubeId(video.getId());
					
					File a ;
					String nameFIle = null;
					
					
						 a = sav.save(request, "file", "poster");
						 nameFIle = a.getPath();
							video.setPoster(a.getName());
							video.setId(utubeID);
					
					
							vDao.insert(video);
					
					
					request.setAttribute("a", nameFIle);
					request.setAttribute("message", "Thêm thành công");
				}
				 catch (Exception e) {
					request.setAttribute("error", "Lỗi");
					e.printStackTrace();
				}
			}
			else if(url.contains("update")) {
				try {
					
					BeanUtils.populate(video, request.getParameterMap());
					
					if(vDao.findByID(video.getId()) != null) {
						
						File a ;
						String nameFIle = null;
						
						
							 a = sav.save(request, "file", "poster");
							 nameFIle = a.getPath();
								video.setPoster(a.getName());

						
						
						vDao.update(video);
						
						
						request.setAttribute("a", nameFIle);

						request.setAttribute("message", "Cập nhật thành công");
					}
					else {
						request.setAttribute("error", "Không có trong hệ thống");
						
					}
					
				} catch (Exception e) {
					request.setAttribute("error", "Lỗi hoặc bạn chưa thay đổi hình ảnh");
					e.printStackTrace();

				}
				
				
			}
			
			else if(url.contains("delete")) {
				try {
					
					BeanUtils.populate(video, request.getParameterMap());
					if(vDao.findByID(video.getId()) != null) {
						vDao.delete(video.getId());
						request.setAttribute("message", "Xóa thành công");
					}
					else {
						request.setAttribute("error", "Không có trong hệ thống");
					}
					
				} catch (Exception e) {
					request.setAttribute("error", "Lỗi");
				}
				
				
			}
			
			if(url.contains("reset")) {
				
				try {
					video= new Video();
				
			} catch (Exception e) {
				request.setAttribute("error", "Lỗi");
				e.printStackTrace();
			}
				
		}
			
			request.setAttribute("video", video);
			request.setAttribute("videos", vDao.findAll());
			
			request.setAttribute("view_menuAdmin", "/views/layout/menuAdmin.jsp");
			request.setAttribute("view_mainbodyAdmin", "/views/layout/mainbodyAdmin.jsp");
			request.setAttribute("view_footerAdmin", "/views/layout/footer.jsp");
			
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Lỗi");

		}
	}
	
	
}
