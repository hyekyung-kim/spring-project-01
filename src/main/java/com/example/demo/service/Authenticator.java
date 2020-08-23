package com.example.demo.service;

import com.example.demo.controller.LoginForm;

public interface Authenticator {
    void authenticate(LoginForm loginForm);
}
