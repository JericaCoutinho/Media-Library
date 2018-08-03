package com.example.demo;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostManager {
	
	@Autowired
	UploadToS3 s3;
	
	@Autowired
	public PostRepository postRepo;
	
	

	@GetMapping(value="/recordAudio")
	public ModelAndView renderIndex() {
		
		return new ModelAndView("recordAudio");
	}
	
	@GetMapping(value="/posts")
	public ModelAndView getAllPosts( HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView();
		String k = (String) req.getSession().getAttribute("email");
		List<Post> posts= new ArrayList<>();
		posts= postRepo.findAll(); 
		mv.addObject("post", posts);
		mv.setViewName("ViewPosts");
		return mv;
		
	}
	
	
	/*@PostMapping(value="/addPost")
	public ModelAndView uploadPost( 
			@RequestParam("file") MultipartFile postimg,
			@RequestParam("postdesc") String postDescription,
			HttpServletRequest req	
			) throws IOException
	{ 	
		
		
		ModelAndView profilePage = new ModelAndView();
		profilePage.setViewName("addPost");
		
			
		String postaddr = s3.upload(postimg.getOriginalFilename(), postimg.getInputStream());
		
		
		String k=(String) req.getSession().getAttribute("email");
		Post p = postRepo.findByEmail(k);
		p.setPostimg(postaddr);
		p.setPostdesc(postDescription);
		postRepo.save(p);
		//u.getName();
		profilePage.addObject("postImg",postaddr);
		//profilePage.addObject("name", u.getName());
		profilePage.addObject("pdesc", postDescription);
		profilePage.setViewName("addPost");
		
		return profilePage;
			
		
			
	
		
	
			
		}
*/	
	@GetMapping(value="/yourpost")
	public ModelAndView getPost(
			@RequestParam("id") int ID
			//@RequestParam("comment") String comment
			)  {
		ModelAndView p = new ModelAndView("Post");
		Post po = postRepo.findByPostid(ID);
		System.out.println("posturl"+po.getPostimg());
		
	
		p.addObject("post",po);
		
		
		
		
		return p;
		
		
	}
	@GetMapping(value="/getpost")
	public ModelAndView getUSerPost(
			@RequestParam("email") String email,
			HttpServletRequest req
			//@RequestParam("comment") String comment
			)  {
		ModelAndView p = new ModelAndView("post");
		req.getSession().setAttribute("email",email);
		List<Post> po = postRepo.findAll();
		if(po!=null) {
			p.addObject("post",po);
			System.out.println("GDhs"+po.get(0).getPostid().toString());
		}else {
			p.addObject("message","No Post");
		}
//		System.out.println("posturl"+po.getPostimg());
		req.getSession().invalidate();
		return p;
//		
		
	}
	@PostMapping(value="/base64Audio")
	public ModelAndView saveAudio(HttpServletRequest req, 
			@RequestParam("recording") String recording,
			@RequestParam("pdescription") String postDescription,
			//@RequestParam("file") MultipartFile postimg,
			@RequestParam("image") String image)
	 
			throws Exception {
		
		ModelAndView successPage = new ModelAndView("success");
		System.out.println("incoming message...");
		
		/*Audio upload*/
		if(recording.isEmpty()) throw new Exception("recording data is null");
		Decoder decoder = Base64.getDecoder();
		System.out.println(recording);
		byte[] decodeByte = decoder.decode(recording.split(",")[1]);
		FileOutputStream fos;
		try {
			fos = new FileOutputStream("MyAudioTemp.webm");
			fos.write(decodeByte);
			fos.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		/*Image upload*/
		if(image.isEmpty()) throw new Exception("Could not capture image!");
		Decoder decoderImg = Base64.getDecoder();
		System.out.println(image);
		byte[] decodeByteImg = decoder.decode(image.split(",")[1]);
		FileOutputStream fosimg;
		try {
			fosimg = new FileOutputStream("banner.png");
			fosimg.write(decodeByteImg);
			fosimg.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
		String myEmail = (String) req.getSession().getAttribute("email");
		String postid = "1";
		//String postaddr = s3.upload(postimg.getOriginalFilename(), postimg.getInputStream());
		String postaddr = s3.upload(myEmail+ postid+ ".png", new FileInputStream("banner.png"));
		String audioURL = s3.upload(myEmail+ postid+ ".webm", new FileInputStream("MyAudioTemp.webm"));
		
		Post p = new Post();
		p.setEmail(myEmail);
		p.setPostaudio(audioURL);
		p.setPostimg(postaddr);
		p.setPostDescription(postDescription);
		postRepo.save(p);
		successPage.addObject("audioURL",audioURL);
		successPage.addObject("img",postaddr);
		successPage.addObject("pdescription",postDescription);
		return successPage;
	}
	@GetMapping(value="/deletepostadmin")
	public ModelAndView deletepostadmin(
			@RequestParam(name="id") int ID
			
			) {
		ModelAndView ad = new ModelAndView();
		Post po=postRepo.findByPostid(ID);
		postRepo.delete(po);
		ad.setViewName("post");
		return ad;
	}

}
