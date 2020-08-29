package com.copymynote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.copymynote.model.User;
import com.copymynote.repository.UserRepository;
import com.copymynote.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	LoginService loginService;


     // Login Form Page
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String showLoginPage(ModelMap model){
		return "login";
	}

	  // Login Form submit action. This method validate user crediential  and set session if sucessfully loggin
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String showWelcomePage(ModelMap model,HttpServletRequest request){
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		boolean isEmail=false;
		if(name.contains("@"))
		{
			isEmail=true;
		}		
		User loggedInUser= loginService.validateUser(name, password,isEmail);
		if (loggedInUser==null) {
			model.put("errorMessage", "Invalid Credentials");
			return "login";
		}
		HttpSession session = request.getSession();  
		session.setAttribute("userId", loggedInUser.getId().toString());
		return "redirect:/viewNote";
	}

	
	//Logout method which will invalidate the session when user click on logged out
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model,HttpServletRequest request){
		HttpSession session=request.getSession();  
		session.invalidate();
		return "login";
	}

}
