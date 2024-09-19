package com.jobportal.interceptor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {
	private static final Logger LOGGER = LogManager.getLogger(HandlerInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);

		if (session == null) {
			  LOGGER.warn("Session is null for request: {}");
			 response.sendRedirect("/SpringJobPortal/error404");
			
			return false;
		}

		String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;
		String requestURI = request.getRequestURI();

		if (userRole == null) {
			  LOGGER.warn("User role is not set for request: {}", requestURI);
			
			 response.sendRedirect("/SpringJobPortal/error401");
			return false;
		}
		 if (isSessionExpired(session)) {
	            LOGGER.warn("Session has expired for request: {}", request.getRequestURI());
	            session.invalidate();
	            response.sendRedirect("/SpringJobPortal/error404");
	            return false;
	        }
		
		  LOGGER.info("User role: {}", userRole);

		if (userRole.equals("ADMIN")) {
			System.out.println("Admin error ");
		} else if (userRole.equals("EMPLOYER")) {
			if (requestURI.startsWith("/admin")) {
				LOGGER.error("Access denied for employer to admin area: {}", requestURI);
				response.sendError(HttpStatus.FORBIDDEN.value(), "Access denied for employers");
				return false;
			}
		} else if (userRole.equals("JOBSEEKER")) {
			if (requestURI.startsWith("/employer")) {
				   LOGGER.error("Access denied for job seeker to employer area: {}", requestURI);
				response.sendError(HttpStatus.FORBIDDEN.value(), "Access denied for job seekers");
				return false;
			}
		} else {
			 LOGGER.error("Invalid user role: {}", userRole);
			response.sendError(HttpStatus.UNAUTHORIZED.value(), "Invalid user role");
			return false;
		}

		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.setHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");

		return true;
	}
	 private boolean isSessionExpired(HttpSession session) {
	        long currentTime = System.currentTimeMillis();
	        long lastAccessedTime = session.getLastAccessedTime();
	        long sessionTimeout = 1 * 60 * 1000; 

	        return (currentTime - lastAccessedTime) > sessionTimeout;
	    }
}
