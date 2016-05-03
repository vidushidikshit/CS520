package gapp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.ApplicationStatus;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.dao.RoleDao;
import gapp.model.dao.StatusDao;

@Repository
public class StatusDaoImpl implements StatusDao{

	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public ApplicationStatus getStatusById(Integer Id) {
		return entityManager.find(ApplicationStatus.class, Id );
	}
	
	

}
