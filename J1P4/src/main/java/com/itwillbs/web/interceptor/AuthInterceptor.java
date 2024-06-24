package com.itwillbs.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.dto.ManagerDTO;

public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        ManagerDTO loggedInManager = (ManagerDTO) session.getAttribute("manager");

        if (loggedInManager == null) {
            response.sendRedirect("/admin/login");
            return false;
        }
        
        if (!"admin".equals(loggedInManager.getManager_id()) && request.getRequestURI().contains("/admin/managers/")) {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('관리자만 접근 가능한 메뉴입니다. 메인 페이지로 이동합니다.'); window.location.href = '/admin/main';</script>");
            response.getWriter().flush();
            return false;
        }
        if (!"admin".equals(loggedInManager.getManager_id()) && request.getRequestURI().contains("/admin/announcement/")) {
        	response.setContentType("text/html; charset=UTF-8");
        	response.getWriter().write("<script>alert('관리자만 접근 가능한 메뉴입니다. 메인 페이지로 이동합니다.'); window.location.href = '/admin/main';</script>");
        	response.getWriter().flush();
        	return false;
        }
        
        
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
