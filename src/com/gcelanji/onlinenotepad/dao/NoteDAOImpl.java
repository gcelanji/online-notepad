package com.gcelanji.onlinenotepad.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gcelanji.onlinenotepad.entity.Note;
import com.gcelanji.onlinenotepad.entity.User;



@Repository
public class NoteDAOImpl implements NotesDAO {

	private java.sql.Date date = null;
	private long millis=0;  
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public List<Note> listNotes(int userId) {
		List <Note> notes = null;
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Note> theQuery =
				currentSession.createQuery("from Note where user_id =: userId order by timeDateInfo DESC");
		
		theQuery.setParameter("userId", userId);
		
		notes = theQuery.getResultList();
		
		return notes;
	}

	@Override
	@Transactional
	public void createNote(int userId, Note theNote) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		User theUser = userDAO.getUser(userId);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		theNote.setTimeDateInfo(timestamp);
		
		theUser.add(theNote);
		theNote.setUser(theUser);
		
		currentSession.merge(theNote);
	}

	@Override
	@Transactional
	public void deleteNote(int userId, int noteId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
							
		Query theQuery =
			currentSession.createQuery("delete from Note where id=:noteId and user_id=:userId");
		theQuery.setParameter("userId", userId);
		theQuery.setParameter("noteId", noteId);
				
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public Note getNote(int noteId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Note theNote = currentSession.get(Note.class, noteId);
		
		return theNote;
	}

}
