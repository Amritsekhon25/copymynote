package com.copymynote.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.copymynote.model.Note;
import com.copymynote.model.User;

@Repository
public interface GetNoteRepository extends JpaRepository<Note, Long> {
	public Page<Note> findByuser(User user,Pageable pageable);

}
