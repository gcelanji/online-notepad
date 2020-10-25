package com.gcelanji.onlinenotepad.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gcelanji.onlinenotepad.dao.UserDAO;
import com.gcelanji.onlinenotepad.entity.User;




@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	
	@GetMapping("/signup")
	public String signUp(Model theModel) {
		
		User theUser = new User();
		
		theModel.addAttribute(theUser);
		
		return "sign-up-form";
		
	}
	
	@GetMapping("/login")
	public String logIn(Model theModel) {
		
		User theUser = new User();
		
		theModel.addAttribute(theUser);
		
		return "log-in-form";
		
	}
	
	@PostMapping("/createUser")
	public String createUser(@Valid @ModelAttribute("user") User theUser, BindingResult theBindingResult) {
		
		if(theBindingResult.hasErrors()) {
			return "sign-up-form";
		}
		else {
			userDAO.createUser(theUser);
			return "create-user-confirmation";
		}
		
	}

	@PostMapping("/validateUser")
	public String validateUser(@RequestParam("email") String email, @RequestParam("password") String password, Model theModel, RedirectAttributes redirectAttributes) {
		
		if(userDAO.validateUser(email,password) == null) {
			return "login-user-failed";
		}
		else {
			User  theUser = userDAO.validateUser(email, password);
			
			theModel.addAttribute("tempUser", theUser);
			
			redirectAttributes.addFlashAttribute("userId", theUser.getId());
			
			return "redirect:/notes/list";
		}
		
		
	}
	
}
