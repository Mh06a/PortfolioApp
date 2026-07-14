package com.apps.PortfolioApp.ExceptionHandler;

public class ProfileNotFoundException extends RuntimeException {

    public ProfileNotFoundException(String message) {
        super(message);
    }
}
