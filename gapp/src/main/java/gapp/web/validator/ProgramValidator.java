package gapp.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import gapp.model.Program;


@Component
public class ProgramValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {

		return Program.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Program program= (Program) target;
		if(!StringUtils.hasText(program.getPrg_name())){
			errors.rejectValue("prg_name", "error.Prgname.empty");
		}
	}

}
