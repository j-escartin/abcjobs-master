package com.abcjobs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs.model.UserDetails;
import com.abcjobs.model.Users;
import com.abcjobs.service.UsersDetailsService;
import com.abcjobs.service.UsersService;

@Controller
public class AuthController {
	
	@Autowired
	private UsersService us;
	
	@Autowired
	private UsersDetailsService ud;
	
	@RequestMapping(value = "/registration")
	public ModelAndView registration(HttpSession session) {
		return new ModelAndView("registration");
	}
	
	@RequestMapping(value="/registration", method = RequestMethod.POST)
	public String registration(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			Users user, UserDetails userDetails, Model model) throws Exception {
			try {
				user.setEmail(email);
				user.setPassword(password);
				user.setRoleId("2");
				user.setEmailVerifiedAt(java.time.LocalDate.now().toString());
				user.setCreatedAt(java.time.LocalDate.now().toString());
				us.register(user);
				
				userDetails.setUserId(us.getLastUser().split(",")[0]);
				userDetails.setFirstName(firstName);
				userDetails.setLastName(lastName);
				ud.register(userDetails);
				
				model.addAttribute("email", user.getEmail());
				return "thankyou";
			} catch (Exception e) {
				System.out.println(e);
			}
			model.addAttribute("errMsg", "Email has already taken");
			return "registration";	
	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session) throws Exception {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") Users user, HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		Users isLogin = us.login(user);
		
		if(isLogin != null) {
			session.setAttribute("email", isLogin.getEmail());
			session.setAttribute("userId", isLogin.getUserId());
			session.setAttribute("roleId", isLogin.getRoleId());
			session.setAttribute("isLogin", true);
			return new ModelAndView("redirect:/dashboard");
		}
		
		String msg = "Credentials is incorrect!";
		model.addAttribute("message", msg);
		return new ModelAndView("login");
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "login";
	}
	
	@RequestMapping( value = "/forgotPassword")
	public ModelAndView forgotPassword(HttpServletResponse res)	throws Exception {
		return new ModelAndView("forgotPassword");
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public String forgotPassword(@RequestParam("emailAddress") String email, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String checkEmail = us.checkEmail(email);
		
		if(checkEmail != null) {
			session.setAttribute("isReset", true);
			session.setAttribute("email", email);
			return "resetPassword";
		}
		
		String msg = "Email not Found";
		model.addAttribute("message", msg);
		return "forgotPassword";
	}
	
	@RequestMapping(value = "/reset")
	public ModelAndView reset(Model model, HttpSession session) throws Exception{
		if((Boolean) session.getAttribute("isReset")) {
			return new ModelAndView("resetPassword");
		}
		
		String msg = "Email Required!";
		model.addAttribute("message", msg);
		return new ModelAndView("forgotPassword");
		
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String reset(@RequestParam("password") String password, Model model, HttpSession session) throws Exception {
		try {
			us.updatePassword(password, (String) session.getAttribute("email"));
			
			String msg = "Password has been changed";
			model.addAttribute("scMessage",msg);
			session.invalidate();
		} catch (Exception e) {
			System.out.println(e);
			return "resetPassword";
		}
		
		return "login";
	}
	
	
}	