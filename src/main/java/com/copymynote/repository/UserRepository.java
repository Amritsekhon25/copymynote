package com.copymynote.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.copymynote.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
	public User findByunameAndPassword(String uname,String password);
	public User findByemailAndPassword(String email,String password);
	public User findByemail(String email);
	public User findByuname(String uname);
	public User findByrecoveryEmail(String recoveryEmail);
	public User findBymobile(String mobile);



}
