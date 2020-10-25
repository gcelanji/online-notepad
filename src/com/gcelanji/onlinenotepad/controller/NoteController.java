package com.gcelanji.onlinenotepad.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gcelanji.onlinenotepad.dao.NotesDAO;
import com.gcelanji.onlinenotepad.dao.UserDAO;
import com.gcelanji.onlinenotepad.entity.Note;
import com.gcelanji.onlinenotepad.entity.User;


@Controller
@RequestMapping("/notes")
public class NoteController {
	
	private static int userId;
	
	@Autowired
	NotesDAO notesDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("/list")
	public String listNotes(Model theModel, RedirectAttributes redirectAttributes) {
		
		try {
			int userId = (int)theModel.asMap().get("userId");
			NoteController.userId = userId;
			
			User theUser = userDAO.getUser(userId);
	        
			List<Note> notes =  notesDAO.listNotes(userId);
			
			theModel.addAttribute("user", theUser);
			
			theModel.addAttribute("notes", notes);
			
			return "list-notes";
		}
		catch(Exception e) {
			
			redirectAttributes.addFlashAttribute("userId",userId);
			
			return "redirect:/notes/list";
		}

	}
	
	@GetMapping("/showCreateNoteForm")
	public String showCreateNoteForm(Model theModel) {
		
		User theUser = userDAO.getUser(userId);
		
		theModel.addAttribute("user", theUser);
		
		Note theNote = new Note();
		
		theModel.addAttribute("note", theNote);
		
		return "create-note-form";
	}
	
	@PostMapping("/createNote")
	public String createNote (@ModelAttribute("note") Note theNote, RedirectAttributes redirectAttributes ) {
		
		notesDAO.createNote(userId, theNote);
		
		redirectAttributes.addFlashAttribute("userId",userId);
		
		return "redirect:/notes/list";
	}
	
	@GetMapping("/delete")
	public String deleteNote(@RequestParam("noteId") int noteId, RedirectAttributes redirectAttributes) {
		
		notesDAO.deleteNote(userId, noteId);
		redirectAttributes.addFlashAttribute("userId",userId);
		
		return "redirect:/notes/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("noteId") int noteId, Model theModel) {
		
		Note theNote = notesDAO.getNote(noteId);
		
		User theUser = userDAO.getUser(userId);
		
		theModel.addAttribute("user", theUser);
		
		theModel.addAttribute("note", theNote);
		
		return "create-note-form";
	}
	
	@GetMapping("/return")
	public String returnToHomePage (RedirectAttributes redirectAttributes ) {
		
		redirectAttributes.addFlashAttribute("userId",userId);
		
		return "redirect:/notes/list";
	}
}
