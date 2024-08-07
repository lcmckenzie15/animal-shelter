package com.techelevator.exception;

public class DuplicateEmailException extends RuntimeException{
    public DuplicateEmailException() {
        super();
    }
    public DuplicateEmailException(String message) {
        super(message);
    }
    public DuplicateEmailException(String message, Exception cause) {
        super(message, cause);
    }
}
