/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

import model.Product;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author santi
 */
public class ValidationProduct implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product product = (Product)o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Nombre", "rquired.Nombre", "el Nombre es requerido");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Descripcion", "rquired.Descripcion", "la Descripcion es requerido");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Stock", "rquired.Stock", "el Stock es requerido");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Precio", "rquired.Precio", "el Precio es requerido");
    }
}
