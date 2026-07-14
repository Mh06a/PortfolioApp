package com.apps.PortfolioApp.ExceptionHandler;

import java.time.LocalDateTime;
import java.util.Map;

public class ErrorResponse {

    //step1 ----> Create vars for class :
    private String message ;
    private int status ;
    private LocalDateTime time ;
    private Map<String , String> errors;


    //step2 ----> Create a Constructor :
    public ErrorResponse(String message, int status, LocalDateTime time) {
        this.message = message;
        this.status = status;
        this.time = time;
    }

    public ErrorResponse(String message, int status, LocalDateTime time, Map<String, String> errors) {
        this.message = message;
        this.status = status;
        this.time = time;
        this.errors = errors;
    }

    // step3 ----> Getter && Setter
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public void setErrors(Map<String, String> errors) {
        this.errors = errors;
    }
}