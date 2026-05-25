package com.apps.PortfolioApp.ExceptionHandler;

public class ProjectNotFoundException extends RuntimeException {
    private String message ;

    public ProjectNotFoundException(String message) {this.message = message;}

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}