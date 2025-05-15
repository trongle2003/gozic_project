package com.example.demo.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Tên tài khoản không được để trống")
    private String fullName;

    @NotEmpty(message = "Email không được để trống")
    private String email;

    @NotEmpty(message = "Mật khẩu không được để trống")
    @Size(min = 3, message = "Mật khẩu phải có 3 kí tự trở lên")
    private String password;

}
