package com.example.demo.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.domain.PasswordResetToken;
import com.example.demo.domain.User;
import com.example.demo.repository.PasswordResetTokenRepository;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordResetTokenRepository tokenRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordResetTokenRepository tokenRepository,
            PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.tokenRepository = tokenRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User fetchNewUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public void updatePassword(User user, String newPassword) {
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    public void createPasswordResetToken(User user, String token) {
        // Tìm và xóa token cũ của user này (nếu có)
        PasswordResetToken existingToken = tokenRepository.findByUserId(user.getId());
        if (existingToken != null) {
            tokenRepository.delete(existingToken);
        }
        // Tạo token mới
        PasswordResetToken resetToken = new PasswordResetToken(user, token);
        tokenRepository.save(resetToken);
    }

    public PasswordResetToken getPasswordResetToken(String token) {
        return tokenRepository.findByToken(token);
    }

    public void deletePasswordResetToken(String token) {
        PasswordResetToken resetToken = tokenRepository.findByToken(token);
        if (resetToken != null) {
            tokenRepository.delete(resetToken);
        }
    }

    // Cập nhật phương thức để nhận User thay vì Long
    public PasswordResetToken getPasswordResetTokenByUser(User user) {
        if (user == null) {
            return null;
        }
        return tokenRepository.findByUserId(user.getId());
    }
}