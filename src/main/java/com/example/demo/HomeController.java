package com.example.demo;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class HomeController {
	
	@RequestMapping(value="/hello", method=RequestMethod.GET)
	//@PostMapping
	public String renderFirstPage(@RequestParam Map<String,Object> model,Model viewModel) {
		
		return "index";
	}
	

}
