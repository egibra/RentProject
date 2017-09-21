package com.project.platform.renting.web.component;

import com.project.platform.renting.core.model.VerificationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Component
public class UserVerificationProcessing {

    private CustomValidation customValidation;

    private String message;
    private List<String> errors;

    @Autowired
    public UserVerificationProcessing(CustomValidation customValidation) {
        this.customValidation = customValidation;
    }

    public boolean recoverPasswordCheck(String newPassword, String passwordConfirm){
        errors = new ArrayList<>();
        if (!newPassword.equals(passwordConfirm)) {
            errors.add("Slaptažodžiai nesutampa");
            return false;
        }

        errors = customValidation.validatePassword(newPassword);
        return errors.isEmpty();
    }

    public boolean tokenExistsNot(VerificationToken token) {
        if (token == null){
            message = "Nerastas autentifikavimo kodas.";
            return true;
        }
        return false;
    }

    public boolean tokenExpired(VerificationToken token){
        Calendar cal = Calendar.getInstance();
        if((token.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0){
            message = "Autentifikavimo kodas nustojo galioti.";
            return true;
        }
        return false;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<String> getErrors() {
        return errors;
    }

    public void setErrors(List<String> errors) {
        this.errors = errors;
    }
}
