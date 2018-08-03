package com.example.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
                   	
	private String name;
	
	@Column(unique=true)
	private String email;
	
	private String myId;
	
	private String description;
	
	//private String friends;
	
	
	
	/*@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private Set<Post> posts;
	
	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}*/

	

	/*public String getFriends() {
		return friends;
	}

	public void setFriends(String friends) {
		this.friends = friends;
	}*/



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	private String image;
	
	
	
	/*private String Friends;

	public String getFriends() {
		return Friends;
	}

	public void setFriends(String friends) {
		Friends = friends;
	}*/

	


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMyId() {
		return myId;
	}

	public void setMyId(String myId) {
		this.myId = myId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
