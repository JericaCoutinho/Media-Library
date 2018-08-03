package com.example.demo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class UploadToS3 {
	@Value("${access_id}")
	String id;

	@Value("${access_key}")
	String key;
	public String upload(String fileName, InputStream fs) {
		
		String fileURI;
		BasicAWSCredentials cred = new BasicAWSCredentials(id,key);
		
		AmazonS3 s3client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(cred))
				.withRegion(Regions.US_EAST_2)
				.build();
		PutObjectRequest putreq = new PutObjectRequest("jcterm",fileName, fs, new ObjectMetadata())
		.withCannedAcl(CannedAccessControlList.PublicRead);
		
		
		
s3client.putObject(putreq);  //File is uploaded
		
 fileURI = "http://" + "jcterm" + ".s3.amazonaws.com/" + fileName;
		
	return fileURI;
			
		}
}
