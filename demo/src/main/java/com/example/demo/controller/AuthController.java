package com.example.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.domain.PasswordResetToken;
import com.example.demo.domain.User;
import com.example.demo.service.EmailService;
import com.example.demo.service.UserService;
import java.util.UUID;

@Controller
public class AuthController {

    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    private final EmailService emailService;
    private final UserService userService;

    public AuthController(EmailService emailService, UserService userService) {
        this.emailService = emailService;
        this.userService = userService;
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("newUser", new User());
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "client/auth/login";
    }

    @GetMapping("/forgot")
    public String showForgotPasswordForm(@RequestParam(value = "token", required = false) String token, Model model) {
        logger.info("Accessing forgot password page with token: {}", token);
        if (token != null) {
            logger.debug("Validating token: {}", token);
            PasswordResetToken resetToken = userService.getPasswordResetToken(token);
            if (resetToken == null) {
                logger.warn("Token not found: {}", token);
                model.addAttribute("error", "Token không hợp lệ!");
            } else if (resetToken.isExpired()) {
                logger.warn("Token expired: {}", token);
                model.addAttribute("error", "Token đã hết hạn!");
            } else {
                logger.info("Token valid for user: {}", resetToken.getUser().getEmail());
                model.addAttribute("token", token);
                model.addAttribute("email", resetToken.getUser().getEmail());
            }
        }
        return "client/auth/forgot-password";
    }

    @PostMapping("/forgot")
    public String processForgotPassword(
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "token", required = false) String token,
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            Model model) {

        logger.info("Processing forgot password request for email: {}", email);

        if (token == null) {
            if (email == null || email.isEmpty()) {
                logger.warn("Email is empty or null");
                model.addAttribute("error", "Vui lòng nhập email!");
                return "client/auth/forgot-password";
            }

            logger.debug("Fetching user by email: {}", email);
            User user = userService.getUserByEmail(email);
            if (user == null) {
                logger.warn("User not found for email: {}", email);
                model.addAttribute("error", "Email không tồn tại!");
                return "client/auth/forgot-password";
            }

            try {
                logger.debug("Checking for existing token for user: {}", user.getEmail());
                PasswordResetToken existingToken = userService.getPasswordResetTokenByUser(user);
                if (existingToken != null) {
                    logger.info("Deleting existing token for user: {}", user.getEmail());
                    userService.deletePasswordResetToken(existingToken.getToken());
                }

                logger.debug("Creating new token for user: {}", user.getEmail());
                String newToken = UUID.randomUUID().toString();
                userService.createPasswordResetToken(user, newToken);

                logger.debug("Generating reset link for token: {}", newToken);
                String resetLink = "http://localhost:8081/forgot?token=" + newToken;

                logger.info("Sending reset email to: {}", email);
                emailService.sendResetPasswordEmail(email, resetLink);

                logger.info("Reset email sent successfully to: {}", email);
                model.addAttribute("message", "Liên kết đặt lại mật khẩu đã được gửi đến email của bạn!");
            } catch (Exception e) {
                logger.error("Error processing forgot password for email {}: {}", email, e.getMessage(), e);
                model.addAttribute("error",
                        "Không thể gửi email. Vui lòng kiểm tra cấu hình hoặc thử lại sau! Chi tiết: "
                                + e.getMessage());
                return "client/auth/forgot-password";
            }
            return "client/auth/forgot-password";
        }

        logger.debug("Processing password reset with token: {}", token);
        PasswordResetToken resetToken = userService.getPasswordResetToken(token);
        if (resetToken == null) {
            logger.warn("Invalid token: {}", token);
            model.addAttribute("error", "Token không hợp lệ!");
            model.addAttribute("token", token);
            model.addAttribute("email", email);
            return "client/auth/forgot-password";
        }

        if (resetToken.isExpired()) {
            logger.warn("Expired token: {}", token);
            model.addAttribute("error", "Token đã hết hạn!");
            model.addAttribute("token", token);
            model.addAttribute("email", email);
            return "client/auth/forgot-password";
        }

        if (!newPassword.equals(confirmPassword)) {
            logger.warn("Password and confirm password do not match");
            model.addAttribute("error", "Mật khẩu không khớp!");
            model.addAttribute("token", token);
            model.addAttribute("email", email);
            return "client/auth/forgot-password";
        }

        logger.debug("Updating password for user: {}", resetToken.getUser().getEmail());
        User user = resetToken.getUser();
        userService.updatePassword(user, newPassword);
        userService.deletePasswordResetToken(token);

        logger.info("Password reset successful for user: {}", user.getEmail());
        model.addAttribute("message", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập.");
        return "client/auth/login";
    }
}