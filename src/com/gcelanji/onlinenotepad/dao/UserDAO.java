package com.gcelanji.onlinenotepad.dao;

import com.gcelanji.onlinenotepad.entity.User;

public interface UserDAO {
	public void createUser(User theUser);

	public User validateUser(String email, String password);
	
	public User getUser(int userId);
}
