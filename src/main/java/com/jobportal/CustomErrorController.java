package com.jobportal;


import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController  {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.UNAUTHORIZED.value()) {
                return "401";
            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return "403";
            }
        }
        System.out.println("welcome121@@@@");
        return "error";
    }

//    @Override
//    public String getErrorPath() {
//        return "/error";
//    }
}

