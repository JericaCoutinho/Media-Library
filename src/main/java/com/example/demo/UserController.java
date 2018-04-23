package com.example.demo;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@Autowired
	public UserRepository userRepo;
	
	@GetMapping(value="/")
	public ModelAndView renderIndex() {
		ModelAndView mv= new ModelAndView();		//create an instance 
		mv.setViewName("index");					//return index.jsp
		return mv;
		}
	
	@GetMapping(value="/facebook")
	public ModelAndView renderFB() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("FacebookIndex");
		return mv;
	}
	
	@PostMapping(value="/user/add")
	public ModelAndView saveStudent(
			@RequestParam(name="name", required=true) String name,
			@RequestParam String email) 
	{
		User n = new User();
		n.setName(name);
		System.out.println(name);
		n.setEmail(email);
		System.out.println(email);
		userRepo.save(n);							//userRepo saves the instance of student in the database
		return new ModelAndView("redirect:/users");
	}
	
	@GetMapping(value="/users")
	public ModelAndView getAllStudents() {
		
		ModelAndView mv = new ModelAndView();
		List<User> users= userRepo.findAll();
		mv.addObject("users", users);
		mv.setViewName("allUsers");
		return mv;
		
	}
	
	@GetMapping(value="/user")
	public ModelAndView getOneStudent(@RequestParam(name="email", required=true) String email) {
		ModelAndView mv= new ModelAndView();
		
		try {
			User s = userRepo.findByEmail(email);
			
				mv.addObject("user", s);
				mv.setViewName("userInfo");
				if(s== null) {
					throw new Exception("Oops!");
				}
			
		}
		catch(Exception e) {
			mv.addObject("error","User not present");
			mv.setViewName("userError");
			e.printStackTrace();
		}
		return mv;
	}
	
	@PostMapping(value="/facebookRedirect")
	public ModelAndView handleRedirect(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName")String myName,
//			@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
			HttpServletRequest req
			) {
		 req.getSession().setAttribute("name",myName);
		   
		User n = new User();
		n.setMyId(myId);
		n.setName(myName);
		System.out.println(myName);
		n.setEmail(myEmail);
		System.out.println(myEmail);
//		n.setFriends(myFriends);
		
		
		userRepo.save(n);							//userRepo saves the instance of student in the database
//		//return new ModelAndView("redirect:/users");
//		System.out.println(myId + myName + myFriends+ myEmail );
//			String[] splitted = myFriends.split("/");
//			for(int i=0; i<splitted.length; i++)
//			{
//				System.out.println(i+":"+splitted[i]);
//			}
			
			return new ModelAndView("profile");           //enter the jsp page which has the submit form button
	}

	

}
