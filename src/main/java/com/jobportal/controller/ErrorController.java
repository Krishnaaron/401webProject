package com.jobportal.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ErrorController {
   @GetMapping("/error404")
   public ModelAndView error404() {
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("Error/404");
	   return mv;
   }
   @GetMapping("/error401")
   public ModelAndView error401() {
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("Error/401");
	   return mv;
   }
	
}
