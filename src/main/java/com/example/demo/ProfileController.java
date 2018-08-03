package com.example.demo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;



@Controller
public class ProfileController {
	
	@Value("${access_id}")
	String id;

	@Value("${access_key}")
	String key;
	
	@Autowired
	public UserRepository userRepo;
	
	@Autowired
	UploadToS3 s3;
	
	@GetMapping(value="/")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView renderPage()
	{
		ModelAndView indexPage = new ModelAndView();
		indexPage.setViewName("index");
		return indexPage;
	}
	
	@PostMapping(value="/upload")
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView uploadtoS3( 
			@RequestParam("file") MultipartFile image,
			@RequestParam("desc") String description,
			HttpServletRequest req	
			) throws IOException
	{ 	
		
		
		ModelAndView profilePage = new ModelAndView();
		//profilePage.setViewName("createprofile");
		
			
		String addr = s3.upload(image.getOriginalFilename(), image.getInputStream());
		
		
		
		User u =userRepo.findByEmail(req.getSession().getAttribute("email").toString());
		u.setImage(addr);
		
		u.setDescription(description);
		userRepo.save(u);
		u.getName();
		profilePage.addObject("imgSrc", addr);
		profilePage.addObject("name", u.getName());
		profilePage.addObject("desc", u.getDescription());
		profilePage.setViewName("profile");
		
		return profilePage;
			
		
			
	
		
	
			
		}
	
	@RequestMapping(value="/createprofile")
	public String edit()
	{
		return "EditProfile";
	}
	
}
