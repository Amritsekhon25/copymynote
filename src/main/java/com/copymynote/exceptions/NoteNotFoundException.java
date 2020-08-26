package com.copymynote.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class NoteNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public NoteNotFoundException() {
		super("Note does not exist");
	}

}
