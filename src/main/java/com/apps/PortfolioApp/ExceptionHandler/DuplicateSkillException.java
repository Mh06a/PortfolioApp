package com.apps.PortfolioApp.ExceptionHandler;

public class DuplicateSkillException extends RuntimeException {
    private String message;

    public DuplicateSkillException(String message) {this.message = message ; }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}