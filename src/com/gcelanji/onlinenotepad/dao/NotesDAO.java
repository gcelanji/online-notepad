package com.gcelanji.onlinenotepad.dao;

import java.util.List;

import com.gcelanji.onlinenotepad.entity.Note;


public interface NotesDAO {
	public List<Note> listNotes(int userId);

	public void createNote(int userId, Note theNote);

	public void deleteNote(int userId, int noteId);

	public Note getNote(int noteId);
}
