package asm.jpa;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//mat khau wlancjljovcyitpi

import asm.common.PageInfo;
import asm.common.PageType;
import asm.DAO.ShareDAO;
import asm.DAO.UserDAO;
import asm.DAO.VideoDAO;
import asm.entity.Share;
import asm.entity.User;
import asm.entity.Video;

/**
 * Servlet implementation class a
 */
@MultipartConfig
@WebServlet({"/home/sendmail","/home/forgot-password"})
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ShareDAO dao = new ShareDAO();   
    private VideoDAO videodao = new VideoDAO();
    private UserDAO udao = new UserDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.contains("forgot-password")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FORGOT_PASSWORD_PAGE);
		}
		if(uri.contains("sendmail")) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_HOME_PAGE);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uri = request.getRequestURI();
		if(uri.contains("forgot-password")) {
			doForgot(request, response);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FORGOT_PASSWORD_PAGE);
		}
		if(uri.contains("sendmail")) {
			doSendmail(request, response);
			response.sendRedirect(request.getContextPath()+"/home/index");
		}
		

	}
	
	public void doSendmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u = (User) request.getSession().getAttribute("user");
		String idVideo = request.getParameter("id");
		String email = request.getParameter("email");
		String noidung = request.getParameter("review");
		Properties prop = new Properties();

		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				 String username = "kirudono@gmail.com";
				 String password = "wlancjljovcyitpi";
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(u.getEmail()));
			message.setRecipients(Message.RecipientType.TO, email);
			message.setSubject("Share video", "utf-8");
			message.setText("<a href='http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/home/detailVideo?idVi="+idVideo+"'>Link</a> </br> "+ noidung, "utf-8", "html");
			message.setReplyTo(message.getFrom());
			
			Transport.send(message);
			Video vi = videodao.findByID(idVideo);
			//(Long shardeID, User user, Video video, String email, Date shareDate
			Share s = new Share(u,vi,email,new Date());
			dao.insert(s);
			
			request.setAttribute("message", "gửi email thành công");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "gửi email thất bại");
		}
			
	}
	
	protected void doForgot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Properties prop = new Properties();
		List<User> list = new ArrayList<User>();
		User user = new User();

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		
		Session sesi = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				 String username = "kirudono@gmail.com";
				 String password = "wlancjljovcyitpi";
				return new PasswordAuthentication(username,password);
			}
			
		});
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		 list = udao.findByUser(id, email);

		if(list.size() > 0 ) {
			//tao message
			for(User u : list) {
				user = u;
			}
			String emailTO = request.getParameter("email");
			String emailSubject = "no-reply-mail: Mật khẩu ";
			String emailContent = "Mật khẩu: "+user.getPassword();		
			String emailFrom = "kirudono@gmail.com";

			
			MimeMessage message = new MimeMessage(sesi);
			try {
				message.setFrom(new InternetAddress(emailFrom));
				message.setRecipient(RecipientType.TO, new InternetAddress(emailTO));
				message.setText(emailContent,"utf-8");
				message.setSubject("<h1>"+emailSubject+"</h1>","utf-8");
				message.setReplyTo(message.getFrom());
				Transport.send(message);
				request.setAttribute("message", "Gửi mail thành công!");


			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				request.setAttribute("message", "Gửi mail không thành công!");
			}
		}
		
		else {
			request.setAttribute("errordnID", "Sai tên đăng nhập hoặc email!");
		}
		
	}
	
	public void doSendmailCongra(HttpServletRequest request, HttpServletResponse response, User u) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = u.getEmail();
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				 String username = "kirudono@gmail.com";
				 String password = "wlancjljovcyitpi";
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(u.getEmail()));
			message.setRecipients(Message.RecipientType.TO, email);
			message.setSubject("no-reply-email, Thư chúc mừng", "utf-8");
			message.setText("<h1>Chúc mừng bạn đã đăng ký thành công! </br> Mong bạn sẽ có những trải nghiệm tuyệt vời tại website của chúng tôi!!</h1>", "utf-8", "html");
			message.setReplyTo(message.getFrom());
			
			Transport.send(message);
			
			
			request.setAttribute("message", "gửi email thành công");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "gửi email thất bại");
		}
			
	}
}
