package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
public class UserController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public String createUser(@Valid @ModelAttribute("newUser") User user,
            BindingResult result,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model) {
        // Kiểm tra mật khẩu khớp
        if (!user.getPassword().equals(confirmPassword)) {
            model.addAttribute("passwordMismatch", "Mật khẩu và xác nhận mật khẩu không khớp");
            result.rejectValue("password", "error.password", "Mật khẩu không khớp");
        }
        if (result.hasErrors()) {
            return "client/auth/register";
        }
        // Mã hóa mật khẩu
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        this.userService.fetchNewUser(user);
        return "redirect:/login";
    }
}