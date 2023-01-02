package com.abcjobs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs.model.UserDetails;
import com.abcjobs.service.EducationService;
import com.abcjobs.service.ExperienceService;
import com.abcjobs.service.UsersDetailsService;

@Controller
public class SearchController {
	
	@Autowired
	UsersDetailsService ud;
	
	@Autowired
	EducationService eds;
	
	@Autowired
	ExperienceService exs;
	
	private void setModel(Model model, HttpSession session, String uId) {
		
		String userId = String.valueOf(uId);
		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("firstName", userDetails[1] );
		model.addAttribute("lastName", userDetails[2]);
		
		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
		model.addAttribute("title", userDetails[3]);
		model.addAttribute("about", userDetails[4]);
		model.addAttribute("company", userDetails[5]);
		model.addAttribute("website", userDetails[6]);

		model.addAttribute("email", session.getAttribute("email"));
		
		// experiences
		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
		
		// educations
		model.addAttribute("ed", eds.getEducationByUserDetailsId(udID)); // Educations[]	
	}	
	
	@RequestMapping(value = "/search")
	public ModelAndView search(HttpServletRequest req, Model model) throws Exception{
		String q = req.getParameter("q"); 
		
		if(q != null && !q.equals("")) {
			List<UserDetails> selectedUser = ud.searchByKey(q);
			model.addAttribute("selected", selectedUser);
			
			if(selectedUser.size()  == 0) {
				model.addAttribute("notFound", true);
			}
		}
		
		return new ModelAndView("search");
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public ModelAndView searchProfile(@RequestParam("uId") String uId, Model model, HttpSession session ) 
			throws Exception{
			this.setModel(model, session, uId);
			return new ModelAndView("result");
	}
	
	
}
