package com.copymynote.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.copymynote.model.Note;
import com.copymynote.model.User;

@Repository
public interface NoteRepository extends JpaRepository<Note, Long> {
	public List<Note> findByuser(User user);
	public List<Note> findBytitleContaining(String title);

}
