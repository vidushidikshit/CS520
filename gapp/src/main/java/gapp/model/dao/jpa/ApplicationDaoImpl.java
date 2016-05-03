package gapp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.EducationalBackground;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Application> getApplication() {
		return entityManager.createQuery("from Application order by application_id", Application.class).getResultList();
	}
	 
	// Query by calling different objects 
	@Override
	public List<Application> getApplicationByDepartment(Department dept, String term) {

		String Query = "from Application a where a.dept= :department and a.term = :term";
		
		List<Application> results = entityManager.createQuery( Query,
	            Application.class ).setParameter( "department", dept )
	            .setParameter( "term", term )	            
	            .getResultList();
	        return results;
		
		
		
	}

	@Override
	public List<Application> getApplicationByUser(User user) {
		
		String query="from Application a where a.detail =:user";
		
		List<Application> results = entityManager.createQuery(query, Application.class).setParameter("user", user).getResultList();
		return results;
	}

	//Query by join
	@Override
	public List<Application> getApplications(String dept, String term) {

		String Query = "Select a from Application a join a.dept d where d.dept_name = :dept and a.term= :term";
		
		List<Application> results = entityManager.createQuery(Query, Application.class).setParameter("dept", dept)
				.setParameter("term", term)
				.getResultList();
		return results;
	}

	@Override
	public List<Application> getApplicationByUser(String user_name) {
		String Query = "from Application a where a.detail.username= :user_name";
		
		List<Application> con = entityManager.createQuery(Query, Application.class).setParameter("user_name", user_name)
				.getResultList();
		
		
		return con;
	}

	@Override
	public List<Application> getApplicationByUserId(Integer user_id) {
		String Query = "from Application a where a.detail.user_id= :user_id";
		
		List<Application> con = entityManager.createQuery(Query,Application.class).setParameter("user_id", user_id).getResultList();
		
		return con;
	}

	@Override
	public Application getApplication(Integer application_id) {
		return entityManager.find( Application.class, application_id );
	}

	@Override
	@Transactional
	public Application saveApplication(Application applicant) {
		return entityManager.merge(applicant);
	}

	@Override
	@Transactional
	public void updateApplication(Application applicant) {
		entityManager.persist(applicant);
	}

	
	

	

	

	
}