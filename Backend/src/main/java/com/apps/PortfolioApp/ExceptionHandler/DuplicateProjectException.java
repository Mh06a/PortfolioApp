package com.apps.PortfolioApp.ExceptionHandler;

public class DuplicateProjectException extends RuntimeException {
    private String message;

    public DuplicateProjectException(String message) {
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