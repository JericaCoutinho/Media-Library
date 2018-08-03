package com.example.demo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends CrudRepository<Post, Integer> {
 
	public Post findByEmail(String email);
	public Post findByPostid(Integer postid);
//	public List<Post> findByEmail(String email);
//	public Post findByEmail(String email);
	public List<Post> findAll();

}
