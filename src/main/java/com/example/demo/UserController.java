package com.example.demo;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@Autowired
	public UserRepository userRepo;
	
	@Autowired
	public PostRepository postRepo;
	
	
	
	@GetMapping(value="/facebook")
	public ModelAndView renderFB() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("FacebookIndex");
		return mv;
	}
	@GetMapping(value="/admin")
	public ModelAndView renderAdmin() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("adminLogin");
		return mv;
	}
	
	/*@PostMapping(value="/user/add")
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
	}*/
	
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
				mv.setViewName("profile");
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
	
	@GetMapping(value="/userid")
	public ModelAndView getUserID(@RequestParam("id") Integer id, HttpServletRequest req) {
		ModelAndView r = new ModelAndView();
		req.getSession().setAttribute("ID",id);
		User s = userRepo.findById(id);
		r.addObject("user",s);
		r.setViewName("profile");
		req.getSession().invalidate();
		return r;
	}
	
	@PostMapping(value="/facebookRedirectAdmin")
	public ModelAndView handleAdminRedirect(
			@RequestParam(name="myName") String name,
			@RequestParam(name="myEmail") String Email
			) {
		ModelAndView ad = new ModelAndView();
		if(Email.equals("admin") && name.equals("admin"))
		{
			ad.addObject("Name",name);
			List<User> users = userRepo.findAll();
//			List<Post> posts = postRepo.findByEmail("email");
			ad.addObject("user",users);
			System.out.println("USER::"+users.toString());
			
			ad.setViewName("AdminProfile");
			
		}
		return ad;
	}
	@GetMapping(value="/edit")
	public ModelAndView editProfile(
			@RequestParam(name="myName")String myName,
			@RequestParam(name="myEmail") String myEmail) {
		 ModelAndView mv= new ModelAndView();
		User n = new User();
		
		n.setName(myName);
		System.out.println(myName);
		n.setEmail(myEmail);
		System.out.println(myEmail);
		userRepo.save(n);
		 
		mv.setViewName("createprofile");
		return mv;
	}
	
	@PostMapping(value="/facebookRedirect")
	public ModelAndView handleRedirect(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName")String myName,
			//@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
			
			HttpServletRequest req
			) {
		 
		//System.out.println("friends" +myFriends);
		 ModelAndView mv= new ModelAndView();
		 req.getSession().setAttribute("email",myEmail);
		 User u = userRepo.findByEmail(myEmail);
	//	 System.out.println("email is"+u.getEmail());
		 if(u == null) {
			 	User n = new User();
				n.setMyId(myId);
				n.setName(myName);
				System.out.println(myName);
				n.setEmail(myEmail);
				System.out.println(myEmail);
				//n.setDescription(u.getDescription());
     			//n.setFriends(myFriends);
				
     			/*String[] splitted = myFriends.split("/");
				
				for(int i=0; i<splitted.length; i=i+2)
				{	
					System.out.println(i+":"+splitted[i]);
				}*/
				userRepo.save(n);
			 
				mv.setViewName("createprofile");
			}
			else {
				//System.out.println("i am here"+u.getImage());
				mv.addObject("imgSrc", u.getImage());
				mv.addObject("name", myName);
				mv.addObject("desc", u.getDescription());
				
				//mv.addObject("FriendId:"+splitted[i]);
				mv.setViewName("profile"); 
			}
		 
		 
		
//		//return new ModelAndView("redirect:/users");
//		System.out.println(myId + myName + myFriends+ myEmail );
			
		
			/*String[] splitend = splitted.split(",");
			for(int j=0; j<splitend.length;j++)
			{
				System.out.println(j+":"+splitend[j]);
			}*/
		return mv;
	}

	
	 
	

}
