package gapp.model.dao;

import java.util.List;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.EducationalBackground;
import gapp.model.ExtraRecords;
import gapp.model.User;

public interface ApplicationDao {
	Application getApplication(Integer application_id);
	
	List<Application> getApplication();
	
	List<Application>  getApplicationByDepartment(Department dept, String term);
	
	List<Application> getApplicationByUser(User user);
	
	List<Application> getApplications(String dept, String term);
	
	List<Application> getApplicationByUser(String user_name);
	
	List<Application> getApplicationByUserId(Integer id);
	
	Application saveApplication(Application applicant);
	
	void updateApplication(Application applicant);
	
	//Application getApplicationBydegree(List<EducationalBackground> edu);
	}
