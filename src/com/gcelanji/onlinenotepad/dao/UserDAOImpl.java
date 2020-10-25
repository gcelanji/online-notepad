package com.gcelanji.onlinenotepad.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gcelanji.onlinenotepad.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void createUser(User theUser) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.save(theUser);
	}

	@Override
	@Transactional
	public User validateUser(String email, String password) {
	
		User tempUser = null ;
		
		Session currentSession = sessionFactory.getCurrentSession();
				
		Query<User> theQuery = currentSession.createQuery("from User where email=:userEmail and password=:userPassword");
		theQuery.setParameter("userEmail", email);
		theQuery.setParameter("userPassword", password);
				
		List<User> results = theQuery.getResultList();
		
		if (results.isEmpty()) {
			return tempUser;
		}
		else {
			tempUser = results.get(0);
			return tempUser;
		}
		
	}

	@Override
	@Transactional
	public User getUser(int userId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		User theUser = currentSession.get(User.class, userId);
		
		return theUser;
	}

}
