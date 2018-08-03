package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class CommentController {
		
	@Autowired
	PostRepository postRepo;
	
	@Autowired
	CommentRepository commentrepo;
	
	@Autowired
	UserRepository userRepo;

	@GetMapping(value="/comment")
	public ModelAndView addComment(@RequestParam("id") int ID,
			@RequestParam("comment") String comments,
			HttpServletRequest req
			) {
		ModelAndView c = new ModelAndView("Comment");
		
		String Email = (String) req.getSession().getAttribute("email");
		User us = userRepo.findByEmail(Email);
		Post po = postRepo.findByPostid(ID);
		
		Comment co = new Comment();
		System.out.println("found you"+comments);
		
		co.setComments(comments);
		System.out.println(comments);
		co.setPostid(ID);
		System.out.println(ID);
		co.setEmail(Email);
		System.out.println("Find me"+us.getName());
		commentrepo.save(co);
		
		List<Comment> u = new ArrayList<>();
		  u = commentrepo.findAll();
		 commentrepo.findByPostid(ID);
		c.addObject("usname",us);
		c.addObject("post",po);
		c.addObject("comment", u);
		//c.setViewName("Post");
		
				return c;
	}
	
}
