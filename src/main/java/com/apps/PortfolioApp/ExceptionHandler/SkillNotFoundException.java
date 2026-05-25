package com.apps.PortfolioApp.ExceptionHandler;

public class SkillNotFoundException extends RuntimeException{
    private String message;

    public SkillNotFoundException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}