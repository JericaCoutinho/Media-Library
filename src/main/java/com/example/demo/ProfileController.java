package com.example.demo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
//	@Value("${access_id}")
//	String id;
//	
//	@Value("${access_key}")
//	String key;
//	
////	@GetMapping(value="/")
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ModelAndView renderPage()
//	{
//		ModelAndView indexPage = new ModelAndView();
//		indexPage.setViewName("index");
//		return indexPage;
//	}
//	
////	@PostMapping(value="/upload")
//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public ModelAndView uploadtoS3( 
//			@RequestParam("file") MultipartFile image
//			)
//	{ 	
//		ModelAndView profilePage = new ModelAndView();
//		profilePage.setViewName("index");
//		BasicAWSCredentials cred = new BasicAWSCredentials(id,key);
//		
//		AmazonS3 s3client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(cred))
//				.withRegion(Regions.US_EAST_2)
//				.build();
//		try {
//			PutObjectRequest putreq = new PutObjectRequest("jcterm",image.getOriginalFilename(), image.getInputStream(), new ObjectMetadata())
//			.withCannedAcl(CannedAccessControlList.PublicRead);
//			
//			
//			
//		s3client.putObject(putreq);  //File is uploaded
//			
//		String imgSrc = "http://" + "jcterm" + ".s3.amazonaws.com/" + image.getOriginalFilename();
//			
//		profilePage.addObject("imgSrc", imgSrc);
//		profilePage.setViewName("profile");
//		return profilePage;
//			
//		} catch (IOException e) {
//			 //TODO Auto-generated catch block
//			e.printStackTrace();
//			profilePage.setViewName("/Error");
//			return profilePage;
//			
//	}
//		
//		
//		
//		
//	}
	
}
