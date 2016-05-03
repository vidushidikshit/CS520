package gapp.model.dao;

import java.util.List;

import gapp.model.Department;
import gapp.model.Program;

public interface ProgramDao {
	 
	List<Program> getProgramByProgramname(String prg_name);

	void saveProgram(Program prg);
	
	void deleteProgram(Program prg);
	
	Program getProgram(Integer id);
	
	Program getProgramByName(String prg_name);
}
