package com.example.demo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.Comment;




@Repository
public interface CommentRepository extends CrudRepository<Comment, Integer> {
	//public Comment findByEmail(String email);
	public List<Comment> findAll();
	//public Comment findByPostId(int postid);

	public Comment findByPostid(Integer postid);
	

}
