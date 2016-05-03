package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.EducationalBackground;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.EducationalBackgroundDao;

@Repository
public class EducationalBackgroundDaoImpl implements EducationalBackgroundDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public EducationalBackground saveEduBack(EducationalBackground eduBack) {
		return entityManager.merge(eduBack);
		
		
	}

	@Override
	public EducationalBackground getEducationalbackground(Integer id) {
		
		return entityManager.find( EducationalBackground.class, id );
	}

	@Override
	public List<EducationalBackground> geteduBackByApplicationId(Integer application_id) {
	
String Query = "from EducationalBackground edu where edu.application.application_id= :application_id";
		
		List<EducationalBackground> results = entityManager.createQuery(Query,EducationalBackground.class).setParameter("application_id", application_id).getResultList();
		   
		return results;
	}

	@Override
	@Transactional
	public void deleteEdu(EducationalBackground eduback) {
			entityManager.remove(eduback);
			
		
		
	}

	
}