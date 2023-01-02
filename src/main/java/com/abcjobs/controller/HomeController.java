package com.abcjobs.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
		@RequestMapping("/thankyou")
		public ModelAndView thankyou(HttpServletResponse res) throws Exception {
			return new ModelAndView("thankyou");
		}
		
		@RequestMapping("/verified")
		public ModelAndView verified() throws Exception{
			return new ModelAndView("verified");
		}
}
