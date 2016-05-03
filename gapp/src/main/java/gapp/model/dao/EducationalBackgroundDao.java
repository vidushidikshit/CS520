package gapp.model.dao;


import java.util.List;

import gapp.model.EducationalBackground;
import gapp.model.Program;


public interface EducationalBackgroundDao {
	
	EducationalBackground saveEduBack(EducationalBackground eduBack);
	
	EducationalBackground getEducationalbackground(Integer id);
	
	List<EducationalBackground> geteduBackByApplicationId(Integer application_id);
	
	void deleteEdu( EducationalBackground eduback);
	}
