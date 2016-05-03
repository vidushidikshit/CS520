package gapp.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import gapp.model.ExtraRecords;
import gapp.model.Program;


@Component
public class ExtraRecordsValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {

		return ExtraRecords.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ExtraRecords er= (ExtraRecords) target;
		if(!StringUtils.hasText(er.getRec_name())){
			errors.rejectValue("name", "error.Recname.empty");
		}
		
		if(!StringUtils.hasText(er.getRec_type())){
			errors.rejectValue("type", "error.Rectype.empty");
		}
	}

}
