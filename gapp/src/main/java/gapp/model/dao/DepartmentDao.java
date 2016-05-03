package gapp.model.dao;

import java.util.List;

import gapp.model.Department;

public interface DepartmentDao {
	List<Department> getDepartment();

	Department getDepartmentByName(Integer id);

	List<Department> getDepartmentByDepartmentname(String dept_name);

	void saveDepartment(Department dept);
}
