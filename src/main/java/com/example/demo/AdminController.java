package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	public UserRepository userRepo;
	
	/*@Autowired
	public AdminRepository adminRepo;*/
	
	@GetMapping(value="/viewUsers")
	public ModelAndView getUsers()
	{
		ModelAndView mv = new ModelAndView();
		List<User> users = userRepo.findAll();
		mv.addObject("user",users);
		System.out.println("USER::"+users.toString());
		mv.setViewName("AdminProfile");
		return mv;
	}
}
