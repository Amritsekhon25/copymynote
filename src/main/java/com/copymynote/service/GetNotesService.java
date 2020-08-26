package com.copymynote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.copymynote.model.Note;
import com.copymynote.model.User;
import com.copymynote.repository.GetNoteRepository;

@Service
public class GetNotesService {

	@Autowired
	private GetNoteRepository getNoteRepository;
	
	public Page<Note> getNoteByID(Integer pageNo, Integer pageSize,User user)
    {
        Pageable paging = (Pageable) PageRequest.of(pageNo, pageSize,Sort.by("id").descending());
 
        Page<Note> pagedResult = getNoteRepository.findByuser(user, paging);
        
        pagedResult.getTotalPages();
         
       /* if(pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Note>();
        }*/
        return pagedResult;
    }
}
