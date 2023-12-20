package Qaru.Prj.error;

import org.springframework.validation.BindingResult;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class ScriptErrors {

    public List errors(BindingResult result){

        List errors = new LinkedList();

        for(int i = 0; i < result.getFieldErrors().size(); i++){
            String errorsMsg = result.getFieldErrors().get(i).getDefaultMessage() + "," + result.getFieldErrors().get(i).getField();
            System.out.println("=========== 3 > : " + errorsMsg);
            errors.add(errorsMsg);
        }

        return errors;
    }

}
