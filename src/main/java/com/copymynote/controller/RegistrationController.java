package com.copymynote.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.copymynote.model.User;
import com.copymynote.repository.UserRepository;

@Controller
public class RegistrationController {

	@Autowired
	private UserRepository userRepository;

	// This method open Registration page
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String showLoginPage(ModelMap model){


		return "register";
	}
	//Register page saveUser action called and check all validation like duplicate email/username etc and if 
	// sucessfully register then redirect to view note page
	@RequestMapping(value="/saveUser", method = RequestMethod.POST)
	public String saveUser(ModelMap model,@ModelAttribute("user") User user,HttpServletRequest request){

		User alreadyEmailFound=userRepository.findByemail(user.getEmail());
		User alreadyUserIDFound=userRepository.findByuname(user.getUname());
		User alreadyRecoveryMailFound=null;
		if(!StringUtils.isEmpty(user.getRecoveryEmail())){
		alreadyRecoveryMailFound=userRepository.findByrecoveryEmail(user.getRecoveryEmail());
		}
		User alreadyMobileFound=null;
		if(!StringUtils.isEmpty(user.getMobile())){
		alreadyMobileFound=userRepository.findBymobile(user.getMobile());
		}
		

		boolean isError=false;
	

		if(alreadyEmailFound!=null)
		{
			model.put("errorMessage", "Email ID already registred");
			isError=true;

		}
		

		else if(alreadyUserIDFound!=null)
		{
			model.put("errorMessage", "User ID already registred");
			isError=true;


		}
		else if(alreadyRecoveryMailFound!=null&&(!StringUtils.isEmpty(alreadyRecoveryMailFound.getRecoveryEmail())))
		{
			model.put("errorMessage", "Recovery Email ID already registred");
			isError=true;

		}
		else if(alreadyMobileFound!=null&&(!StringUtils.isEmpty(alreadyRecoveryMailFound.getMobile())))
		{
			model.put("errorMessage", "Mobile No already registred");
			isError=true;

		}

			
		else
		{
			User registeredUser=userRepository.save(user);
			HttpSession session = request.getSession();  
			session.setAttribute("userId", registeredUser.getId().toString());
		}


		if(isError)
		{
			return "register";

		}
		else
			return "redirect:/viewNote";
	}


}
