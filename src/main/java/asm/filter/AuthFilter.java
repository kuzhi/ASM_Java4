package asm.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import asm.entity.User;

@WebFilter(filterName = "AuthFilter", urlPatterns = {"/admin/*"})
public class AuthFilter implements javax.servlet.Filter{
		private String error1 = "";

	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		User userCheck = (User)req.getSession().getAttribute("user");
		if(userCheck == null) {
			error1 ="Please login!";
			System.out.println(error1);

		}
		else if(!userCheck.isAdmin() && uri.contains("/admin")) {
			error1 ="Please login with  Admin role!";

		}
		
		if(!error1.isEmpty()) {

			req.getSession().setAttribute("error1", error1);
			resp.sendRedirect(req.getContextPath()+"/error");
		}
		else {

			
			
			
			// pass the request along the filter chain
			chain.doFilter(req, resp);
		}
		
	}

    /**
     * @see HttpFilter#HttpFilter()
     */


	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	

	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	

}
