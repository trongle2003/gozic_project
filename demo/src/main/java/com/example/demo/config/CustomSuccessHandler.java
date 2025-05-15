package com.example.demo.config;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    private static final Logger logger = LoggerFactory.getLogger(CustomSuccessHandler.class);

    @Autowired
    private UserService userService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            logger.warn("Response đã được commit, không thể chuyển hướng đến {}", targetUrl);
            return;
        }

        logger.info("Người dùng {} đăng nhập thành công, chuyển hướng đến {}", authentication.getName(), targetUrl);
        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);
    }

    protected String determineTargetUrl(Authentication authentication) {
        return "/";
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            logger.warn("Không có session để xóa thuộc tính xác thực");
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("id", user.getId());
            logger.info("Lưu thông tin người dùng vào session: fullName={}, email={}, id={}",
                    user.getFullName(), user.getEmail(), user.getId());
        } else {
            logger.warn("Không tìm thấy người dùng với email: {}", email);
        }
    }
}