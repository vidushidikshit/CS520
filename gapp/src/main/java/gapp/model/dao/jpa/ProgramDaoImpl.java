package gapp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Department;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.ProgramDao;

@Repository
public class ProgramDaoImpl implements ProgramDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Program> getProgramByProgramname(String prg_name) {
		String Query = "from Program p where p.prg_name=:prg_name";
		
		List<Program> results = entityManager.createQuery(Query,Program.class).setParameter("prg_name", prg_name).getResultList();
		return results;
	}

	@Override
	@Transactional
	public void saveProgram(Program prg) {
		entityManager.merge(prg);
	}

	@Override
	@Transactional
	public void deleteProgram(Program prg) {
		entityManager.remove(prg);
		
	}

	@Override
	public Program getProgram(Integer id) {
		return entityManager.find( Program.class, id );
	}

	@Override
	public Program getProgramByName(String prg_name) {
String Query = "from Program p where p.prg_name= :prg_name";
		
		Program results = entityManager.createQuery(Query,Program.class).setParameter("prg_name", prg_name).getSingleResult();
        return results;		
	}

	

   

	



}