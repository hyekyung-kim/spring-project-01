package com.example.demo.config;

import com.example.demo.handler.OnLoginSuccessHandler;
import com.example.demo.handler.OnLogoutSuccessHandler;
import com.example.demo.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfigure extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsServiceImpl userDetailsServiceImpl;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic().and().authorizeRequests()
                .antMatchers("/signin/process").permitAll()
                .antMatchers("/request-analysis").permitAll()
                .antMatchers("/index").hasRole("ADMIN")
                .antMatchers("/manage-request").hasRole("ADMIN")
             .and().logout().permitAll()
             .and().formLogin()
                .usernameParameter("name")
                .passwordParameter("password")
                .loginPage("/login")                    // 첫 로그인 페이지
                .loginProcessingUrl("/signin")          // 로그인 버튼 클릭시
                .successHandler(new OnLoginSuccessHandler())
             .and().logout()
                .logoutUrl("/signout/process")          // 로그아웃 요청 url
                .logoutSuccessHandler(new OnLogoutSuccessHandler())
             .and().csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
        auth.userDetailsService(userDetailsServiceImpl).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}