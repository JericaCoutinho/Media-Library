package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Post")
public class Post {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int postid;
	
	private String postimg;
	
	private String postaudio;
	
	private String postDescription;
	
	private String email;
	
	//private String user_id;
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	//private User user;

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getPostimg() {
		return postimg;
	}

	public void setPostimg(String postimg) {
		this.postimg = postimg;
	}

	public String getPostaudio() {
		return postaudio;
	}

	public void setPostaudio(String postaudio) {
		this.postaudio = postaudio;
	}

	public String getPostDescription() {
		return postDescription;
	}

	public void setPostDescription(String postDescription) {
		this.postDescription = postDescription;
	}

	

	/*@ManyToOne
	@JoinColumn(name="user_email")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}*/
	
}
