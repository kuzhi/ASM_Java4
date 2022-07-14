package asm.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	private VideoDAO vDao = new VideoDAO();

       
    /**
     * @see HttpServlet#HttpServlet()
  
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();

		Video video = new Video();
		if(uri.contains("edit")) {
			try {
				//su dung substring de lay ten id
				String id = uri.substring(uri.lastIndexOf("/") + 1);
				video = vDao.findByID(id);
				
				
				request.setAttribute("active", "openkey");
				request.setAttribute("iduser", "openkey");
				
				request.setAttribute("deactive", "closekey");
			} catch (Exception e) {
				// TODO: handle exception
				request.setAttribute("error", "Lỗi");

			}
		}
		
		request.setAttribute("video", video);
		 request.setAttribute("count", vDao.count());

		request.setAttribute("videos", vDao.findAllVideo());
		doVideo(request, response);
		
		

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
			save sav = new save();
			String des = request.getParameter("description");
			if(url.contains("create")) {
				try {
					getutubeID uID = new getutubeID();
					
					BeanUtils.populate(video, request.getParameterMap());
					
					String utubeID = uID.getYouTubeId(video.getId());
					if(utubeID == null) {
						request.setAttribute("error", "Video Id không đúng phải là đường dẫn youtube");

						
					}
					else {
						Video match = vDao.findByID(utubeID);

						
						 if(match != null) {
							request.setAttribute("error", "Video Id này đã có ");

							
						}
						 else {
							 File a ;
								if(request.getPart("poster").getSize() > 0) {
									a = sav.save(request, "poster");
									video.setPoster(a.getName());
								}else {
									
									video.setPoster("No-Image.png");				

								}
								
									 if(des !=null) {
										 video.setId(utubeID);
											
											
											vDao.insert(video);
									
									
									video= new Video();

									request.setAttribute("message", "Thêm thành công");
									 }
									 else {
											request.setAttribute("error", "Vui lòng thêm mô tả video");

									 }
										 
										
						 }
						
					}
					
				}
				 catch (Exception e) {
					request.setAttribute("error", "Lỗi");
					e.printStackTrace();
				}
			}
			else if(url.contains("update")) {
				try {
					
					BeanUtils.populate(video, request.getParameterMap());
					Video oldVideo = vDao.findByID(video.getId());

					String oldPoseter = oldVideo.getPoster();
					if(vDao.findByID(video.getId()) != null) {
						

						File a ;
						
						if(request.getPart("poster").getSize() == 0) {
							video.setPoster(oldPoseter);				
						}else {
							a = sav.save(request, "poster");
								video.setPoster(a.getName());
							
						}

						if(des != null) {
							vDao.update(video);
							
							
							request.setAttribute("video", video);
							
							request.setAttribute("message", "Cập nhật thành công");
						}
						
						else {
							request.setAttribute("error", "Vui lòng thêm mô tả video");

					 }
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
						video= new Video();

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
			
			 request.setAttribute("count", vDao.count());

				request.setAttribute("videos", vDao.findAllVideo());
				doVideo(request, response);
			
			
			
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Lỗi");

		}
	}
	
	protected void doVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			request.setAttribute("currentPage", page + 1);
			request.setAttribute("maxPage", vDao.findAllVideo());
			
		} catch (Exception e) {
				e.printStackTrace();
				
		}
		
		
	}
	public List<Video> getVideo(int page) {
		return vDao.getPagingVid(page);
	}
}
