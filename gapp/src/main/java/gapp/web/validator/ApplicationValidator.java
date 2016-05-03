package gapp.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import gapp.model.Application;



@Component
public class ApplicationValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {

		return Application.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Application AppVal= (Application) target;
		if(!StringUtils.hasText(AppVal.getCitizenship())){
			errors.rejectValue("citizenship", "error.Citizenship.empty");
		}
		
		if(!StringUtils.hasText(AppVal.getTerm())){
			errors.rejectValue("term", "error.Term.empty");
		}
		
		if(!StringUtils.hasText(AppVal.getProgram().getPrg_name())){
			errors.rejectValue("program", "error.Program.empty");
		}
		
		if(!StringUtils.hasText(AppVal.getDept().getDept_name())){
			errors.rejectValue("dept", "error.Department.empty");
		}
	}

}
