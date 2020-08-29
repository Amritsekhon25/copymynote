package com.copymynote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.copymynote.model.User;
import com.copymynote.repository.UserRepository;

@Service
public class LoginService {

	@Autowired
	private UserRepository userRepository;

//This method validate username & password from Database
	public User validateUser(String userid, String password,boolean isEmail) {

		User user;
		if(isEmail)
		{
			user=userRepository.findByemailAndPassword(userid, password) ;
		}
		else
		{
			user=userRepository.findByunameAndPassword(userid, password) ;
		}
		return user!=null?user:null;
	}

}