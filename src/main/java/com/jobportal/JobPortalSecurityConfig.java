//package com.jobportal;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//public class JobPortalSecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//            .authorizeRequests()
//                .antMatchers("/public/**").permitAll()
//                .anyRequest().authenticated()
//                .and()
//            .formLogin()
//                .loginPage("/login")
//                .permitAll()
//                .and()
//            .logout()
//                .logoutUrl("/logout")
//                .logoutSuccessUrl("/login?logout")
//                .invalidateHttpSession(true) // Invalidate the session
//                .deleteCookies("JSESSIONID") // Delete the session cookie
//                .permitAll()
//                .and()
//            .csrf(); // Enable CSRF protection
//    }
//}
//
