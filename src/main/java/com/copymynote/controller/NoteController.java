package com.copymynote.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.copymynote.exceptions.NoteNotFoundException;
import com.copymynote.model.Note;
import com.copymynote.model.User;
import com.copymynote.repository.NoteRepository;
import com.copymynote.repository.UserRepository;
import com.copymynote.service.GetNotesService;

@Controller
public class NoteController {

	@Autowired
	private NoteRepository noteRepository;
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private GetNotesService getNotesService;

	
// This method used for adding the note  either from text filed or from files 
	// and have all the check for maximum notes
	@RequestMapping(value="/addNote", method = RequestMethod.POST)
	public String  showWelcomePage(ModelMap model,HttpServletRequest request,@RequestParam("saveFile") MultipartFile file,
			RedirectAttributes redirectAttributes) throws Exception{

		String userID=(String) request.getSession().getAttribute("userId");
		Optional<User> user=userRepository.findById(Long.parseLong(userID));

		ModelAndView map = new ModelAndView("viewNote");

		String noteToAdded=request.getParameter("saveNote");
		String titleToAdded=request.getParameter("saveTitle");
		String fileContent=request.getParameter("saveFileContent");

		List<Note> userNotes=noteRepository.findByuser(user.get());
		
		if(userNotes.size()>=50)
		{
			request.getSession().setAttribute("noteLimitError", true);
			return "redirect:/viewNote";

		}


		if(!StringUtils.isEmpty(fileContent))
		{
			noteToAdded=fileContent;
			titleToAdded=file.getOriginalFilename();
		}

		Note note =new Note();
		note.setTitle(titleToAdded);
		note.setCreatedDate(new Date());
		note.setNote(noteToAdded);
		note.setUser(user.get());


		try{
			noteRepository.saveAndFlush(note);
		}
		catch (Exception e) {
			request.getSession().setAttribute("isError", true);
		}
		return "redirect:/viewNote";

	}

	// This metod is used for view the list of user-notes. It have the pagination & soring  fuctionality
	@RequestMapping(value="/viewNote", method = RequestMethod.GET)
	public ModelAndView getNotesByUser(
			@RequestParam(defaultValue = "1") Integer pageNo, 
			@RequestParam(defaultValue = "10") Integer pageSize,HttpServletRequest request,ModelMap model,
			@RequestParam(required=false) String search)
	{

		if(!StringUtils.isEmpty(search))
		{
			System.out.println("search called");

			return searchNoteByTitle(search,request);
		}
		ModelAndView map = new ModelAndView("viewNote");


		List<String> notelist=new ArrayList();
		List<String> titlelist=new ArrayList();
		List<Note> noteList=new ArrayList();


		String userID=(String) request.getSession().getAttribute("userId");
				Optional<User> user; 

		if(userID!=null){
			user=userRepository.findById(Long.parseLong(userID));
			Page<Note> pageResult= getNotesService.getNoteByID(pageNo-1, pageSize, user.get());

			for (Note note2 : pageResult.getContent()) {
				notelist.add(note2.getNote());
				titlelist.add(note2.getTitle());
				noteList.add(note2);
			}
			map.addObject("notelist", noteList);
			map.addObject("titlelist", titlelist);
			map.addObject("loggedInUserName", user.get().getUname().toString());


			map.addObject("isLoggedIn", true);
			map.addObject("totalPages", pageResult.getTotalPages());

		}
		else
		{

			model.put("loggedInUser", "Your are not LoggedIn. Please Login again");
			model.put("isLoggedIn", false);	
		}
		if(request.getSession().getAttribute("isError")!=null){
			map.addObject("error", "Note is too Big!!!");
			request.getSession().setAttribute("isError", null);
		}
		if(request.getSession().getAttribute("noteLimitError")!=null){
			map.addObject("error", "Sorry,Each user can add 50 notes only !!!");
			request.getSession().setAttribute("noteLimitError", null);
		}

		return map; 
	}

	// This method is used to delete note
	@GetMapping("delete/{id}")
	public String deleteNote(@PathVariable Long id,HttpServletRequest request) {

		String userID=(String) request.getSession().getAttribute("userId");
		if(!StringUtils.isEmpty(userID)){
			Note note=noteRepository.findById(id).orElseThrow(NoteNotFoundException::new);
			noteRepository.deleteById(id);
		}
		return "redirect:/viewNote";

	}
	// This method is used to edit note
	@RequestMapping(value="/edit/{id}", method = RequestMethod.POST)
	public String  showWelcomePage1(ModelMap model,HttpServletRequest request,
			RedirectAttributes redirectAttributes,@PathVariable Long id) throws Exception{

		ModelAndView map = new ModelAndView("viewNote");

		String noteToAdded=request.getParameter("editNote");
		String titleToAdded=request.getParameter("editTitle");
		String fileContent=request.getParameter("editFileContent");
		if(!StringUtils.isEmpty(fileContent))
		{
			noteToAdded=fileContent;
			//titleToAdded=file.getName();
		}

		Note updateNote = noteRepository.findById(id).orElseThrow(NoteNotFoundException::new);
		updateNote.setTitle(titleToAdded);
		updateNote.setNote(noteToAdded);
		String userID=(String) request.getSession().getAttribute("userId");
		if(!StringUtils.isEmpty(userID)){
			Optional<User> user=userRepository.findById(Long.parseLong(userID));
			updateNote.setUser(user.get());
		}

		try{
			noteRepository.saveAndFlush(updateNote);
		}
		catch (Exception e) {
			request.getSession().setAttribute("isError", true);
		}
		return "redirect:/viewNote";

	}
	
	// This method is used to search note
	public ModelAndView searchNoteByTitle(@PathVariable String title,HttpServletRequest request) {
		List<Note> noteList=noteRepository.findBytitleContaining(title);
		String userID=(String) request.getSession().getAttribute("userId");
		ModelAndView map = new ModelAndView("viewNote");

		if(!StringUtils.isEmpty(userID)){

			Optional<User> user = null; 

			if(userID!=null){
				user=userRepository.findById(Long.parseLong(userID));
			}
			List<Note> searchNote=new ArrayList<Note>();
			for (Note note : noteList) {
				if(note.getUser().getId()==user.get().getId())
				{
					searchNote.add(note);
				}

			}

			map.addObject("notelist", searchNote);
			if(searchNote.isEmpty())
			map.addObject("emptyList", true);

			map.addObject("isSearch", true);
			map.addObject("isLoggedIn", true);
		}

		//map.addObject("notelist", new ArrayList());

		return map;

	}

}
